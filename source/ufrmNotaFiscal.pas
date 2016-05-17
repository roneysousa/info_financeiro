unit ufrmNotaFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TfrmNotaFiscal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    memNota: TMemo;
    btFechar: TBitBtn;
    procedure btFecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNotaFiscal: TfrmNotaFiscal;

implementation

{$R *.dfm}

procedure TfrmNotaFiscal.btFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmNotaFiscal.FormActivate(Sender: TObject);
begin
      If (fileexists(ExtractFilePath( Application.ExeName )+'\NN.TXT')) then
           memNota.Lines.LoadFromFile(ExtractFilePath( Application.ExeName )+'\NN.TXT')
      Else
      Begin
           Showmessage('Arquivo inexistente');
           Close;
      End;
end;

end.
