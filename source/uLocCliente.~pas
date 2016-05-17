unit uLocCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, DB, FMTBcd,
  DBClient, Provider, SqlExpr;

type
  TfrmLocCliente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    grdConsultar: TDBGrid;
    edtConsultar: TEdit;
    lblConsultar: TLabel;
    btConfirma: TBitBtn;
    dsConsultarCliente: TDataSource;
    dstConsultarCliente: TSQLDataSet;
    dpsConsultaCliente: TDataSetProvider;
    cdsConsultaCliente: TClientDataSet;
    cdsConsultaClienteCLI_CODIGO: TIntegerField;
    cdsConsultaClienteCLI_FANTASIA: TStringField;
    rgConsultar: TRadioGroup;
    cdsConsultaClienteCLI_RAZAO: TStringField;
    procedure edtConsultarChange(Sender: TObject);
    procedure btConfirmaClick(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure edtConsultarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rgConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocCliente: TfrmLocCliente;
  M_NRFROM : Integer;

implementation

uses uFrmCadContatos, uFuncoes, Udm, uFormaPagamento, uFrmEditarTitulo, uFrmCadPedido;

{$R *.dfm}

procedure TfrmLocCliente.edtConsultarChange(Sender: TObject);
begin
     If not uFuncoes.Empty(edtConsultar.Text) Then
     Begin
          cdsConsultaCliente.Close;
          with dstConsultarCliente do
          begin
               Close;
               CommandText := 'Select CLI_CODIGO, CLI_FANTASIA, CLI_RAZAO from CLIENTES ';
               If (rgConsultar.ItemIndex = 0) Then
               begin
                   CommandText := CommandText + ' Where UPPER(CLI_FANTASIA) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
                   CommandText := CommandText + ' order by CLI_FANTASIA';
               End;
               If (rgConsultar.ItemIndex = 1) Then
               begin
                   CommandText := CommandText + ' Where UPPER(CLI_RAZAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
                   CommandText := CommandText + 'order by CLI_RAZAO';
               End;
               //
               Open;
          end;
          cdsConsultaCliente.Open;
     End
     Else
     Begin
          dstConsultarCliente.Close;
          cdsConsultaCliente.Close;
     End;
end;

procedure TfrmLocCliente.btConfirmaClick(Sender: TObject);
begin
     If (dm.CdsContatos.State in [dsInsert]) and
       not (cdsConsultaCliente.IsEmpty) Then
         If (M_NRFROM = 1) Then
            dm.CdsContatosCLI_CODIGO.Value := cdsConsultaClienteCLI_CODIGO.Value;
     //
     If (dm.cdsDebito.State in [dsInsert]) and
       not (cdsConsultaCliente.IsEmpty) Then
         If (M_NRFROM = 2) Then
            dm.cdsDebitoCLI_CODIGO.Value := cdsConsultaClienteCLI_CODIGO.Value;
     //
     If (M_NRFROM = 3) Then
        frmFormaPagamento.edtCDCLIE.Text := uFuncoes.StrZero(cdsConsultaClienteCLI_CODIGO.AsString,7);
     If (M_NRFROM = 4) Then
     begin
        ufrmEditarTitulo.M_CDCLIE  := cdsConsultaClienteCLI_CODIGO.AsInteger;
        ufrmEditarTitulo.M_NMCLIE  := cdsConsultaClienteCLI_FANTASIA.AsString;
     End;
     //
     If (M_NRFROM = 5) Then
     begin
        uFrmCadPedido.M_CDCLIE  := cdsConsultaClienteCLI_CODIGO.AsString;
        uFrmCadPedido.M_NMCLIE  := cdsConsultaClienteCLI_FANTASIA.AsString;
     End;
end;

procedure TfrmLocCliente.grdConsultarDblClick(Sender: TObject);
begin
     btConfirmaClick(Sender);
     //
     Close;
end;

procedure TfrmLocCliente.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and (cdsConsultaCliente.RecordCount > 0) Then
     Begin
          Key := #0;
          btConfirmaClick(Sender);
     End;
end;

procedure TfrmLocCliente.edtConsultarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     IF (KEY=38) and (cdsConsultaCliente.Active) then // avalio se é seta para cima ou para baixo;
          cdsConsultaCliente.Prior;
     //
     IF (key=40) and (cdsConsultaCliente.Active) then
          cdsConsultaCliente.Next;
end;

procedure TfrmLocCliente.rgConsultarClick(Sender: TObject);
begin
     edtConsultar.Clear;
     edtConsultar.SetFocus;  
end;

end.
