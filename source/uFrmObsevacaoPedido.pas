unit uFrmObsevacaoPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TfrmObsPedido = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    mmoTexto: TMemo;
    btnConfirma: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmObsPedido: TfrmObsPedido;

implementation

{$R *.dfm}

procedure TfrmObsPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:= caFree;
end;

procedure TfrmObsPedido.btnConfirmaClick(Sender: TObject);
begin
      Close;
end;

end.
