unit uFrmLocLoja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBuscaDados, FMTBcd, DB, DBClient, Provider, SqlExpr, Grids,
  DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmLocLoja = class(TfrmBuscaDados)
    cdsBuscaEMP_CODIGO: TIntegerField;
    cdsBuscaEMP_FANTASIA: TStringField;
    procedure btnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocLoja: TfrmLocLoja;
  M_NRFROM : Integer;

implementation

uses Udm, uFuncoes, uFrmCadEntradaMercadoria, uFrmContasReceber;

{$R *.dfm}

procedure TfrmLocLoja.btnConsultarClick(Sender: TObject);
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

procedure TfrmLocLoja.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
    If not uFuncoes.Empty(edtConsultar.Text) Then
      If (M_NRFROM = 1) Then
         uFrmCadEntradaMercadoria.M_CDLOJA :=
              cdsBuscaEMP_CODIGO.AsString;
      //
      If (M_NRFROM = 2) Then
         ufrmContasReceber.M_CDLOJA :=
              cdsBuscaEMP_CODIGO.AsString;
End;
              
end.
