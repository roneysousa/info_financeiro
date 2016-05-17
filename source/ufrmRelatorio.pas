unit ufrmRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TfrmRelatorio = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtSair: TBitBtn;
    btImprimir: TBitBtn;
    procedure BtSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorio: TfrmRelatorio;

implementation

{$R *.dfm}

procedure TfrmRelatorio.BtSairClick(Sender: TObject);
begin
     Close;
end;

end.
