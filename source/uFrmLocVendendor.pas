unit uFrmLocVendendor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBuscaDados, FMTBcd, DB, DBClient, Provider, SqlExpr, Grids,
  DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmBuscaAtendente = class(TfrmBuscaDados)
    cdsBuscaFUN_CODIGO: TIntegerField;
    cdsBuscaFUN_NOME: TStringField;
    procedure edtConsultarChange(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscaAtendente: TfrmBuscaAtendente;

implementation

uses Udm, uFuncoes;

{$R *.dfm}

procedure TfrmBuscaAtendente.edtConsultarChange(Sender: TObject);
begin
  inherited;
   If not uFuncoes.Empty(edtConsultar.Text) Then
   Begin
        with cdsBusca do
        begin
            //
            Close;
            Params[0].AsString := edtConsultar.Text + '%';
            Open;
            //
        End;
   End
   Else
       cdsBusca.Close;
end;

procedure TfrmBuscaAtendente.grdConsultarDblClick(Sender: TObject);
begin
  inherited;
   If (cdsBusca.Active = True) Then
   Begin
      Close;
      ModalResult := mrOK;
   End;
end;

procedure TfrmBuscaAtendente.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    If (Key = #13) and not (cdsBusca.IsEmpty) Then
    Begin
         Key := #0;
         Close;
         ModalResult := mrOK;
    End;
end;

end.
