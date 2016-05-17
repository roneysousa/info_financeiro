unit uBuscarNatureza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBuscaDados, FMTBcd, DB, DBClient, Provider, SqlExpr, Grids,
  DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmBuscaNatureza = class(TfrmBuscaDados)
    cdsBuscaNAT_CODIGO: TIntegerField;
    cdsBuscaNAT_NOME: TStringField;
    cdsBuscaNAT_TIPO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtConsultarChange(Sender: TObject);
    procedure edtConsultarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure grdConsultarKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscaNatureza: TfrmBuscaNatureza;
  M_NRFROM : Integer;

implementation

Uses uCadContaPagar, Udm, uFuncoes, uFrmEditContaPagar;

{$R *.dfm}

procedure TfrmBuscaNatureza.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
      If (M_NRFROM = 1) Then
         uCadContaPagar.M_CDNATU :=
              cdsBuscaNAT_CODIGO.AsString;
      //
      If (M_NRFROM = 2) Then
         uFrmEditContaPagar.M_CDNATU :=
              cdsBuscaNAT_CODIGO.AsString;
end;

procedure TfrmBuscaNatureza.edtConsultarChange(Sender: TObject);
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

procedure TfrmBuscaNatureza.edtConsultarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   If (cdsBusca.Active = True) Then
   Begin
     IF (KEY = VK_LEFT) then // avalio se é seta para cima ou para baixo;
          cdsBusca.Prior;
     //
     IF (KEY = VK_RIGHT) then
          cdsBusca.Next;
   End;
end;

procedure TfrmBuscaNatureza.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   If (key = #13) and not (cdsBusca.IsEmpty) Then
   begin
      key := #0;
      If (M_NRFROM = 1) Then
         uCadContaPagar.M_CDNATU :=
              cdsBuscaNAT_CODIGO.AsString;
      If (M_NRFROM = 2) Then
         uFrmEditContaPagar.M_CDNATU :=
              cdsBuscaNAT_CODIGO.AsString;
      //
      Close;
   End;   
end;

procedure TfrmBuscaNatureza.grdConsultarDblClick(Sender: TObject);
begin
  inherited;
   If (cdsBusca.Active = True) Then
   Begin
      Close;
      ModalResult := mrOK;
   End;  

end;

procedure TfrmBuscaNatureza.grdConsultarKeyPress(Sender: TObject;
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
