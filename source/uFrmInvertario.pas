unit uFrmInvertario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, FMTBcd, DB, SqlExpr,
  ToolEdit, CurrEdit, Mask, DBXpress;

type
  TfrmInvertario = class(TForm)
    pnlSuperior: TPanel;
    pnlDados: TPanel;
    pnlBotoes: TPanel;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    Label2: TLabel;
    Label1: TLabel;
    edtCDPROD: TEdit;
    sbLocCaixa: TSpeedButton;
    edtNMPROD: TEdit;
    qryLojas: TSQLQuery;
    qryLojasEMP_CODIGO: TIntegerField;
    qryLojasEMP_FANTASIA: TStringField;
    qryLojasEMP_RAZAO: TStringField;
    cmbNMLOJA: TComboBox;
    Label4: TLabel;
    dbeUNIDADE: TDBEdit;
    Label5: TLabel;
    dbeQTATUAL: TDBEdit;
    edtQTENTRADA: TCurrencyEdit;
    Label6: TLabel;
    BtSair: TBitBtn;
    qryProduto: TSQLQuery;
    lbl_Lote: TLabel;
    edtNRLOTE: TEdit;
    edtLOTE: TEdit;
    lbl_Lotes: TLabel;
    edtDTVENC: TMaskEdit;
    lbl_DTVENC: TLabel;
    edtQUANT: TCurrencyEdit;
    procedure edtCDPRODKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure cmbNMLOJAKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDPRODChange(Sender: TObject);
    procedure edtQTENTRADAChange(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure edtCDPRODEnter(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure sbLocCaixaClick(Sender: TObject);
    procedure edtQTENTRADAKeyPress(Sender: TObject; var Key: Char);
    procedure BtSairClick(Sender: TObject);
    procedure edtCDPRODExit(Sender: TObject);
    procedure edtNMPRODEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtLOTEExit(Sender: TObject);
    procedure edtLOTEChange(Sender: TObject);
    procedure edtLOTEKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTVENCExit(Sender: TObject);
    procedure edtDTVENCKeyPress(Sender: TObject; var Key: Char);
  private
    procedure LOJA;
    procedure BUSCA_PRODUTO;
    procedure BUSCA_LOJA;
    procedure CADASTRAR_PRODUTO;
    procedure LOTE;
    procedure BUSCA_LOTE;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInvertario: TfrmInvertario;
  TD : TTransactionDesc;
  M_CDLOJA : integer;
  M_CDPROD, M_FLINCL, M_NRLOTE, M_FLINC_LOTE : String;

implementation

uses udmConsulta, uFuncoes, Udm, UFrmAdmin, uFrmBuscaProdutos, uDm2, uFrmSeleLote,
  DBClient, uFrmBuscaDados;

{$R *.dfm}

{ TfrmInvertario }

procedure TfrmInvertario.BUSCA_LOJA;
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

procedure TfrmInvertario.BUSCA_PRODUTO;
var qraux : TSQLquery;
    texto : string;
begin
     BUSCA_LOJA;
     //
     M_FLINCL := 'N';
     //
     dm.cdsEstoque.Close;
     With dm.dstEstoque do
     Begin
          Active := False;
          Params.ParamByName('pCODIGOLOJA').AsInteger := M_CDLOJA;
          Params.ParamByName('pCODIGO').AsString      := uFuncoes.StrZero(edtCDPROD.Text,13);
          Active := True;
     End;
     dm.cdsEstoque.Open;
     //
     If (dm.cdsEstoque.IsEmpty) Then
     begin
          //
          CADASTRAR_PRODUTO;
          M_FLINCL := 'S';
     End;
     //
        { With dmConsultas.qryProdutos do
         Begin
              Close;
              //Params.ParamByName('pCODIGO').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
              Params[0].AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
              Open;
         End;}
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
              End
           finally
             free;
           end;
         //
         If (dm.CdsConfigCFG_FLLOTE.AsString = 'S') Then
             edtLOTE.SetFocus
         Else
             edtQTENTRADA.SetFocus;
end;

procedure TfrmInvertario.LOJA;
begin
     With qryLojas do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select EMP_CODIGO, EMP_FANTASIA, EMP_RAZAO from EMPRESAS');
          SQL.Add('order by EMP_FANTASIA');
          Open;
          First;
     End;
     //
     While not (qryLojas.Eof) do
     Begin
          cmbNMLOJA.Items.Add(qryLojas.FieldByName('EMP_FANTASIA').AsString);
          //
          qryLojas.Next;
     End;
end;

procedure TfrmInvertario.edtCDPRODKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmInvertario.FormShow(Sender: TObject);
begin
      dm.parametros;
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

procedure TfrmInvertario.cmbNMLOJAKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #13) and not uFuncoes.Empty(cmbNMLOJA.Text) Then
     begin
          Key := #0;
          edtCDPROD.SetFocus;
     End;
end;

procedure TfrmInvertario.edtCDPRODChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDPROD.Text) Then
     begin
          dm.cdsEstoque.Close;
          edtNMPROD.Clear;
          //
          BtCancelar.Enabled := False;
          BtGravar.Enabled   := False;
     End;
end;

procedure TfrmInvertario.edtQTENTRADAChange(Sender: TObject);
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

procedure TfrmInvertario.BtCancelarClick(Sender: TObject);
begin
     edtQTENTRADA.Clear; 
     edtCDPROD.Clear;
     edtCDPROD.SetFocus;
end;

procedure TfrmInvertario.edtCDPRODEnter(Sender: TObject);
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

procedure TfrmInvertario.BtGravarClick(Sender: TObject);
Var
    M_OPERAC, M_HOATUA, M_CDPROD : String;
    M_QTANTE, M_QTATUA : Double;
    M_DTATUA : TDate;
    W_NRSEQU : Integer;
    M_VLCOMP, M_VLCUST, M_VLVENDPRO : Real;
begin
     Dm.RefreshCDS(Dm.CdsConfig);
     //
       If (dm.CdsConfigCFG_FLLOTE.AsString = 'S') AND (edtNRLOTE.Text <> 'GERAL')
          AND (edtDTVENC.Text = '  /  /    ')  Then
         Begin
             edtDTVENC.SetFocus;
             Exit;
         End;
       // Inicia um transação no BD
       TD.TransactionID  := StrtoInt(UFrmAdmin.M_CDUSUA);
       TD.IsolationLevel := xilREADCOMMITTED;
       Dm.SqlAdmin.StartTransaction(TD);
       //
       Try
          M_DTATUA := Date();
          M_HOATUA := TimetoStr(Time);
          //
          If (M_FLINCL = 'S') Then
          Begin
               // ESTOQUE
               dm.cdsEstoque.Edit;
                M_QTANTE := dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                //
                dm.cdsEstoque.FieldByName('EST_DTENTRADA').AsDateTime := M_DTATUA;
                dm.cdsEstoque.FieldByName('EST_QUANTENTRADA').AsFloat := edtQTENTRADA.Value;
                dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat   :=
                      (dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat -
                      edtQUANT.Value) +
                      edtQTENTRADA.Value;
                //
                M_QTATUA := dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                //
                dm.cdsEstoque.Post;
                dm.cdsEstoque.ApplyUpdates(0);
                //
                Dm.CdsConfig.edit;
                Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat :=
                     Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat+1;
                Dm.CdsConfig.Post;
                Dm.CdsConfig.ApplyUpdates(0);
                //
                W_NRSEQU := Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsInteger;
                // HISTORICO
                Dm.cdsHistorico.Close;
                With Dm.dstHistorico do
                Begin
                     Active := False;
                     CommandText := 'Select * from HISTORICO Where (HIS_SEQUENCIA = :pSEQUENCIA) '
                                   +' and (HIS_LOJA = :pLOJA) AND (HIS_PRODUTO =  :pPRODUTO) ';
                     Params.ParamByName('pSEQUENCIA').AsInteger := W_NRSEQU;
                     Params.ParamByName('pLOJA').AsInteger      := M_CDLOJA;
                     Params.ParamByName('pPRODUTO').AsString    := dm.cdsEstoque.FieldByName('PRO_CODIGO').AsString;
                     Active := True;
                End;
                Dm.cdsHistorico.Open;
                //
                //With DM2.qryProdutos do
                With DM.cdsConsulta do
                Begin
                     Active := False;
                     CommandText := 'Select PRO_CODIGO, PRO_VLCOMPRA, PRO_VLCUSTO, PRO_VLVENDA from PRODUTOS Where (PRO_CODIGO = :pCODIGO) ';
                     Params.ParamByName('pCODIGO').AsString := dm.cdsEstoque.FieldByName('PRO_CODIGO').AsString;
                     Active := True;
                End;
                //
                If not (DM.cdsConsulta.IsEmpty) Then
                Begin
                     M_VLCOMP     := DM.cdsConsulta.FieldByName('PRO_VLCOMPRA').AsCurrency;
                     M_VLCUST     := DM.cdsConsulta.FieldByName('PRO_VLCUSTO').AsCurrency;
                     M_VLVENDPRO  := DM.cdsConsulta.FieldByName('PRO_VLVENDA').AsCurrency;
                End;
                //
                With Dm.cdsHistorico do
                Begin
                     Append;
                     FieldByName('HIS_SEQUENCIA').AsInteger := W_NRSEQU;
                     FieldByName('HIS_LOJA').AsInteger      := M_CDLOJA;
                     FieldByName('HIS_PRODUTO').AsString    := dm.cdsEstoque.FieldByName('PRO_CODIGO').AsString;
                     FieldByName('HIS_UNIDADE').AsString    := dm.cdsEstoque.FieldByName('UNI_CODIGO').AsString;
                     FieldByName('HIS_DATA').AsDateTime     := M_DTATUA;
                     FieldByName('HIS_HORA').AsString       := M_HOATUA;
                     FieldByName('HIS_TIPO').AsString       := 'E';
                     FieldByName('HIS_ANTERIOR').AsFloat    := M_QTANTE;
                     FieldByName('HIS_MOVIMENTO').AsCurrency  := dm.cdsEstoque.FieldByName('EST_QUANTENTRADA').AsFloat;
                     FieldByName('HIS_ATUAL').AsFloat       := M_QTATUA;
                     FieldByName('HIS_VLCUSTO').AsCurrency  := M_VLCUST;
                     FieldByName('HIS_VLCOMPRA').AsCurrency := M_VLCOMP;
                     FieldByName('HIS_VLVENDA').AsCurrency  := M_VLVENDPRO;
                     FieldByName('HIS_USUARIO').AsInteger   := StrtoInt(UFrmAdmin.M_CDUSUA);
                     Post;
                     ApplyUpdates(0);
                End;
          End
          Else
          Begin
                // ESTOQUE
                dm.cdsEstoque.Edit;
                M_QTANTE := dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                //
                dm.cdsEstoque.FieldByName('EST_DTENTRADA').AsDateTime := M_DTATUA;
                dm.cdsEstoque.FieldByName('EST_QUANTENTRADA').AsFloat :=
                          edtQTENTRADA.Value-dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                //dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat   := edtQTENTRADA.Value;
                dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat   :=
                      (dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat  -
                      edtQUANT.Value) +
                      edtQTENTRADA.Value;
                //
                M_QTATUA := dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                dm.cdsEstoque.Post;
                dm.cdsEstoque.ApplyUpdates(0);
          End;
          //
          Dm.CdsConfig.edit;
          Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat :=
                Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat+1;
          Dm.CdsConfig.Post;
          Dm.CdsConfig.ApplyUpdates(0);
          //
          W_NRSEQU := Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsInteger;
          // HISTORICO
          Dm.cdsHistorico.Close;
          With Dm.dstHistorico do
           Begin
                Active := False;
                CommandText := 'Select * from HISTORICO Where (HIS_SEQUENCIA = :pSEQUENCIA) '
                              +' and (HIS_LOJA = :pLOJA) AND (HIS_PRODUTO =  :pPRODUTO) ';
                Params.ParamByName('pSEQUENCIA').AsInteger := W_NRSEQU;
                Params.ParamByName('pLOJA').AsInteger      := M_CDLOJA;
                Params.ParamByName('pPRODUTO').AsString    := dm.cdsEstoque.FieldByName('PRO_CODIGO').AsString;
                Active := True;
           End;
           Dm.cdsHistorico.Open;
           //
           With DM.cdsConsulta do
           Begin
                Active := False;
                CommandText := 'Select PRO_CODIGO, PRO_VLCOMPRA, PRO_VLCUSTO, PRO_VLVENDA from PRODUTOS Where (PRO_CODIGO = :pCODIGO) ';
                Params.ParamByName('pCODIGO').AsString := dm.cdsEstoque.FieldByName('PRO_CODIGO').AsString;
                Active := True;
           End;
           //
           If not (DM.cdsConsulta.IsEmpty) Then
           Begin
                M_VLCOMP     := DM.cdsConsulta.FieldByName('PRO_VLCOMPRA').AsCurrency;
                M_VLCUST     := DM.cdsConsulta.FieldByName('PRO_VLCUSTO').AsCurrency;
                M_VLVENDPRO  := DM.cdsConsulta.FieldByName('PRO_VLVENDA').AsCurrency;
           End;
           //
           With Dm.cdsHistorico do
           Begin
                Append;
                FieldByName('HIS_SEQUENCIA').AsInteger := W_NRSEQU;
                FieldByName('HIS_LOJA').AsInteger      := M_CDLOJA;
                FieldByName('HIS_PRODUTO').AsString    := dm.cdsEstoque.FieldByName('PRO_CODIGO').AsString;
                FieldByName('HIS_UNIDADE').AsString    := dm.cdsEstoque.FieldByName('UNI_CODIGO').AsString;
                FieldByName('HIS_DATA').AsDateTime     := M_DTATUA;
                FieldByName('HIS_HORA').AsString       := M_HOATUA;
                FieldByName('HIS_TIPO').AsString       := 'E';
                FieldByName('HIS_ANTERIOR').AsFloat    := M_QTANTE;
                FieldByName('HIS_MOVIMENTO').AsFloat   := dm.cdsEstoque.FieldByName('EST_QUANTENTRADA').AsFloat;
                FieldByName('HIS_ATUAL').AsFloat       := M_QTATUA;
                FieldByName('HIS_VLCUSTO').AsCurrency  := M_VLCUST;
                FieldByName('HIS_VLCOMPRA').AsCurrency := M_VLCOMP;
                FieldByName('HIS_VLVENDA').AsCurrency  := M_VLVENDPRO;
                FieldByName('HIS_USUARIO').AsInteger   := StrtoInt(UFrmAdmin.M_CDUSUA);
                Post;
                ApplyUpdates(0);
           End;
          // Lote
          M_CDPROD := dm.cdsEstoque.FieldByName('PRO_CODIGO').AsString;
          If not uFuncoes.empty(edtNRLOTE.Text) Then
              M_NRLOTE := edtNRLOTE.Text
          Else
              M_NRLOTE := 'GERAL';
          //
          dm2.cdsLotes.Close;
          With dm2.dstLotes do
          begin
               Active := False;
               CommandText := 'Select * from LOTES Where (LOT_NRLOTE = :pLOTE) and (LOT_PROCODIGO = :pCODIGO)';
               Params.ParamByName('pLOTE').AsString   := M_NRLOTE;
               Params.ParamByName('pCODIGO').AsString := M_CDPROD;
               Active := True;
          End;
          dm2.cdsLotes.Open;
          //
          If (dm2.cdsLotes.IsEmpty) Then
          begin
               With dm2.cdsLotes do
                   begin
                        Append;
                        FieldByName('LOT_PROCODIGO').AsString  := M_CDPROD;
                        FieldByName('LOT_NRLOTE').AsString     := M_NRLOTE;
                        FieldByName('LOT_QUANTIDADE').AsFloat  := edtQTENTRADA.Value;
                        If (M_NRLOTE <> 'GERAL') Then
                            FieldByName('LOT_DTVENCIMENTO').AsDateTime := StrtoDate(edtDTVENC.Text);
                        //
                        Post;
                        ApplyUpdates(0);
                   End;
          End
          Else
          Begin
               With dm2.cdsLotes do
                    Begin
                         Edit;
                         FieldByName('LOT_QUANTIDADE').AsFloat  := edtQTENTRADA.Value;
                         //
                         Post;
                         ApplyUpdates(0);
                    End;
          End;
           // Grava
           Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
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
              Dm.SqlAdmin.Rollback(TD);
              //
             Close;
          End;
       End;
end;

procedure TfrmInvertario.sbLocCaixaClick(Sender: TObject);
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
       edtCDPROD.Text := M_CDPROD;
       //
       free;
     end;
     //
     Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmInvertario.edtQTENTRADAKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #27) Then
     Begin
          key := #0;
          edtCDPROD.Clear;
          edtCDPROD.SetFocus;
     End;
end;

procedure TfrmInvertario.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmInvertario.edtCDPRODExit(Sender: TObject);
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

procedure TfrmInvertario.edtNMPRODEnter(Sender: TObject);
begin
    edtCDPROD.SetFocus;
end;

procedure TfrmInvertario.CADASTRAR_PRODUTO;
Var
    M_QTANTE, M_QTATUA : Double;
    M_DTMOVI : TDate;
    M_HOMOVI, M_CDUNID : String;
    W_NRSEQU : Integer;
begin
   try
     // Inicia um transação no BD
     TD.TransactionID  := StrtoInt(UFrmAdmin.M_CDUSUA);
     TD.IsolationLevel := xilREADCOMMITTED;
     Dm.SqlAdmin.StartTransaction(TD);
     //
     M_DTMOVI := Date();
     M_HOMOVI := TimetoStr(Time);
     //
     With qryProduto do
     Begin
          Close;
          Params.ParamByName('pCODIGO').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
          Open;
     End;
     //
     If not (qryProduto.IsEmpty) Then
        M_CDUNID := qryProduto.FieldByName('UNI_CODIGO').AsString;
     //  Tabela de estoque
     Dm.cdsEstoque.Close;
     With Dm.dstEstoque do
     Begin
          Active := False;
          CommandText := 'Select * from ESTOQUE Where (EST_CODIGOLOJA = :pCODIGOLOJA) and (PRO_CODIGO = :pCODIGO)';
          //
          Params.ParamByName('pCODIGOLOJA').AsInteger := M_CDLOJA;
          Params.ParamByName('pCODIGO').AsString      := uFuncoes.StrZero(edtCDPROD.Text,13);
          Active := True;
     End;
     Dm.cdsEstoque.Open;
     // Tabela de Estoque
     M_QTANTE := 0;
     If (Dm.cdsEstoque.IsEmpty) Then  // Se não encontrar
     begin
          Dm.cdsEstoque.Append;
          Dm.cdsEstoque.FieldByName('EST_CODIGOLOJA').AsInteger := M_CDLOJA;
          Dm.cdsEstoque.FieldByName('PRO_CODIGO').AsString      := uFuncoes.StrZero(edtCDPROD.Text,13);
          Dm.cdsEstoque.FieldByName('UNI_CODIGO').AsString      := M_CDUNID;
          Dm.cdsEstoque.FieldByName('EST_DTENTRADA').AsDateTime := M_DTMOVI;
          Dm.cdsEstoque.FieldByName('EST_QUANTENTRADA').AsFloat := 0;
          Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat   := 0;
          M_QTATUA := Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
          Dm.cdsEstoque.Post;
          Dm.cdsEstoque.ApplyUpdates(0);
          //
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
     Dm.cdsHistorico.Close;
     With Dm.dstHistorico do
     Begin
          Active := False;
          CommandText := 'Select * from HISTORICO Where (HIS_SEQUENCIA = :pSEQUENCIA) '
                        +' and (HIS_LOJA = :pLOJA) AND (HIS_PRODUTO =  :pPRODUTO) ';
          Params.ParamByName('pSEQUENCIA').AsInteger := W_NRSEQU;
          Params.ParamByName('pLOJA').AsInteger      := M_CDLOJA;
          Params.ParamByName('pPRODUTO').AsString    := uFuncoes.StrZero(edtCDPROD.Text,13);
          Active := True;
     End;
     Dm.cdsHistorico.Open;
     //
     With Dm.cdsHistorico do
     Begin
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
     // Grava
     Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
     //
   Except
          on Exc:Exception do
          begin
              Application.MessageBox(PChar('Erro na atualização do estoque!!! '
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              //  Cancelar transação no BD.
              Dm.SqlAdmin.Rollback(TD);
          End;
   End;
end;

procedure TfrmInvertario.LOTE;
begin
    Dm.RefreshCDS(Dm.CdsConfig);
    //
    If (dm.CdsConfigCFG_FLLOTE.AsString = 'S') Then
    begin
        lbl_Lote.Visible  := True;
        //edtNRLOTE.Visible := True;
    End
    Else
    begin
        lbl_Lote.Visible  := False;
        edtNRLOTE.Visible := False;
    End;
end;

procedure TfrmInvertario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dm.cdsEstoque.Close;
     dm2.cdsLotes.Close;
     //
     Action := caFree;
end;

procedure TfrmInvertario.BUSCA_LOTE;
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
             dm2.cdsLotes.Close;
             With dm2.dstLotes do
                Begin
                      Active := False;
                      CommandText := 'Select * from LOTES Where (LOT_PROCODIGO = :pCODIGO) AND (LOT_NRLOTE = :pLOTE)';
                      Params.ParamByName('pCODIGO').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
                      Params.ParamByName('pLOTE').AsString   := W_NRLOTE;
                      Active := True;
                 End;
                 dm2.cdsLotes.Open;
                 //
                 If NOT (dm2.cdsLotes.IsEmpty) Then
                   begin
                       M_NRLOTE := dm2.cdsLotes.FieldByName('LOT_NRLOTE').AsString;
                       edtNRLOTE.Text     := W_NRLOTE;
                       edtDTVENC.Text     := dm2.cdsLotes.FieldByName('LOT_DTVENCIMENTO').AsString;
                       edtQUANT.Value     := dm2.cdsLotes.FieldByName('LOT_QUANTIDADE').AsFloat;
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
        End
        Else
             M_NRLOTE := 'GERAL';

end;

procedure TfrmInvertario.edtLOTEExit(Sender: TObject);
begin
     If not uFuncoes.Empty (cmbNMLOJA.Text)
       and not uFuncoes.Empty(edtCDPROD.Text) Then
          BUSCA_LOTE;
end;

procedure TfrmInvertario.edtLOTEChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtLOTE.Text) Then
        Begin
             dm2.cdsLotes.Close;
             edtNRLOTE.Clear;
             edtDTVENC.Clear;
             edtQUANT.Clear;
        End;
end;

procedure TfrmInvertario.edtLOTEKeyPress(Sender: TObject; var Key: Char);
begin
     //
     If (Key = #13) and not uFuncoes.Empty(cmbNMLOJA.Text)
       and not uFuncoes.Empty(edtCDPROD.Text)
       and not uFuncoes.Empty(edtLOTE.Text) Then
         edtQTENTRADA.SetFocus;
end;

procedure TfrmInvertario.edtDTVENCExit(Sender: TObject);
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

procedure TfrmInvertario.edtDTVENCKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #13) and (edtDTVENC.Text <> '  /  /    ') Then
     Begin
          Key := #0;
          edtQTENTRADA.SetFocus;
     End;
end;

End.

