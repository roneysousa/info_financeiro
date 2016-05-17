unit uFrmEtiqClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, FMTBcd, DB, SqlExpr,
  DBClient, Provider;

type
  TfrmSelecioneCliente = class(TForm)
    pnlSuperior: TPanel;
    Label1: TLabel;
    edtCDINIC: TEdit;
    edtCDFINA: TEdit;
    btFiltar: TBitBtn;
    pnlCentral: TPanel;
    memCarta: TMemo;
    GridCliente: TDBGrid;
    Panel2: TPanel;
    BtSair: TBitBtn;
    btImprimir: TBitBtn;
    dstClientes: TSQLDataSet;
    dspClientes: TDataSetProvider;
    cdsClientes: TClientDataSet;
    dsClientes: TDataSource;
    cdsClientesCLI_CODIGO: TIntegerField;
    cdsClientesCLI_FANTASIA: TStringField;
    cdsClientesCLI_ENDERECO: TStringField;
    cdsClientesCLI_NUMERO: TIntegerField;
    cdsClientesCLI_CEP: TStringField;
    cdsClientesCLI_NMCIDADE: TStringField;
    cdsClientesCLI_NMBAIRRO: TStringField;
    cdsClientesCLI_UFCLIENTE: TStringField;
    procedure BtSairClick(Sender: TObject);
    procedure edtCDINICChange(Sender: TObject);
    procedure edtCDINICExit(Sender: TObject);
    procedure edtCDFINAExit(Sender: TObject);
    procedure edtCDINICEnter(Sender: TObject);
    procedure btFiltarClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure CONSULTA;
    procedure CONSULTA2;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecioneCliente: TfrmSelecioneCliente;

implementation

uses uFuncoes, Udm, uRelEtiquetaClientes;

{$R *.dfm}

procedure TfrmSelecioneCliente.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmSelecioneCliente.edtCDINICChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDINIC.Text) Then
        cdsClientes.Close;
end;

procedure TfrmSelecioneCliente.edtCDINICExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDINIC.Text) Then
       edtCDINIC.Text := uFuncoes.StrZero(edtCDINIC.Text,7);
end;

procedure TfrmSelecioneCliente.edtCDFINAExit(Sender: TObject);
begin
     IF not (uFuncoes.Empty(edtCDINIC.Text))
     and NOT (uFuncoes.Empty(edtCDFINA.Text)) Then
     begin
         If StrtoInt(edtCDFINA.Text) < StrtoInt(edtCDINIC.Text) Then
         Begin
             Application.MessageBox(PChar('Código final deve ser maior que o inicial!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             edtCDFINA.Clear;
             edtCDFINA.SetFocus;
             Exit;
          End;
          //
          edtCDFINA.Text := uFuncoes.StrZero(edtCDFINA.Text,7);
          //CONSULTA;
      End;
end;

procedure TfrmSelecioneCliente.edtCDINICEnter(Sender: TObject);
begin
     edtCDINIC.Clear;
     edtCDFINA.Clear;
     //
     btImprimir.Enabled := False;
     cdsClientes.Close;
end;

procedure TfrmSelecioneCliente.CONSULTA;
Var
   Linha : String;
begin
     //
     cdsClientes.Close;
     With dstClientes do
     Begin
             Active := False;
             Linha := 'Select CLI_CODIGO, CLI_FANTASIA, CLI_ENDERECO, CLI_NUMERO, CLI_CEP, CLI_UFCLIENTE, '
                     +' (Select C.CID_NOME from CIDADES C Where (C.CID_CODIGO = CLIENTES.CID_CODIGO)) AS CLI_NMCIDADE, '
                     +' (Select B.BAI_NOME from BAIRROS B Where (B.BAI_CODIGO = CLIENTES.BAI_CODIGO)) AS CLI_NMBAIRRO '
                     +' from CLIENTES Where (CLI_CODIGO >= :pCDINIC) and (CLI_CODIGO <= :pCDFINA) order by CLI_FANTASIA';
             CommandText := Linha;
             //
             Params.ParamByName('pCDINIC').AsString := uFuncoes.StrZero(edtCDINIC.Text,13);
             Params.ParamByName('pCDFINA').AsString := uFuncoes.StrZero(edtCDFINA.Text,13);
             //
             Active := True;
     End;    //Fim-with
     //
     cdsClientes.Open;
     //
     If (cdsClientes.RecordCount > 0) Then
         btImprimir.Enabled := True
     Else
         btImprimir.Enabled := False
end;

procedure TfrmSelecioneCliente.CONSULTA2;
begin
     //
     cdsClientes.Close;
     With dstClientes do
     Begin
          Active := False;
          CommandText := 'Select CLI_CODIGO, CLI_FANTASIA, CLI_ENDERECO, CLI_NUMERO, CLI_CEP, CLI_UFCLIENTE, '
                     +' (Select C.CID_NOME from CIDADES C Where (C.CID_CODIGO = CLIENTES.CID_CODIGO)) AS CLI_NMCIDADE, '
                     +' (Select B.BAI_NOME from BAIRROS B Where (B.BAI_CODIGO = CLIENTES.BAI_CODIGO)) AS CLI_NMBAIRRO '
                     +' from CLIENTES order by CLI_FANTASIA ';
          Active := True;
     End;    //Fim-with
     //
     cdsClientes.Open;
     If (cdsClientes.RecordCount > 0) Then
         btImprimir.Enabled := True
     Else
         btImprimir.Enabled := False;
end;

procedure TfrmSelecioneCliente.btFiltarClick(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDINIC.Text)
         and not uFuncoes.Empty(edtCDFINA.Text) Then
          CONSULTA;
     //
     If uFuncoes.Empty(edtCDINIC.Text)
         and uFuncoes.Empty(edtCDFINA.Text) Then
          CONSULTA2;
end;

procedure TfrmSelecioneCliente.btImprimirClick(Sender: TObject);
begin
     btImprimir.Enabled := False;
     Try
         Application.CreateForm(TfrmRelEtiquetaClientes, frmRelEtiquetaClientes);
         frmRelEtiquetaClientes.qrEtiquetas.Preview;
     Finally
         frmRelEtiquetaClientes.Free;
         btImprimir.Enabled := True;
     End;
end;

procedure TfrmSelecioneCliente.FormShow(Sender: TObject);
begin
    btImprimir.Enabled := False;
end;

end.
