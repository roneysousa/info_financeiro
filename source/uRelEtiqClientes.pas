unit uRelEtiqClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, QuickRpt, QRCtrls, ExtCtrls;

type
  TfrmRelEtiqueta = class(TForm)
    qrEtiquetas: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qyrClientes: TQuery;
    qyrClientesCLI_NMCLIE: TStringField;
    qyrClientesCLI_ENDCLI: TStringField;
    qyrClientesCLI_BAICLI: TStringField;
    qyrClientesCLI_CEPCLI: TStringField;
    qyrClientesCLI_CIDCLI: TStringField;
    qyrClientesCLI_UFEMIS: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelEtiqueta: TfrmRelEtiqueta;

implementation

{$R *.dfm}

end.
