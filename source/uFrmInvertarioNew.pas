unit uFrmInvertarioNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, ExtCtrls, ToolEdit, CurrEdit, DBCtrls,
  FMTBcd, DB, SqlExpr, DBClient, Provider;

type
  TfrmInvertarioNew = class(TForm)
    pnlSuperior: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    sbLocCaixa: TSpeedButton;
    lbl_Lotes: TLabel;
    lbl_DTVENC: TLabel;
    edtCDPROD: TEdit;
    edtNMPROD: TEdit;
    cmbNMLOJA: TComboBox;
    edtLOTE: TEdit;
    edtDTVENC: TMaskEdit;
    pnlDados: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbl_Lote: TLabel;
    dbeUNIDADE: TDBEdit;
    dbeQTATUAL: TDBEdit;
    edtQTENTRADA: TCurrencyEdit;
    edtNRLOTE: TEdit;
    edtQUANT: TCurrencyEdit;
    pnlBotoes: TPanel;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    sqlLoja: TSQLQuery;
    dstAtualizar: TSQLDataSet;
    dspAtualizar: TDataSetProvider;
    cdsEstoque: TClientDataSet;
    cdsHistorico: TClientDataSet;
    cdsLotes: TClientDataSet;
    dsEstoque: TDataSource;
    dstHistorico: TSQLDataSet;
    dstLotes: TSQLDataSet;
    dspHistorico: TDataSetProvider;
    dspLotes: TDataSetProvider;
    cdsLotesLOT_PROCODIGO: TStringField;
    cdsLotesLOT_NRLOTE: TStringField;
    cdsLotesLOT_QUANTIDADE: TFMTBCDField;
    cdsLotesLOT_DTVENCIMENTO: TDateField;
    cdsEstoqueEST_CODIGOLOJA: TIntegerField;
    cdsEstoquePRO_CODIGO: TStringField;
    cdsEstoqueUNI_CODIGO: TStringField;
    cdsEstoqueEST_DTENTRADA: TDateField;
    cdsEstoqueEST_QUANTENTRADA: TFMTBCDField;
    cdsEstoqueEST_DTSAIDA: TDateField;
    cdsEstoqueEST_QUANTSAIDA: TFMTBCDField;
    cdsEstoqueEST_CUSTOANTERIOR: TFMTBCDField;
    cdsEstoqueEST_CUSTOMEDIO: TFMTBCDField;
    cdsEstoqueEST_MAIORCUSTO: TFMTBCDField;
    cdsEstoqueEST_QUANTIDADE: TFMTBCDField;
    cdsEstoqueEST_MINIMO: TFMTBCDField;
    cdsEstoqueULTREAJUST: TDateField;
    cdsHistoricoHIS_SEQUENCIA: TIntegerField;
    cdsHistoricoHIS_LOJA: TIntegerField;
    cdsHistoricoHIS_PRODUTO: TStringField;
    cdsHistoricoHIS_UNIDADE: TStringField;
    cdsHistoricoHIS_DATA: TDateField;
    cdsHistoricoHIS_HORA: TStringField;
    cdsHistoricoHIS_TIPO: TStringField;
    cdsHistoricoHIS_DOCUMENTO: TIntegerField;
    cdsHistoricoHIS_ANTERIOR: TFMTBCDField;
    cdsHistoricoHIS_MOVIMENTO: TFMTBCDField;
    cdsHistoricoHIS_ATUAL: TFMTBCDField;
    cdsHistoricoHIS_USUARIO: TIntegerField;
    cdsHistoricoHIS_MOTIVO: TIntegerField;
    cdsHistoricoHIS_VLCUSTO: TFMTBCDField;
    cdsHistoricoHIS_VLCOMPRA: TFMTBCDField;
    cdsHistoricoHIS_VLVENDA: TFMTBCDField;
    cdsHistoricoHIS_CODIGOBAIXA: TStringField;
    cdsHistoricoHIS_VENDEDOR: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCDPRODExit(Sender: TObject);
    procedure sbLocCaixaClick(Sender: TObject);
    procedure edtCDPRODKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDPRODEnter(Sender: TObject);
    procedure edtCDPRODChange(Sender: TObject);
    procedure edtLOTEChange(Sender: TObject);
    procedure edtLOTEExit(Sender: TObject);
    procedure edtLOTEKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTVENCExit(Sender: TObject);
    procedure edtDTVENCKeyPress(Sender: TObject; var Key: Char);
    procedure edtQTENTRADAChange(Sender: TObject);
    procedure edtQTENTRADAKeyPress(Sender: TObject; var Key: Char);
    procedure cmbNMLOJAKeyPress(Sender: TObject; var Key: Char);
    procedure BtGravarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure dspAtualizarGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspHistoricoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspLotesGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
  private
    { Private declarations }
    procedure LOJA;
    procedure LOTE;
    procedure BUSCA_PRODUTO;
    procedure BUSCA_LOJA;
    procedure CADASTRAR_PRODUTO;
    procedure BUSCA_LOTE;
  public
    { Public declarations }
  end;

