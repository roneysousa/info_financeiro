unit uFrmRelGondulas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TfrmRelGondulas = class(TForm)
    qrGondulas: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelGondulas: TfrmRelGondulas;

implementation

Uses uFrmSelecionarProdutos;

{$R *.dfm}

end.
