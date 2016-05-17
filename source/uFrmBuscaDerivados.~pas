unit uFrmBuscaDerivados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBuscaDados, FMTBcd, DB, DBClient, Provider, SqlExpr, Grids,
  DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmBuscaDerivados = class(TfrmBuscaDados)
    cdsBuscaPER_SEQUENCIA: TIntegerField;
    cdsBuscaPED_DESCRICAO: TStringField;
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscaDerivados: TfrmBuscaDerivados;

implementation

uses Udm;

{$R *.dfm}

procedure TfrmBuscaDerivados.btnConsultarClick(Sender: TObject);
begin
  inherited;
  with cdsBusca do
  begin
    //
    Close;
    Params[0].AsString := edtConsultar.Text + '%';
    Open;
    //
    if IsEmpty then
    begin
      MessageDlg('Nenhum registro encontrado!' + #13 + 'Refaça a pesquisa', mtInformation, [mbOk], 0);
      edtConsultar.Clear;
      if edtConsultar.CanFocus then
        edtConsultar.SetFocus;
    end;
  end;
end;

end.