var
  frmInvertarioNew: TfrmInvertarioNew;
  M_CDLOJA : integer;
  M_CDPROD, M_FLINCL, M_NRLOTE, M_FLINC_LOTE : String;

implementation

uses Udm, uDm2, udmConsulta, uFuncoes, UFrmAdmin, uFrmBuscaProdutos;

{$R *.dfm}

procedure TfrmInvertarioNew.FormShow(Sender: TObject);
begin
      dm.RefreshCDS(Dm.CdsConfig);
      //
      LOTE;
      LOJA;
      //
      pnlDados.Enabled   := False;
      //
      If (dm.CdsConfigCFG_FLLOTE.AsString = 'S') Then
      Begin
           edtLOTE.Visible    := True;
           lbl_Lotes.Visible  := True;
           //
           lbl_DTVENC.Visible := True;
           edtDTVENC.Visible  := True;
           //
           pnlSuperior.Height := 124;
      End
      Else
      Begin
           pnlSuperior.Height := 90;
           edtLOTE.Visible    := False;
           lbl_Lotes.Visible  := False;
           //
           lbl_DTVENC.Visible := False;
           edtDTVENC.Visible  := False;
      End;
      //
      dm.cdsEstoque.Close;
      //
      M_FLINC_LOTE := 'N';
end;

procedure TfrmInvertarioNew.LOJA;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select EMP_CODIGO, EMP_FANTASIA, EMP_RAZAO from EMPRESAS order by EMP_FANTASIA';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      open;
      //
      If not (IsEmpty) Then
       begin
            cmbNMLOJA.Clear;
            While not (Eof) do
            Begin
                 cmbNMLOJA.Items.Add(FieldByName('EMP_FANTASIA').AsString);
                 //
                 Next;
            End;
       End
      //
    finally
      free;
    end;
end;

procedure TfrmInvertarioNew.LOTE;
begin
    Dm.RefreshCDS(Dm.CdsConfig);
    //
    If (dm.CdsConfigCFG_FLLOTE.AsString = 'S') Then
        lbl_Lote.Visible  := True
    Else
    begin
        lbl_Lote.Visible  := False;
        edtNRLOTE.Visible := False;
    End;
end;

procedure TfrmInvertarioNew.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     {dm.cdsEstoque.Close;
     dm2.cdsLotes.Close;}
     //
     Action := caFree;
end;

procedure TfrmInvertarioNew.edtCDPRODExit(Sender: TObject);
begin
     If not uFuncoes.Empty(cmbNMLOJA.Text)
       and not uFuncoes.Empty(edtCDPROD.Text) Then
       begin
            If (dmConsultas.GetProduto(edtCDPROD.Text)) Then
            begin
                Application.MessageBox('Este produto é um serviço.','ATENÇÃO',
                   MB_OK+MB_ICONWARNING+MB_APPLMODAL);
                edtCDPROD.Clear;
                edtCDPROD.SetFocus;
                Exit;
            End
            Else
               BUSCA_PRODUTO;
       End;
end;

procedure TfrmInvertarioNew.BUSCA_LOJA;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select EMP_CODIGO, EMP_FANTASIA, EMP_RAZAO from EMPRESAS ';
  texto := texto + 'Where (EMP_FANTASIA = :pFANTASIA) ';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pFANTASIA').AsString := cmbNMLOJA.Text;
      Open;
      //
      If not (IsEmpty) Then
         M_CDLOJA := FieldByName('EMP_CODIGO').AsInteger;
    finally
      free;
    end;
