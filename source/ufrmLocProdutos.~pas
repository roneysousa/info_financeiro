unit ufrmLocProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, FMTBcd,
  DBClient, Provider, SqlExpr;

type
  TfrmLocProdutos = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    edtNMDESC: TEdit;
    Panel1: TPanel;
    Panel3: TPanel;
    btFechar: TBitBtn;
    GridProdutos: TDBGrid;
    dsProdutos: TDataSource;
    dstProdutos: TSQLDataSet;
    dspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    cdsProdutosPRO_CODIGO: TStringField;
    cdsProdutosPRO_BARRAS: TStringField;
    cdsProdutosPRO_DESCRICAO: TStringField;
    cdsProdutosPRO_APLICACAO: TStringField;
    cdsProdutosPRO_VLCOMPRA: TFMTBCDField;
    cdsProdutosPRO_VLCUSTO: TFMTBCDField;
    cdsProdutosPRO_VLVENDA: TFMTBCDField;
    cdsProdutosUNI_CODIGO: TStringField;
    cdsProdutosFOR_CODIGO: TIntegerField;
    cdsProdutosFOR_FANTASIA: TStringField;
    cdsProdutosNMCOR: TStringField;
    cdsProdutosSECNOME: TStringField;
    cdsProdutosSUBNOME: TStringField;
    cdsProdutosPRO_REFERENCIA: TStringField;
    btnOk: TBitBtn;
    procedure btFecharClick(Sender: TObject);
    procedure edtNMDESCChange(Sender: TObject);
    procedure GridProdutosDblClick(Sender: TObject);
    procedure edtNMDESCKeyPress(Sender: TObject; var Key: Char);
    procedure edtNMDESCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure PROCURAR_PRODUTO(M_NMPROD : String);
  public
    { Public declarations }
  end;

var
  frmLocProdutos: TfrmLocProdutos;
  M_CDFORN, M_CDSECA, M_CDSUBS : Integer;
  M_NMREFE : String;

implementation

uses uFrmCadPedido, uFuncoes;

const
    ScreenWidth: LongInt = 800; {I designed my form in 800x600 mode.}
    ScreenHeight: LongInt = 600;


{$R *.dfm}

procedure TfrmLocProdutos.btFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmLocProdutos.PROCURAR_PRODUTO(M_NMPROD: String);
begin
     With cdsProdutos  do
     Begin
          DisableControls;
          Close;
          CommandText := 'Select P.PRO_CODIGO, P.PRO_BARRAS, P.PRO_DESCRICAO, P.PRO_APLICACAO, '+
                         ' P.PRO_VLCOMPRA, P.PRO_VLCUSTO, P.PRO_VLVENDA, P.UNI_CODIGO, P.PRO_COR, P.PRO_REFERENCIA, ' +
                         ' (Select C.COR_DESCRICAO from CORES C WHERE (C.COR_CODIGO = P.PRO_COR)) AS NMCOR, ' +
                         '(Select S.SEC_DESCRICAO from SECAO S WHERE (P.SEC_CODIGO = S.SEC_CODIGO)) AS SECNOME, '+
                         '(Select SU.SUB_DESCRICAO from SUBSECAO SU '+
                         'WHERE (P.SEC_CODIGO = SU.SEC_CODIGO) AND (P.SUB_CODIGO = SU.SUB_CODIGO)) AS SUBNOME, '+
                         ' P.FOR_CODIGO, F.FOR_FANTASIA from PRODUTOS P ' +
                         'INNER join FORNECEDORES F ON P. FOR_CODIGO = F.FOR_CODIGO ';
           //
          CommandText := CommandText + 'Where (P.PRO_DESCRICAO like :pNOME) ';
          //
          //' (Select F.FOR_FANTASIA from FORNECEDORES F Where (P.FOR_CODIGO = F.FOR_CODIGO)) As FOR_FANTASIA, '+
          // Fornecedor
          If (M_CDFORN > 0) then
          Begin
               CommandText := CommandText + ' and (P.FOR_CODIGO = :pCDFORN) ';
               Params.ParamByName('pCDFORN').AsInteger  := M_CDFORN;
          End;
          // Seção
          If (M_CDSECA > 0) then
          Begin
               CommandText := CommandText + ' and (P.SEC_CODIGO = :pCDSECA) ';
               Params.ParamByName('pCDSECA').AsInteger  := M_CDSECA;
          End;
          // Sub-seção
          If (M_CDSUBS > 0) then
          Begin
               CommandText := CommandText + ' and (P.SUB_CODIGO = :pCDSUBS) ';
               Params.ParamByName('pCDSUBS').AsInteger  := M_CDSUBS;
          End;
          //
          If not uFuncoes.Empty(M_NMREFE) Then
             CommandText := CommandText + ' and (P.PRO_REFERENCIA = '+QuotedStr(M_NMREFE)+') ';
          //
          Params.ParamByName('pNOME').AsString    := M_NMPROD+'%';
          Open;
          EnableControls;
     End;
end;

procedure TfrmLocProdutos.edtNMDESCChange(Sender: TObject);
begin
     If not uFuncoes.Empty(edtNMDESC.Text) Then
          PROCURAR_PRODUTO(edtNMDESC.Text)
     Else
         cdsProdutos.Close;
end;

procedure TfrmLocProdutos.GridProdutosDblClick(Sender: TObject);
begin
     if not (cdsProdutos.IsEmpty ) Then
          btnOk.Click; 
          //Close;
end;

procedure TfrmLocProdutos.edtNMDESCKeyPress(Sender: TObject;
  var Key: Char);
begin
      if (key = #13) and not (cdsProdutos.IsEmpty ) Then
      begin
           Key := #0;
           close;
      End;
end;

procedure TfrmLocProdutos.edtNMDESCKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     IF (KEY=38) and (cdsProdutos.Active) then // avalio se é seta para cima ou para baixo;
          cdsProdutos.Prior;
     //
     IF (key=40) and (cdsProdutos.Active) then
          cdsProdutos.Next;
end;

procedure TfrmLocProdutos.FormCreate(Sender: TObject);
begin
     { scaled := true;
      if (screen.width <> ScreenWidth) then
      begin
            height := longint(height) * longint(screen.height) DIV ScreenHeight;
            width := longint(width) * longint(screen.width) DIV ScreenWidth;
            scaleBy(screen.width, ScreenWidth);
      end;}
      //
     M_CDFORN := 0;
     M_CDSECA := 0;
     M_CDSUBS := 0;
     M_NMREFE := '';
end;

end.
