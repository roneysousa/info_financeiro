unit uSobreADM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, shellapi;

type
  TfrmSobre = class(TForm)
    Timer1: TTimer;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Image1: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AtivaLink(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DesativaLink(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ClickLink(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
       procedure WMMove(var Msg: TWMMove); message WM_MOVE;
    { Private declarations }
  public
  procedure JumpTo(const aAdress: String);
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

{$R *.DFM}

procedure TfrmSobre.Timer1Timer(Sender: TObject);
begin
 if Memo1.Font.Color<$FFFFFF-$101010 then
  Memo1.Font.Color:=Memo1.Font.Color+$101010
 else
  timer1.enabled:=false;
end;

procedure TfrmSobre.FormShow(Sender: TObject);
begin
 Memo1.Font.Color:=0;
 timer1.enabled:=true;
end;

procedure TfrmSobre.AtivaLink(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 TLabel(Sender).Font.Color:=clRed;
end;

procedure TfrmSobre.DesativaLink(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 TLabel(Sender).Font.Color:=$FF8080;
end;

procedure TfrmSobre.ClickLink(Sender: TObject);
var
   Mail : String;
begin
    Mail := 'mailto: sac@infog2.com.br';
    ShellExecute(GetDesktopWindow,'open',pchar(Mail),nil,nil,sw_ShowNormal);
end;

procedure TfrmSobre.JumpTo(const aAdress: String);
var
     buffer: String;
begin
     buffer := 'http://' + aAdress;
     ShellExecute(Application.Handle, nil, PChar(buffer), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmSobre.Label5Click(Sender: TObject);
begin
        JumpTo('www.infog2.com.br');
end;

procedure TfrmSobre.WMMove(var Msg: TWMMove);
begin
  // Impedir que o form seja arrastado para fora das margens da tela.
  if Left < 0 then
        Left := 0;
  if Top < 0 then
          Top := 0;
  if Screen.Width - (Left + Width) < 0 then
          Left := Screen.Width - Width;
  if Screen.Height - (Top + Height) < 0 then
          Top := Screen.Height - Height;
end;

procedure TfrmSobre.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case key of
        vk_Escape: close;
    end;
End;

end.