end;

procedure TfrmInvertarioNew.BUSCA_PRODUTO;
var qraux, qraux2 : TSQLquery;
    texto, texto2 : string;
Begin
     BUSCA_LOJA;
     //
     M_FLINCL := 'N';
     //
     texto2 := 'Select * from ESTOQUE Where (PRO_CODIGO = :pCODIGO) and (EST_CODIGOLOJA = :pCODIGOLOJA)';
     //
     With cdsEstoque do
     begin
          Close;
          CommandText := texto2; 
          Params.ParamByName('pCODIGO').AsString      := uFuncoes.StrZero(edtCDPROD.Text,13);
          Params.ParamByName('pCODIGOLOJA').AsInteger := M_CDLOJA;
          Open;
          if (IsEmpty) Then
              begin
                   //CADASTRAR_PRODUTO;
                   M_FLINCL := 'S';
              End;
      End;
         //
         texto := 'Select PRO_CODIGO, PRO_DESCRICAO, UNI_CODIGO, UNI_ARMAZENAMENTO, ';
         texto := texto + 'PRO_VLVENDA from PRODUTOS Where (PRO_CODIGO = :pCODIGO)';
         QrAux := TSqlquery.Create(nil);
         with QrAux do
           try
             SQLConnection := dm.SQLAdmin;
             sql.Add(texto);
             Params.ParamByName('pCODIGO').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
             Open;
             //
             if not (IsEmpty) Then
              begin
                   pnlDados.Enabled := True;
                   edtCDPROD.Text := uFuncoes.StrZero(edtCDPROD.Text,13);
                   edtNMPROD.Text := FieldByName('PRO_DESCRICAO').AsString;
                   //                     
              End
           finally
             free;
           end;
         //
         If (dm.CdsConfigCFG_FLLOTE.AsString = 'S') Then
             edtLOTE.SetFocus
         Else
             if (edtQTENTRADA.Enabled) Then
                 edtQTENTRADA.SetFocus;
end;

procedure TfrmInvertarioNew.CADASTRAR_PRODUTO;
Var
    M_QTANTE, M_QTATUA : Double;
    M_DTMOVI : TDate;
    M_HOMOVI, M_CDUNID : String;
    W_NRSEQU : Integer;
