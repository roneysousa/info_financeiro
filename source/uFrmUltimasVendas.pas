unit uFrmUltimasVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, StdCtrls, Buttons;

type
  TfrmUltimaVendas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    grdConsultar: TDBGrid;
    DBGItensVendas: TDBGrid;
    dsVendas: TDataSource;
    dsItensVendas: TDataSource;
    BtSair: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtSairClick(Sender: TObject);
    procedure dsVendasDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    procedure CONSULTA(M_NRVEND : Integer);
  public
    { Public declarations }
  end;

var
  frmUltimaVendas: TfrmUltimaVendas;
  M_CDCLIE : Integer;
  M_NMCLIE : String;

implementation

uses udmConsulta, DBClient;

{$R *.dfm}

procedure TfrmUltimaVendas.FormShow(Sender: TObject);
begin
     Caption := '�ltima Vendas : '+M_NMCLIE;
     //
end;

procedure TfrmUltimaVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmConsultas.cdsVendasClientes.Close;
     //
     Action := caFree;
end;

procedure TfrmUltimaVendas.BtSairClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmUltimaVendas.CONSULTA(M_NRVEND: Integer);
begin
     With dmConsultas.cdsItensClientes do
      begin
           Close;
           Params.ParamByName('pVENDA').AsInteger := M_NRVEND;
           Params.ParamByName('pTIPO').AsString   := 'V';
           Open;
      End;
end;

procedure TfrmUltimaVendas.dsVendasDataChange(Sender: TObject;
  Field: TField);
begin
      CONSULTA(dmConsultas.cdsVendasClientes.FieldByname('MOV_PEDIDO').AsInteger);
end;

end.
