unit uFrmProcurarProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB, DBCtrls,
  FMTBcd, SqlExpr, DBClient, Provider, Mask;

type
  TfrmLocalizaProduto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtNMDESC: TEdit;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    GridProdutos: TDBGrid;
    dsProdutos: TDataSource;
    Label2: TLabel;
    dstProdutos: TSQLDataSet;
    dspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    cdsProdutosPRO_CODIGO: TStringField;
    cdsProdutosPRO_BARRAS: TStringField;
    cdsProdutosPRO_DESCRICAO: TStringField;
    cdsProdutosPRO_APLICACAO: TStringField;
    cdsProdutosPRO_VLVENDA: TFMTBCDField;
    cdsProdutosUNI_CODIGO: TStringField;
    cdsProdutosFOR_CODIGO: TIntegerField;
    cdsProdutosFOR_NOME: TStringField;
    cdsProdutosEST_QUANTIDADE: TFMTBCDField;
    cdsProdutosPRO_VLFRACAO: TFMTBCDField;
    btnConfirme: TBitBtn;
    cdsProdutosPRO_REFERENCIA: TStringField;
    DBEdit1: TDBEdit;
    procedure GridProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtNMDESCChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtNMDESCKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure GridProdutosDblClick(Sender: TObject);
    procedure edtNMDESCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridProdutosKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure BUSCAR;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocalizaProduto: TfrmLocalizaProduto;
  M_NRFORM : INTEGER;
  M_CDPROD : String;

implementation

Uses uFuncoes, Udm, uFrmVendas;

{$R *.dfm}

procedure TfrmLocalizaProduto.GridProdutosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     If (Shift = [ssCtrl]) and (Key = 46) Then
         KEY := 0;
     //
end;

procedure TfrmLocalizaProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     //
    // cdsProdutos.close;
     //
     Action := caFree;
end;

procedure TfrmLocalizaProduto.edtNMDESCChange(Sender: TObject);
begin
     If not uFuncoes.Empty(edtNMDESC.Text) Then
          BUSCAR
     Else
         cdsProdutos.Close;
end;

procedure TfrmLocalizaProduto.FormActivate(Sender: TObject);
begin
     edtNMDESC.SetFocus;
end;

procedure TfrmLocalizaProduto.edtNMDESCKeyPress(Sender: TObject;
  var Key: Char);
Var
  Hwnd: Thandle;
begin
     If (Key = #27) Then
     begin
          Key := #0;
          BitBtn1Click(Sender);
          //Close;
     End;
     //
     If (Key = #13) and not uFuncoes.Empty(edtNMDESC.Text)
       and (cdsProdutos.Active) Then
     begin
          Key := #0;
          //
          GridProdutosDblClick(Sender);
          //
          //Close;
     End;
end;

procedure TfrmLocalizaProduto.BitBtn1Click(Sender: TObject);
begin
     ModalResult := mrCancel;
end;

procedure TfrmLocalizaProduto.BUSCAR;
begin
     With cdsProdutos do
     Begin
          DisableControls;
          Close;
          CommandText :=
                       'Select P.PRO_CODIGO, P.PRO_BARRAS, P.PRO_DESCRICAO, P.PRO_APLICACAO, P.PRO_VLFRACAO, P.PRO_VLVENDA, P.UNI_CODIGO, P.FOR_CODIGO, PRO_REFERENCIA, '+
                       '(Select FOR_FANTASIA from FORNECEDORES F '+
                       'Where (F.FOR_CODIGO = P.FOR_CODIGO)) AS FOR_NOME, '+
                       '(Select E.EST_QUANTIDADE from ESTOQUE E '+
                       'Where (E.PRO_CODIGO = P.PRO_CODIGO) '+
                       'AND (E.EST_CODIGOLOJA = :pCDLOJA)) AS EST_QUANTIDADE '+
                       'from PRODUTOS P Where UPPER(P.PRO_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtNMDESC.Text) + '%')+
                       ' order by P.PRO_DESCRICAO';
          Params.ParamByName('pCDLOJA').AsInteger := 1;
          Open;
          EnableControls; 
     End;
end;

procedure TfrmLocalizaProduto.GridProdutosDblClick(Sender: TObject);
begin
   If (M_NRFORM = 1) Then
   Begin
        M_CDPROD := '';
        If not (cdsProdutos.IsEmpty ) Then
        Begin
            M_CDPROD := cdsProdutos.FieldByName('PRO_CODIGO').AsString;
            //frmVendas.edtCodigo.Text := M_CDPROD;
        End;
   End;
   //
   If (M_NRFORM = 2) Then
   Begin
        M_CDPROD := '';
        If not (cdsProdutos.IsEmpty ) Then
        Begin
            M_CDPROD := cdsProdutos.FieldByName('PRO_CODIGO').AsString;
        End;
   End;
   //
   //btnConfirmeClick(Sender);
   //ModalResult := mrOk;
   Close;
end;

procedure TfrmLocalizaProduto.edtNMDESCKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     IF (KEY=38) and (cdsProdutos.Active) then // avalio se é seta para cima ou para baixo;
          cdsProdutos.Prior;
     //
     IF (key=40) and (cdsProdutos.Active) then
          cdsProdutos.Next;                   
end;

procedure TfrmLocalizaProduto.GridProdutosKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (Key = #27) Then
     begin
          Key := #0;
          Close;
     End;
     //

end;

procedure TfrmLocalizaProduto.btnConfirmeClick(Sender: TObject);
begin
     M_CDPROD := '';
     If not (cdsProdutos.IsEmpty ) Then
        M_CDPROD := cdsProdutos.FieldByName('PRO_CODIGO').AsString;
     //GridProdutosDblClick(Sender);
     Close;
end;

procedure TfrmLocalizaProduto.FormShow(Sender: TObject);
begin
     M_CDPROD := '';
end;

end.
