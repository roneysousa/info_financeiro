unit uFrmLocCor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBuscaDados, FMTBcd, DB, DBClient, Provider, SqlExpr, Grids,
  DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmBuscaCor = class(TfrmBuscaDados)
    cdsBuscaCOR_CODIGO: TIntegerField;
    cdsBuscaCOR_DESCRICAO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure edtConsultarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscaCor: TfrmBuscaCor;

implementation

uses Udm, uFuncoes;

{$R *.dfm}

procedure TfrmBuscaCor.FormShow(Sender: TObject);
begin
  inherited;
      dm.RefreshCDS(cdsBusca);
end;

procedure TfrmBuscaCor.edtConsultarChange(Sender: TObject);
begin
  inherited;
      If not (cdsBusca.IsEmpty) Then
         cdsBusca.Locate('COR_DESCRICAO',edtConsultar.Text, [loPartialKey,loCaseInsensitive])
      Else
         Dm.RefreshCDS(cdsBusca); 
end;

procedure TfrmBuscaCor.edtConsultarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   If (cdsBusca.Active = True) Then
   Begin
     IF (KEY = VK_UP) then
          cdsBusca.Prior;
     //
     IF (KEY = VK_DOWN) then
          cdsBusca.Next;
   End;
end;

procedure TfrmBuscaCor.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    If (Key = #13)and not (cdsBusca.IsEmpty) Then
    Begin
         Key := #0;
         //
         Close;
    End;
end;

end.