begin
     Dm.RefreshCDS(Dm.CdsConfig);
     // Inicia um transação no BD
     Dm.Start;
     //
     try
         //
         M_DTMOVI := Date();
         M_HOMOVI := TimetoStr(Time);
         //
         Dm.FilterCDS(Dm.cdsProdutos, fsString, uFuncoes.StrZero(edtCDPROD.Text,13));
         //
         If not (Dm.cdsProdutos.IsEmpty) Then
              M_CDUNID := Dm.cdsProdutos.FieldByName('UNI_CODIGO').AsString;
         //  Tabela de estoque
         With cdsEstoque do
          begin
                Close;
                //CommandText := 'Select * from ESTOQUE Where (EST_CODIGOLOJA = :pCODIGOLOJA) and (PRO_CODIGO = :pCODIGO)';
                Params.ParamByName('pCODIGOLOJA').AsInteger := M_CDLOJA;
                Params.ParamByName('pCODIGO').AsString      := uFuncoes.StrZero(edtCDPROD.Text,13);
                Open;
          End;
          // Tabela de Estoque
          M_QTANTE := 0;
          If (cdsEstoque.IsEmpty) Then  // Se não encontrar
          begin
               cdsEstoque.Append;
               cdsEstoque.FieldByName('EST_CODIGOLOJA').AsInteger := M_CDLOJA;
               cdsEstoque.FieldByName('PRO_CODIGO').AsString      := uFuncoes.StrZero(edtCDPROD.Text,13);
               cdsEstoque.FieldByName('UNI_CODIGO').AsString      := M_CDUNID;
               cdsEstoque.FieldByName('EST_DTENTRADA').AsDateTime := M_DTMOVI;
               cdsEstoque.FieldByName('EST_QUANTENTRADA').AsFloat := 0;
               cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat   := 0;
               M_QTATUA := cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
               // Grava
               cdsEstoque.ApplyUpdates(0);
          End;
          //
          Dm.CdsConfig.edit;
          Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat :=
                     Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat+1;
          Dm.CdsConfig.Post;
          Dm.CdsConfig.ApplyUpdates(0);
          //
          W_NRSEQU := Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsInteger;
          // Tabela de historico
          With cdsHistorico do
           Begin
                Close;
                CommandText := 'Select * from HISTORICO Where (HIS_SEQUENCIA = :pSEQUENCIA) '
                        +' and (HIS_LOJA = :pLOJA) AND (HIS_PRODUTO =  :pPRODUTO) ';
                Params.ParamByName('pSEQUENCIA').AsInteger := W_NRSEQU;
                Params.ParamByName('pLOJA').AsInteger      := M_CDLOJA;
                Params.ParamByName('pPRODUTO').AsString    := uFuncoes.StrZero(edtCDPROD.Text,13);
                Open;
                //
                If (Active) Then
                begin
                     Append;
                     FieldByName('HIS_SEQUENCIA').AsInteger := W_NRSEQU;
                     FieldByName('HIS_LOJA').AsInteger      := M_CDLOJA;
                     FieldByName('HIS_PRODUTO').AsString    := uFuncoes.StrZero(edtCDPROD.Text,13);;
                     FieldByName('HIS_UNIDADE').AsString    := M_CDUNID;
                     FieldByName('HIS_DATA').AsDateTime     := M_DTMOVI;
                     FieldByName('HIS_HORA').AsString       := M_HOMOVI;
                     FieldByName('HIS_TIPO').AsString       := 'E';
                     FieldByName('HIS_ANTERIOR').AsFloat    := M_QTANTE;
                     FieldByName('HIS_MOVIMENTO').AsFloat   := 0;
                     FieldByName('HIS_ATUAL').AsFloat       := M_QTATUA;
                     FieldByName('HIS_USUARIO').AsInteger   := StrtoInt(UFrmAdmin.M_CDUSUA);
                     Post;
                     ApplyUpdates(0);
                End;
           End;   // fim-with- cdsHistorico
           // Grava
           Dm.Comit(Dm.Transc);   // on success, commit the changes
           //
     Except
          on Exc:Exception do
          begin
              Application.MessageBox(PChar('Erro na atualização do estoque!!! '
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              //  Cancelar transação no BD.
              Dm.Rollback;
          End;
     End;
end;

procedure TfrmInvertarioNew.sbLocCaixaClick(Sender: TObject);
begin
     If uFuncoes.Empty(cmbNMLOJA.Text) Then
     Begin
          Application.MessageBox(PChar('Selecione a loja!!! '),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbNMLOJA.SetFocus;
          Exit;
     End;
     //
     edtCDPROD.SetFocus;
     M_CDPROD := edtCDPROD.Text;
     //
      with TfrmBuscaProduto.create(self) do
        try
           uFrmBuscaProdutos.M_NRFROM := 2;
           showmodal;
        finally
            if not (cdsBusca.IsEmpty) Then
                edtCDPROD.Text := M_CDPROD;
                //cdsBuscaPRO_CODIGO.AsString
            free;
        end;
      //
      Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmInvertarioNew.edtCDPRODKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13]) then
        key:=#0;
     //
     If (Key = #13) and not uFuncoes.Empty(cmbNMLOJA.Text)
       and uFuncoes.Empty(edtCDPROD.Text) Then
     begin
          Key := #0;
          sbLocCaixaClick(Sender);
     End;
     //
     If (Key = #13) and not uFuncoes.Empty(cmbNMLOJA.Text)
       and not uFuncoes.Empty(edtCDPROD.Text) Then
     begin
          Key := #0;
          Perform(WM_NEXTDLGCTL, 0, 0);
          //BUSCA_PRODUTO
     End;
end;

procedure TfrmInvertarioNew.edtCDPRODEnter(Sender: TObject);
begin
     If uFuncoes.Empty(cmbNMLOJA.Text) Then
     Begin
          Application.MessageBox(PChar('Selecione a loja!!! '),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbNMLOJA.SetFocus;
          Exit;
     End;
     //
     dm.cdsEstoque.Close;
     edtNMPROD.Clear;
     edtLOTE.Clear;
     edtDTVENC.Clear;
     edtDTVENC.Enabled := False;
     //
     BtCancelar.Enabled := False;
     BtGravar.Enabled   := False;
     //
     edtNRLOTE.Clear;
     edtQTENTRADA.Clear;
     pnlDados.Enabled := False;
     //
     edtCDPROD.Clear;
end;

procedure TfrmInvertarioNew.edtCDPRODChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDPROD.Text) Then
     begin
          If (cdsEstoque.Active) Then
             cdsEstoque.Close;
          //   
          edtNMPROD.Clear;
          //
          BtCancelar.Enabled := False;
          BtGravar.Enabled   := False;
     End;
end;

procedure TfrmInvertarioNew.edtLOTEChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtLOTE.Text) Then
        Begin
             dm2.cdsLotes.Close;
             edtNRLOTE.Clear;
             edtDTVENC.Clear;
             edtQUANT.Clear;
        End;
end;

procedure TfrmInvertarioNew.edtLOTEExit(Sender: TObject);
begin
     If not uFuncoes.Empty (cmbNMLOJA.Text)
       and not uFuncoes.Empty(edtCDPROD.Text) Then
          BUSCA_LOTE;
end;

procedure TfrmInvertarioNew.edtLOTEKeyPress(Sender: TObject;
  var Key: Char);
begin
     //
     If (Key = #13) and not uFuncoes.Empty(cmbNMLOJA.Text)
       and not uFuncoes.Empty(edtCDPROD.Text)
       and not uFuncoes.Empty(edtLOTE.Text) Then
         edtQTENTRADA.SetFocus;
end;

procedure TfrmInvertarioNew.edtDTVENCExit(Sender: TObject);
begin
    If (edtDTVENC.Text <> '  /  /    ') Then
      try
          StrToDate(edtDTVENC.Text);
      except
          on EConvertError do
          begin
               ShowMessage ('Data Inválida!');
               edtDTVENC.Clear;
               edtDTVENC.SetFocus;
          End;
      end;

end;

procedure TfrmInvertarioNew.edtDTVENCKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (Key = #13) and (edtDTVENC.Text <> '  /  /    ') Then
     Begin
          Key := #0;
          edtQTENTRADA.SetFocus;
     End;
end;

procedure TfrmInvertarioNew.BUSCA_LOTE;
Var
    W_NRLOTE : String;
begin
     //
     Dm.RefreshCDS(Dm.CdsConfig);
     //
     If (dm.CdsConfigCFG_FLLOTE.AsString = 'S') Then
        Begin
             If uFuncoes.Empty(edtLOTE.Text) Then
                 W_NRLOTE := 'GERAL'
             Else
                 W_NRLOTE := edtLOTE.Text;
             //
             With cdsLotes do
              Begin
                   Close;
                   //  CommandText := 'Select * from LOTES Where (LOT_PROCODIGO = :pCODIGO) AND (LOT_NRLOTE = :pLOTE)';
                   Params.ParamByName('pCODIGO').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
                   Params.ParamByName('pLOTE').AsString   := W_NRLOTE;
                   Open;
                   //
                   If NOT (IsEmpty) Then
                   begin
                       M_NRLOTE := FieldByName('LOT_NRLOTE').AsString;
                       edtNRLOTE.Text     := W_NRLOTE;
                       edtDTVENC.Text     := FieldByName('LOT_DTVENCIMENTO').AsString;
                       edtQUANT.Value     := FieldByName('LOT_QUANTIDADE').AsFloat;
                       //
                       If (M_NRLOTE = 'GERAL') Then
                       Begin
                           edtDTVENC.Enabled := False;
                           edtQTENTRADA.SetFocus;
                       End;
                       edtDTVENC.Enabled  := False;
                       //
                       edtQTENTRADA.SetFocus;
                   End
                   Else
                   Begin
                       M_NRLOTE := W_NRLOTE;
                       edtNRLOTE.Text     := M_NRLOTE;
                       edtQUANT.Value     := 0;
                       If (M_NRLOTE = 'GERAL') Then
                       Begin
                           edtDTVENC.Enabled := False;
                           edtQTENTRADA.SetFocus;
                       End
                       Else
                       begin
                           edtDTVENC.Enabled  := True;
                           edtDTVENC.SetFocus;
                       End;
                   End;
              End;  // fim-with-cdsLotes
        End
        Else
             M_NRLOTE := 'GERAL';
end;

procedure TfrmInvertarioNew.edtQTENTRADAChange(Sender: TObject);
begin
     If (edtQTENTRADA.Value <>0)
       or not uFuncoes.Empty(edtQTENTRADA.Text) Then
     begin
          BtCancelar.Enabled := True;
          BtGravar.Enabled   := True;
     End
     Else
     begin
          BtCancelar.Enabled := False;
          BtGravar.Enabled   := False;
     End;
end;

procedure TfrmInvertarioNew.edtQTENTRADAKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #27) Then
     Begin
          key := #0;
          edtCDPROD.Clear;
          edtCDPROD.SetFocus;
     End;
end;

procedure TfrmInvertarioNew.cmbNMLOJAKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (Key = #13) and not uFuncoes.Empty(cmbNMLOJA.Text) Then
     begin
          Key := #0;
          edtCDPROD.SetFocus;
     End;

end;

procedure TfrmInvertarioNew.BtGravarClick(Sender: TObject);
Var
    M_OPERAC, M_HOATUA, M_CDPROD, W_CDUNID : String;
    M_QTANTE, M_QTATUA : Double;
    M_DTATUA : TDate;
    W_NRSEQU : Integer;
    M_VLCOMP, M_VLCUST, M_VLVENDPRO : Real;
    qraux : TSQLquery;
    texto : string;
begin
       Dm.RefreshCDS(Dm.CdsConfig);
       //
       If (dm.CdsConfigCFG_FLLOTE.AsString = 'S') AND (edtNRLOTE.Text <> 'GERAL')
          AND (edtDTVENC.Text = '  /  /    ')  Then
         Begin
             edtDTVENC.SetFocus;
             Exit;
         End;
        //
        M_VLCOMP     := 0;
        M_VLCUST     := 0;
        M_VLVENDPRO  := 0;
        //
        Dm.FilterCDS(Dm.cdsProdutos, fsString, uFuncoes.StrZero(edtCDPROD.Text,13));
        //
        If not (Dm.cdsProdutos.IsEmpty) Then
        Begin
             W_CDUNID     := Dm.cdsProdutos.FieldByName('UNI_CODIGO').AsString;
             M_VLCOMP     := Dm.cdsProdutos.FieldByName('PRO_VLCOMPRA').AsCurrency;
             M_VLCUST     := Dm.cdsProdutos.FieldByName('PRO_VLCUSTO').AsCurrency;
             M_VLVENDPRO  := Dm.cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency;
        End;
        {texto := 'Select PRO_CODIGO, PRO_BARRAS, PRO_VLCOMPRA, PRO_VLCUSTO, PRO_VLVENDA, UNI_CODIGO from PRODUTOS where (PRO_CODIGO = :pCODIGO)';
        QrAux := TSqlquery.Create(nil);
        with QrAux do
          try
              SQLConnection := dm.SQLAdmin;
              sql.Add(texto);
              Params.ParamByName('pCODIGO').AsString := cdsEstoque.FieldByName('PRO_CODIGO').AsString;
              open;
              //
              If not (IsEmpty) Then
               begin
               End;
          finally
              free;
          end;}
        //
       Dm.RefreshCDS(Dm.CdsConfig);
       // Inicia um transação no BD
       Dm.Start;
       //
       Try
          M_DTATUA := Date();
          M_HOATUA := TimetoStr(Time);
          //
          If (M_FLINCL = 'S') Then
          Begin
                // ESTOQUE
              If (cdsEstoque.Active) Then
              begin
                cdsEstoque.Append;
                cdsEstoqueEST_CODIGOLOJA.AsInteger := M_CDLOJA;
                cdsEstoquePRO_CODIGO.AsString      := uFuncoes.StrZero(edtCDPROD.Text,13);
                cdsEstoqueUNI_CODIGO.AsString      := W_CDUNID;
                M_QTANTE := cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                //
                cdsEstoque.FieldByName('EST_DTENTRADA').AsDateTime := M_DTATUA;
                cdsEstoque.FieldByName('EST_QUANTENTRADA').AsFloat := edtQTENTRADA.Value;
                cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat   :=
                      (cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat -
                      edtQUANT.Value) +  edtQTENTRADA.Value;
                //
                M_QTATUA := cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                //
                cdsEstoque.ApplyUpdates(0);
                //
              End;
                {Dm.CdsConfig.edit;
                Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat :=
                     Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat+1;
                Dm.CdsConfig.ApplyUpdates(0);
                //
                W_NRSEQU := Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsInteger;
                // HISTORICO
                With cdsHistorico do
                Begin
                     Active := False;
                     CommandText := 'Select * from HISTORICO Where (HIS_SEQUENCIA = :pSEQUENCIA) '
                                   +' and (HIS_LOJA = :pLOJA) AND (HIS_PRODUTO =  :pPRODUTO) ';
                     Params.ParamByName('pSEQUENCIA').AsInteger := W_NRSEQU;
                     Params.ParamByName('pLOJA').AsInteger      := M_CDLOJA;
                     Params.ParamByName('pPRODUTO').AsString    := cdsEstoque.FieldByName('PRO_CODIGO').AsString;
                     Active := True;
                End;
                //
                With cdsHistorico do
                Begin
                     Append;
                     FieldByName('HIS_SEQUENCIA').AsInteger := W_NRSEQU;
                     FieldByName('HIS_LOJA').AsInteger      := M_CDLOJA;
                     FieldByName('HIS_PRODUTO').AsString    := cdsEstoque.FieldByName('PRO_CODIGO').AsString;
                     FieldByName('HIS_UNIDADE').AsString    := cdsEstoque.FieldByName('UNI_CODIGO').AsString;
                     FieldByName('HIS_DATA').AsDateTime     := M_DTATUA;
                     FieldByName('HIS_HORA').AsString       := M_HOATUA;
                     FieldByName('HIS_TIPO').AsString       := 'E';
                     FieldByName('HIS_ANTERIOR').AsFloat    := M_QTANTE;
                     FieldByName('HIS_MOVIMENTO').AsCurrency  := cdsEstoque.FieldByName('EST_QUANTENTRADA').AsFloat;
                     FieldByName('HIS_ATUAL').AsFloat       := M_QTATUA;
                     FieldByName('HIS_VLCUSTO').AsCurrency  := M_VLCUST;
                     FieldByName('HIS_VLCOMPRA').AsCurrency := M_VLCOMP;
                     FieldByName('HIS_VLVENDA').AsCurrency  := M_VLVENDPRO;
                     FieldByName('HIS_USUARIO').AsInteger   := StrtoInt(UFrmAdmin.M_CDUSUA);
                     Post;
                     ApplyUpdates(0);
                End; }
          End
          Else
          Begin
                // ESTOQUE
                cdsEstoque.Edit;
                M_QTANTE := cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                //
                cdsEstoque.FieldByName('EST_DTENTRADA').AsDateTime := M_DTATUA;
                cdsEstoque.FieldByName('EST_QUANTENTRADA').AsFloat :=
                          edtQTENTRADA.Value-dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                //dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat   := edtQTENTRADA.Value;
                cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat   :=
                      (cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat - edtQUANT.Value) +
                      edtQTENTRADA.Value;
                //
                M_QTATUA := cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                //
                cdsEstoque.ApplyUpdates(0);
          End;
          //
          Dm.CdsConfig.edit;
          Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat :=
                Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat+1;
          Dm.CdsConfig.ApplyUpdates(0);
          //
          W_NRSEQU := dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsInteger;
          // HISTORICO
          With cdsHistorico do
           Begin
                Active := False;
                CommandText := 'Select * from HISTORICO Where (HIS_SEQUENCIA = :pSEQUENCIA) '
                              +' and (HIS_LOJA = :pLOJA) AND (HIS_PRODUTO =  :pPRODUTO) ';
                Params.ParamByName('pSEQUENCIA').AsInteger := W_NRSEQU;
                Params.ParamByName('pLOJA').AsInteger      := M_CDLOJA;
                Params.ParamByName('pPRODUTO').AsString    := cdsEstoque.FieldByName('PRO_CODIGO').AsString;
                Active := True;
           End;
           //
           With cdsHistorico do
           Begin
                Append;
                FieldByName('HIS_SEQUENCIA').AsInteger := W_NRSEQU;
                FieldByName('HIS_LOJA').AsInteger      := M_CDLOJA;
                FieldByName('HIS_PRODUTO').AsString    := cdsEstoque.FieldByName('PRO_CODIGO').AsString;
                FieldByName('HIS_UNIDADE').AsString    := cdsEstoque.FieldByName('UNI_CODIGO').AsString;
                FieldByName('HIS_DATA').AsDateTime     := M_DTATUA;
                FieldByName('HIS_HORA').AsString       := M_HOATUA;
                FieldByName('HIS_TIPO').AsString       := 'E';
                FieldByName('HIS_ANTERIOR').AsFloat    := M_QTANTE;
                FieldByName('HIS_MOVIMENTO').AsFloat   := cdsEstoque.FieldByName('EST_QUANTENTRADA').AsFloat;
                FieldByName('HIS_ATUAL').AsFloat       := M_QTATUA;
                FieldByName('HIS_VLCUSTO').AsCurrency  := M_VLCUST;
                FieldByName('HIS_VLCOMPRA').AsCurrency := M_VLCOMP;
                FieldByName('HIS_VLVENDA').AsCurrency  := M_VLVENDPRO;
                FieldByName('HIS_USUARIO').AsInteger   := StrtoInt(UFrmAdmin.M_CDUSUA);
                Post;
                ApplyUpdates(0);
           End;
          // Lote
          M_CDPROD := cdsEstoque.FieldByName('PRO_CODIGO').AsString;
          If not uFuncoes.empty(edtNRLOTE.Text) Then
              M_NRLOTE := edtNRLOTE.Text
          Else
              M_NRLOTE := 'GERAL';
          //
          With cdsLotes do
          begin
               Active := False;
               CommandText := 'Select * from LOTES Where (LOT_NRLOTE = :pLOTE) and (LOT_PROCODIGO = :pCODIGO)';
               Params.ParamByName('pLOTE').AsString   := M_NRLOTE;
               Params.ParamByName('pCODIGO').AsString := M_CDPROD;
               Active := True;
          End;
          //
          If (cdsLotes.IsEmpty) Then
           begin
               With cdsLotes do
                   begin
                        Append;
                        FieldByName('LOT_PROCODIGO').AsString  := M_CDPROD;
                        FieldByName('LOT_NRLOTE').AsString     := M_NRLOTE;
                        FieldByName('LOT_QUANTIDADE').AsFloat  := edtQTENTRADA.Value;
                        If (M_NRLOTE <> 'GERAL') Then
                            FieldByName('LOT_DTVENCIMENTO').AsDateTime := StrtoDate(edtDTVENC.Text);
                        //
                        ApplyUpdates(0);
                   End;
           End
           Else
           Begin
               With cdsLotes do
                    Begin
                         Edit;
                         FieldByName('LOT_QUANTIDADE').AsFloat  := edtQTENTRADA.Value;
                         //
                         Post;
                         ApplyUpdates(0);
                    End;
           End;
           // Grava
           Dm.Comit(Dm.Transc);  // on success, commit the changes
           //
           Application.MessageBox (PChar('Atualização concluída com sucesso.'),
                     'ATENÇÃO',MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           //
           edtCDPROD.Clear;
           edtCDPROD.SetFocus;
       Except
          on Exc:Exception do
          begin
              Application.MessageBox(PChar('Erro na atualização do estoque!!! '
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              //  Cancelar transação no BD.
              Dm.Rollback;
              //
             Close;
          End;
       End;
end;

procedure TfrmInvertarioNew.BtCancelarClick(Sender: TObject);
begin
     edtQTENTRADA.Clear; 
     edtCDPROD.Clear;
     edtCDPROD.SetFocus;
end;

procedure TfrmInvertarioNew.dspAtualizarGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'ESTOQUE';
end;

procedure TfrmInvertarioNew.dspHistoricoGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
    TableName := 'HISTORICO';
end;

procedure TfrmInvertarioNew.dspLotesGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
    TableName := 'LOTES';
end;

end.
