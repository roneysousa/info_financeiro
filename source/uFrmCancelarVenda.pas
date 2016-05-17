unit uFrmCancelarVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, DBXpress, FMTBcd,
  DB, SqlExpr;

type
  TfrmCancelarVenda = class(TForm)
    pnlSuperior: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    Label1: TLabel;
    edtNRVEND: TEdit;
    Panel3: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    edtNRCUPOM: TEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    DBEdit6: TDBEdit;
    qryMovCaixa: TSQLQuery;
    cmbLoja: TComboBox;
    dbeNRCUPOM: TDBEdit;
    dbeNRPEDIDO: TDBEdit;
    btnExcluir: TBitBtn;
    procedure BtSairClick(Sender: TObject);
    procedure edtNRVENDKeyPress(Sender: TObject; var Key: Char);
    procedure edtNRVENDChange(Sender: TObject);
    procedure edtNRCUPOMChange(Sender: TObject);
    procedure edtNRCUPOMKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edtNRCUPOMEnter(Sender: TObject);
    procedure edtNRVENDEnter(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtNRCUPOMExit(Sender: TObject);
    procedure edtNRVENDExit(Sender: TObject);
    procedure BtGravarEnter(Sender: TObject);
    procedure dbeNRCUPOMEnter(Sender: TObject);
    procedure dbeNRPEDIDOEnter(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    procedure BUSCA;
    procedure BUSCA_CUPOM;
    procedure LOJA;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCancelarVenda: TfrmCancelarVenda;
  TD : TTransactionDesc;

implementation

uses Udm, uFuncoes, UFrmAdmin, udmConsulta;

{$R *.dfm}

procedure TfrmCancelarVenda.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmCancelarVenda.BUSCA;
begin
  dm.cdsMovimento.Close;
  With dm.dstMovimento do
  Begin
       Active := False;
       CommandText := 'Select * from VENDAS '+
                      'Where (MOV_PEDIDO = :pPEDIDO)';
       ParamByName('pPEDIDO').AsInteger := StrtoInt(edtNRVEND.Text);
       Active := True;
  End;
  dm.cdsMovimento.Open;
  //
  If (dm.cdsMovimento.IsEmpty) Then
  Begin
       MessageBox (Application.Handle, 'Número de pedido não existe!!!',
                'ATENÇÃO',MB_ICONSTOP+ MB_OK);
       //
       BtGravar.Enabled := False;
       BtCancelar.Enabled := False;
       btnExcluir.Enabled := False;
       //
       edtNRVEND.Clear;
       edtNRVEND.SetFocus;
  End
  Else
  Begin
       //
       If (dm.cdsMovimento.FieldByName('MOV_SITUACAO').AsString = 'C') Then
       Begin
            MessageBox (Application.Handle, 'Venda já cancelada!!!',
                'ATENÇÃO',MB_ICONSTOP+ MB_OK);
            dm.cdsMovimento.Close;
            //
            edtNRVEND.Clear;
            edtNRVEND.SetFocus;
            //
            Exit;
       End;
       //
       BtGravar.Enabled := True;
       BtCancelar.Enabled := True;
       btnExcluir.Enabled := True;
       //
       dbeNRCUPOM.Left    := edtNRCUPOM.Left;
       dbeNRCUPOM.Visible := True;
       dbeNRPEDIDO.Left   := edtNRVEND.Left;
       dbeNRPEDIDO.Visible := True;
       //
       LOJA;
       //
       BtCancelar.SetFocus;
       //
  End;
end;

procedure TfrmCancelarVenda.edtNRVENDKeyPress(Sender: TObject;
  var Key: Char);
begin
      If (key = #13) and not uFuncoes.Empty(edtNRVEND.Text) then
      Begin
           Key := #0;
           Perform(WM_NEXTDLGCTL, 0, 0);
      End;
end;

procedure TfrmCancelarVenda.edtNRVENDChange(Sender: TObject);
begin
     dm.cdsMovimento.Close;
     BtGravar.Enabled := False;
     BtCancelar.Enabled := False;
     btnExcluir.Enabled := False;
     //
end;

procedure TfrmCancelarVenda.edtNRCUPOMChange(Sender: TObject);
begin
     dm.cdsMovimento.Close;
     BtGravar.Enabled := False;
     BtCancelar.Enabled := False;
     btnExcluir.Enabled := False;
     //
end;

procedure TfrmCancelarVenda.edtNRCUPOMKeyPress(Sender: TObject;
  var Key: Char);
begin
      If (key = #13) and not uFuncoes.Empty(edtNRCUPOM.Text) then
      Begin
           Key := #0;
           BUSCA_CUPOM;
      End;
end;

procedure TfrmCancelarVenda.BUSCA_CUPOM;
begin
  dm.cdsMovimento.Close;
  With dm.dstMovimento do
  Begin
       Active := False;
       CommandText := 'Select * from VENDAS '+
                      'Where (MOV_CUPOM = :pCUPOM)';
       ParamByName('pCUPOM').AsInteger := StrtoInt(edtNRCUPOM.Text);
       Active := True;
  End;
  dm.cdsMovimento.Open;
  //
  If (dm.cdsMovimento.IsEmpty) Then
  Begin
       MessageBox (Application.Handle, 'Número de cupom não existe!!!',
                'ATENÇÃO',MB_ICONSTOP+ MB_OK);
       //
       BtGravar.Enabled := False;
       BtCancelar.Enabled := False;
       btnExcluir.Enabled := False;
       //
       edtNRCUPOM.Clear;
       edtNRCUPOM.SetFocus;
  End
  Else
  Begin
       If (dm.cdsMovimento.FieldByName('MOV_SITUACAO').AsString = 'C') Then
       Begin
            MessageBox (Application.Handle, 'Venda já cancelada!!!',
                'ATENÇÃO',MB_ICONSTOP+ MB_OK);
            dm.cdsMovimento.Close;
            //
            edtNRCUPOM.Clear;
            edtNRCUPOM.SetFocus;
            //
            Exit;
       End;
       //
       BtGravar.Enabled := True;
       BtCancelar.Enabled := True;
       btnExcluir.Enabled := True;
       //
       dbeNRCUPOM.Left    := edtNRCUPOM.Left;
       dbeNRCUPOM.Visible := True;
       dbeNRPEDIDO.Left   := edtNRVEND.Left;
       dbeNRPEDIDO.Visible := True;
       //
       LOJA;
       //
       BtCancelar.SetFocus;
  End;
end;

procedure TfrmCancelarVenda.FormShow(Sender: TObject);
begin
      dm.cdsMovimento.Close;
      //
      cmbLoja.Clear;
end;

procedure TfrmCancelarVenda.edtNRCUPOMEnter(Sender: TObject);
begin
     If uFuncoes.Empty(edtNRCUPOM.Text) AND uFuncoes.Empty(edtNRVEND.Text) then
     begin
        dm.cdsMovimento.Close;
        BtGravar.Enabled := False;
        BtCancelar.Enabled := False;
        btnExcluir.Enabled := False;
     End;
     //
     edtNRVEND.Clear;
     cmbLoja.Clear;
end;

procedure TfrmCancelarVenda.edtNRVENDEnter(Sender: TObject);
begin
     If uFuncoes.Empty(edtNRVEND.Text) AND uFuncoes.Empty(edtNRCUPOM.Text) then
     begin
        dm.cdsMovimento.Close;
        BtGravar.Enabled := False;
        BtCancelar.Enabled := False;
        btnExcluir.Enabled := False;
     End;
     //
     edtNRCUPOM.Clear;
     cmbLoja.Clear;
end;

procedure TfrmCancelarVenda.BtGravarClick(Sender: TObject);
Var
   M_DTCANC : TDate;
   M_HOCANC, M_TPMOVI, M_CDPROD, M_NRSEQU, M_CDUNID : String;
   M_NRPEDI, M_CDLOJA : Integer;
   M_QTANTE, M_QTATUA, M_QTPROD : Double;
begin
     // Inicia um transação no BD
     TD.TransactionID  := StrtoInt(UFrmAdmin.M_CDUSUA);
     TD.IsolationLevel := xilREADCOMMITTED;
     Dm.SqlAdmin.StartTransaction(TD);
     //
     Try
           M_DTCANC := Date();
           M_HOCANC := TimetoStr(Time);
           M_TPMOVI := 'C';
           //
           If (Dm.CdsConfig.Active = False) Then
                Dm.CdsConfig.Open;
           //
           Dm.CdsConfig.edit;
           Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat :=
                Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat+1;
           Dm.CdsConfig.Post;
           Dm.CdsConfig.ApplyUpdates(0);
           //
           M_NRSEQU := uFuncoes.StrZero(FloattoStr(Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat),10);
           // Movimento
           dm.cdsMovimento.Edit;
           dm.cdsMovimento.FieldByName('MOV_SITUACAO').AsString   := M_TPMOVI;
           dm.cdsMovimento.FieldByName('MOV_DATACANC').AsDateTime := M_DTCANC;
           dm.cdsMovimento.FieldByName('MOV_HORACANC').AsString   := M_HOCANC;
           M_NRPEDI := dm.cdsMovimento.FieldByName('MOV_PEDIDO').AsInteger;
           M_CDLOJA := dm.cdsMovimento.FieldByName('MOV_LOJA').AsInteger;
           dm.cdsMovimento.Post;
           dm.cdsMovimento.ApplyUpdates(0);
           //
           dm.cdsItensVenda.Close;
           With dm.dstItensVendas do
           Begin
                Active := False;
                Params.ParamByName('pPEDIDO').AsInteger := M_NRPEDI;
                Active := True;
           End;
           dm.cdsItensVenda.Open;
           dm.cdsItensVenda.First;
           //
           While not (dm.cdsItensVenda.Eof) do
           Begin
                M_CDPROD := dm.cdsItensVenda.FieldByName('MOP_PRODUTO').AsString;
                M_CDUNID := dm.cdsItensVenda.FieldByName('MOP_UNIDADE').AsString;
                M_QTPROD := Dm.cdsItensVenda.FieldByName('MOP_QUANTIDADE').AsFloat;
                // Estoque do produto
                Dm.cdsEstoque.Close;
                With dm.dstEstoque do
                Begin
                     Active := False;
                     Params.ParamByName('pCODIGOLOJA').AsInteger := M_CDLOJA;
                     Params.ParamByName('pCODIGO').AsString      := M_CDPROD;
                     Active := True;
                End;
                Dm.cdsEstoque.Open;
                //
                Dm.cdsEstoque.Edit;
                M_QTANTE := Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                //
                Dm.cdsEstoque.FieldByName('EST_DTENTRADA').AsDateTime := M_DTCANC;
                Dm.cdsEstoque.FieldByName('EST_QUANTENTRADA').AsFloat := M_QTPROD;
                   Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat :=
                Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat + Dm.cdsItensVenda.FieldByName('MOP_QUANTIDADE').AsFloat;
                M_QTATUA := Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                Dm.cdsEstoque.Post;
                Dm.cdsEstoque.ApplyUpdates(0);
                // Historico
                Dm.cdsHistorico.Close;
                With Dm.dstHistorico do
                Begin
                     Active := False;
                     CommandText := 'Select * from HISTORICO Where (HIS_SEQUENCIA = :pSEQUENCIA) '
                                   +' and (HIS_LOJA = :pLOJA) AND (HIS_PRODUTO =  :pPRODUTO) ';
                     Params.ParamByName('pSEQUENCIA').AsInteger := StrtoInt(M_NRSEQU);
                     Params.ParamByName('pLOJA').AsInteger      := M_CDLOJA;
                     Params.ParamByName('pPRODUTO').AsString    := M_CDPROD;
                     Active := True;
                End;
                Dm.cdsHistorico.Open;
                //
                With Dm.cdsHistorico do
                Begin
                      Append;
                      FieldByName('HIS_SEQUENCIA').AsInteger := StrtoInt(M_NRSEQU);
                      FieldByName('HIS_LOJA').AsInteger      := M_CDLOJA;
                      FieldByName('HIS_PRODUTO').AsString    := M_CDPROD;
                      FieldByName('HIS_UNIDADE').AsString    := M_CDUNID;
                      FieldByName('HIS_DATA').AsDateTime     := M_DTCANC;
                      FieldByName('HIS_HORA').AsString       := M_HOCANC;
                      FieldByName('HIS_TIPO').AsString       := 'CV';
                      FieldByName('HIS_DOCUMENTO').AsInteger := M_NRPEDI;
                      FieldByName('HIS_ANTERIOR').AsFloat    := M_QTANTE;
                      FieldByName('HIS_MOVIMENTO').AsFloat   := M_QTPROD;
                      FieldByName('HIS_ATUAL').AsFloat       := M_QTATUA;
                      FieldByName('HIS_USUARIO').AsInteger   := StrtoInt(UFrmAdmin.M_CDUSUA);
                      Post;
                      ApplyUpdates(0);
                End;
                // Proximo
                dm.cdsItensVenda.Next;
           End;
           // Movimento de Caixa
           With qryMovCaixa do
           Begin
                Close;
                Params.ParamByName('pTIPOMOV').AsString := M_TPMOVI;
                Params.ParamByName('pVENDA').AsInteger  := M_NRPEDI;
                Params.ParamByName('pLOJA').AsInteger   := M_CDLOJA;
                //
                ExecSQL;
           End;
           //
           MessageBox (Application.Handle, pChar('Cancelamento da venda N.º '+uFuncoes.StrZero(InttoStr(M_NRPEDI),7)
               +#13+' concluída com sucesso.'), 'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
           // Grava
           Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
     Except
        on Exc:Exception do
        begin
              Application.MessageBox(PChar('Erro no cancelamento da Venda N.º '+InttoStr(M_NRPEDI)+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              //  Cancelar transação no BD.
              Dm.SqlAdmin.Rollback(TD);
              //
             Close;
        End;
     End;
end;

procedure TfrmCancelarVenda.LOJA;
begin
     With dmConsultas.qryLoja do
     Begin
          Close;
          Params.ParamByName('pCODIGO').AsInteger := dm.cdsMovimento.FieldByName('MOV_LOJA').AsInteger;
          Open;
     End;
     //
     cmbLoja.Clear;
     If not (dmConsultas.qryLoja.IsEmpty) Then
        cmbLoja.Items.Add(dmConsultas.qryLoja.FieldByName('EMP_FANTASIA').AsString);
     cmbLoja.ItemIndex := 0;
     //
     {edtNRCUPOM.Text  := uFuncoes.StrZero(dm.cdsMovimento.FieldByName('MOV_CUPOM').AsString,6);
     edtNRVEND.Text   := uFuncoes.StrZero(dm.cdsMovimento.FieldByName('MOV_PEDIDO').AsString,7);}
end;

procedure TfrmCancelarVenda.edtNRCUPOMExit(Sender: TObject);
begin
     {If not uFuncoes.Empty(edtNRCUPOM.Text) Then
     Begin}
      //edtNRCUPOM.Text := uFuncoes.StrZero(edtNRCUPOM.Text,6);
      //edtNRVEND.Text  := uFuncoes.StrZero(edtNRVEND.Text,7);
    // End;
end;

procedure TfrmCancelarVenda.edtNRVENDExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtNRVEND.Text) Then
     Begin
         BUSCA;
        //edtNRCUPOM.Text := uFuncoes.StrZero(edtNRCUPOM.Text,6);
     End;
end;

procedure TfrmCancelarVenda.BtGravarEnter(Sender: TObject);
begin
     {edtNRCUPOM.Text  := uFuncoes.StrZero(InttoStr(dm.cdsMovimento.FieldByName('MOV_CUPOM').AsInteger),6);
     edtNRVEND.Text   := uFuncoes.StrZero(InttoStr(dm.cdsMovimento.FieldByName('MOV_PEDIDO').AsInteger),7);}
end;

procedure TfrmCancelarVenda.dbeNRCUPOMEnter(Sender: TObject);
begin
     dbeNRCUPOM.Visible := False;
     dbeNRPEDIDO.Visible := False;
     dm.cdsMovimento.Close;
     edtNRCUPOM.Clear;
     edtNRCUPOM.SetFocus;
end;

procedure TfrmCancelarVenda.dbeNRPEDIDOEnter(Sender: TObject);
begin
     dbeNRPEDIDO.Visible := False;
     dbeNRCUPOM.Visible := False;
     dm.cdsMovimento.Close;
     edtNRVEND.Clear; 
     edtNRVEND.SetFocus;
end;

procedure TfrmCancelarVenda.btnExcluirClick(Sender: TObject);
begin
      If Application.MessageBox('Deseja excluir pedido?',
         'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
          begin
               If (uFuncoes.ExcluirPedido(StrtoInt(edtNRVEND.text)) ) Then
               begin
                   Application.MessageBox('Pedido excluído com sucesso.','ATENÇÃO',
                      MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   //
                   Close;
               End;    
          End;
end;

end.
