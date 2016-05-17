unit uCadDerivados2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, DBXpress,
  FMTBcd, SqlExpr;

type
  TfrmCadDerivados2 = class(TForm)
    pnlSuperior: TPanel;
    pnlGrid: TPanel;
    Panel3: TPanel;
    BtAdicionar: TBitBtn;
    BtExcluir: TBitBtn;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    edtCDPROD: TEdit;
    Label1: TLabel;
    edtNMDESC: TEdit;
    dbGridDados: TDBGrid;
    dsDerivadosProdutos: TDataSource;
    pnlDados: TPanel;
    Label2: TLabel;
    edtDerivado: TEdit;
    qryAtualiza: TSQLQuery;
    spLocProduto: TSpeedButton;
    spLocDerivado: TSpeedButton;
    procedure BtSairClick(Sender: TObject);
    procedure edtCDPRODExit(Sender: TObject);
    procedure edtCDPRODKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDPRODChange(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtDerivadoExit(Sender: TObject);
    procedure edtDerivadoKeyPress(Sender: TObject; var Key: Char);
    procedure BtExcluirClick(Sender: TObject);
    procedure edtDerivadoEnter(Sender: TObject);
    procedure spLocProdutoClick(Sender: TObject);
    procedure spLocDerivadoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    novo, alterar, apagar : String;  
    Function BUSCAR_PRODUTO(W_CDPROD : String) : Boolean;
    procedure tratabotoes;
    procedure LIMPAR;
    procedure INCLUIR;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadDerivados2: TfrmCadDerivados2;
  M_CDPROD, W_CDPROD : String;

implementation

uses udmConsulta, uFuncoes, uDm2, UFrmAdmin, Udm, DBClient, uFrmBuscaProdutos;

{$R *.dfm}

procedure TfrmCadDerivados2.BtSairClick(Sender: TObject);
begin
     Close;
end;

Function TfrmCadDerivados2.BUSCAR_PRODUTO(W_CDPROD : String) : Boolean;
begin
     With dmConsultas.qryProdutos do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select PRO_CODIGO, PRO_DESCRICAO, UNI_CODIGO, UNI_ARMAZENAMENTO,');
          SQL.Add('PRO_VLVENDA from PRODUTOS Where (PRO_CODIGO = :pCODIGO)');
          Params.ParamByName('pCODIGO').AsString := W_CDPROD;
          Open;
          //
          If (IsEmpty) Then
             result := False
          Else
             result := True;
     End;
end;

procedure TfrmCadDerivados2.edtCDPRODExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDPROD.Text) Then
     begin
          If (BUSCAR_PRODUTO(uFuncoes.StrZero(edtCDPROD.Text,13)) = False) Then
          begin
             Application.MessageBox('Código de produto não cadastrado!!!','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             edtCDPROD.SetFocus;
             Exit;
          End
          Else
          Begin
               edtCDPROD.Text := uFuncoes.StrZero(edtCDPROD.Text,13);
               edtNMDESC.Text := dmConsultas.qryProdutos.FieldByName('PRO_DESCRICAO').AsString;
          End;
     End;
end;

procedure TfrmCadDerivados2.edtCDPRODKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
     //
     If (Key = #13) and uFuncoes.Empty(edtCDPROD.Text) Then
     Begin
         key:=#0;
         spLocProdutoClick(Sender);
     End;
     //
     If (Key = #13) and not uFuncoes.Empty(edtCDPROD.Text) Then
     Begin
          Key := #0;
          edtDerivado.SetFocus;
     End;
end;

procedure TfrmCadDerivados2.edtCDPRODChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDPROD.Text) Then
        edtNMDESC.Clear;     
end;

procedure TfrmCadDerivados2.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtExcluir.Enabled   := not BtExcluir.Enabled;
   //
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled   := not BtGravar.Enabled;
   BtSair.Enabled     := not BtSair.Enabled;
   //
   pnlDados.Enabled   := not pnlDados.Enabled;
   pnlSuperior.Enabled := not pnlSuperior.Enabled; 
end;

procedure TfrmCadDerivados2.BtAdicionarClick(Sender: TObject);
begin
     tratabotoes;
     //
     edtCDPROD.SetFocus;
end;

procedure TfrmCadDerivados2.BtCancelarClick(Sender: TObject);
begin
     try
        tratabotoes;
        LIMPAR;
        //
        BtAdicionar.SetFocus;
     Except
           on Exc:Exception do
           begin
                Application.MessageBox(PChar('Erro ao tentar cancelar!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          End;
     End;
end;

procedure TfrmCadDerivados2.BtGravarClick(Sender: TObject);
Var
     TD : TTransactionDesc;
     M_CDPROD, M_CDBAIX : String;
begin
     TD.TransactionID := StrtoInt(UFrmAdmin.M_CDUSUA);
     TD.IsolationLevel := xilREPEATABLEREAD;
     dm.SqlAdmin.StartTransaction(TD);
     try
         tratabotoes;
         //
         M_CDBAIX := uFuncoes.StrZero(edtCDPROD.Text,13);
         //
         With DM2.cdsDerivadosProdutos do
          begin
               DisableControls;
               First;
               While not (Eof) do
                begin
                     M_CDPROD := FieldByName('PRO_CODIGO').AsString;
                     With qryAtualiza do
                      begin
                           Close;
                           Params.ParamByName('pCODIGOBAIXA').AsString := M_CDBAIX;
                           Params.ParamByName('pCODIGO').AsString      := M_CDPROD;
                           ExecSQL;
                      End;
                     //
                     next;
                end;
                EnableControls;
                EmptyDataSet;
                Close;  
          End;
         //
         dm.SqlAdmin.Commit(TD);
         //
         Application.MessageBox(PChar('Registro gravados com sucesso!!'),
                      'CONCLUÍDO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         //
         LIMPAR;
         edtCDPROD.Clear;
         edtNMDESC.Clear;
         BtAdicionar.SetFocus;
     Except
           on Exc:Exception do
           begin
                Application.MessageBox(PChar('Erro ao tentar gravar dados!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                dm.SqlAdmin.Rollback(TD);
                Close;      
          End;
     End;
end;

procedure TfrmCadDerivados2.LIMPAR;
begin
     edtCDPROD.Clear;
     edtNMDESC.Clear;
     //
     edtDerivado.Clear;
     If (DM2.cdsDerivadosProdutos.Active) Then
         DM2.cdsDerivadosProdutos.EmptyDataSet;
     DM2.cdsDerivadosProdutos.Close;
end;

procedure TfrmCadDerivados2.INCLUIR;
begin
     If (dm2.cdsDerivadosProdutos.Active = False) Then
     Begin
         dm2.cdsDerivadosProdutos.Open;
         dm2.cdsDerivadosProdutos.EmptyDataSet;
     End;
     //
     If not (dm2.cdsDerivadosProdutos.Locate('PRO_CODIGO',uFuncoes.StrZero(edtDerivado.Text,13) ,[]) ) Then
     begin
         With dm2.cdsDerivadosProdutos do
           Begin
                Append;
                FieldByName('PRO_CODIGO').AsString    := uFuncoes.StrZero(edtDerivado.Text,13);
                FieldByName('PRO_DESCRICAO').AsString := dmConsultas.qryProdutos.FieldByName('PRO_DESCRICAO').AsString;
                FieldByName('PRO_CODIGOBAIXA').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
                Post;
           End;
     End
     Else
     Begin
          Application.MessageBox('Código de produto já cadastrado!!!','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtDerivado.SetFocus;
          Exit;
     End;
end;

procedure TfrmCadDerivados2.edtDerivadoExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtDerivado.Text) Then
     begin
          //
          If (BUSCAR_PRODUTO(uFuncoes.StrZero(edtDerivado.Text,13)) = False) Then
          begin
             Application.MessageBox('Código de produto não cadastrado!!!','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             edtDerivado.SetFocus;
             Exit;
          End
          Else
          Begin
               edtDerivado.Text := uFuncoes.StrZero(edtDerivado.Text,13);
               //edtNMDESC.Text := dmConsultas.qryProdutos.FieldByName('PRO_DESCRICAO').AsString;
          End;
     End;
end;

procedure TfrmCadDerivados2.edtDerivadoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
     //
     If (Key = #13) and uFuncoes.Empty(edtDerivado.Text) Then
     Begin
         key:=#0;
         spLocDerivadoClick(Sender);
     End;

     //
     If (Key = #13) and not uFuncoes.Empty(edtDerivado.Text)
     and (BUSCAR_PRODUTO(uFuncoes.StrZero(edtDerivado.Text,13)) = True) Then
     Begin
          Key := #0;
          If uFuncoes.StrZero(edtDerivado.Text,13) = uFuncoes.StrZero(edtCDPROD.Text,13) Then
          Begin
             Application.MessageBox('Produto não pode ser incluido como derivado!!!','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             edtDerivado.Clear;
             edtDerivado.SetFocus;
             Exit;
          end;
          //
          INCLUIR;
          //
          edtDerivado.Clear;
          edtDerivado.SetFocus;
     End;
end;

procedure TfrmCadDerivados2.BtExcluirClick(Sender: TObject);
begin
     If (dm2.cdsDerivadosProdutos.Active = True)
      and (dm2.cdsDerivadosProdutos.RecordCount > 0) Then
         dm2.cdsDerivadosProdutos.Delete;
end;

procedure TfrmCadDerivados2.edtDerivadoEnter(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDPROD.Text) Then
         edtCDPROD.SetFocus; 
end;

procedure TfrmCadDerivados2.spLocProdutoClick(Sender: TObject);
begin
  with TfrmBuscaProduto.create(self) do
  try
     uFrmBuscaProdutos.M_NRFROM := 5;
     showmodal;
  finally
    edtCDPROD.Text := M_CDPROD;
    free;
  end;
end;

procedure TfrmCadDerivados2.spLocDerivadoClick(Sender: TObject);
begin
  with TfrmBuscaProduto.create(self) do
  try
     uFrmBuscaProdutos.M_NRFROM := 6;
     showmodal;
  finally
    edtDerivado.Text := W_CDPROD;
    free;
  end;
end;

procedure TfrmCadDerivados2.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Derivados...'));
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
   End;

end;

End.
