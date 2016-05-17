unit uRelEtiquetaClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, QuickRpt, QRCtrls, ExtCtrls;

type
  TfrmRelEtiquetaClientes = class(TForm)
    qrEtiquetas: TQuickRep;
    DetailBand1: TQRBand;
    QRShape1: TQRShape;
    QRDBText6: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelEtiquetaClientes: TfrmRelEtiquetaClientes;

implementation

Uses uFrmEtiqClientes;

{$R *.dfm}

end.
