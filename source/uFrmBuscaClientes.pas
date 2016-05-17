unit uFrmBuscaClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBuscaDados, FMTBcd, DB, DBClient, Provider, SqlExpr, Grids,
  DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmBuscaClientes = class(TfrmBuscaDados)
    cdsBuscaCLI_CODIGO: TIntegerField;
    cdsBuscaCLI_FANTASIA: TStringField;
    cdsBuscaCLI_NRBOX: TStringField;
    procedure edtConsultarChange(Sender: TObject);
    procedure edtConsultarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure grdConsultarDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscaClientes: TfrmBuscaClientes;
  M_NRFROM :Integer;

implementation

uses Udm, uFuncoes, uFrmCadContReceber, uFrmManuContReceber,uFrmBaixaContReceber;

{$R *.dfm}

procedure TfrmBuscaClientes.edtConsultarChange(Sender: TObject);
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

procedure TfrmBuscaClientes.edtConsultarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   If (cdsBusca.Active = True)
   and not (cdsBusca.IsEmpty) Then
   Begin
     IF (KEY = VK_LEFT) or (KEY = VK_UP) then // avalio se é seta para cima ou para baixo;
          cdsBusca.Prior;
     //
     IF (KEY = VK_RIGHT) or (KEY = VK_DOWN) then
          cdsBusca.Next;
   End;
end;

procedure TfrmBuscaClientes.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    If (Key = #13) and not (cdsBusca.IsEmpty) Then
    Begin
         Key := #0;
         If (M_NRFROM = 1) Then
           uFrmCadContReceber.M_CDCLIE :=
              cdsBuscaCLI_CODIGO.AsString;
         //
         If (M_NRFROM = 2) Then
           uFrmManuContReceber.M_CDCLIE :=
              cdsBuscaCLI_CODIGO.AsString;
         //
         If (M_NRFROM = 3) Then
           uFrmBaixaContReceber.M_CDCLIE :=
              cdsBuscaCLI_CODIGO.AsString;
         //
         Close;
    End;
end;

procedure TfrmBuscaClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    If not uFuncoes.Empty(edtConsultar.Text) Then
      If (M_NRFROM = 1) Then
         uFrmCadContReceber.M_CDCLIE :=
              cdsBuscaCLI_CODIGO.AsString;
         If (M_NRFROM = 2) Then
           uFrmManuContReceber.M_CDCLIE :=
              cdsBuscaCLI_CODIGO.AsString;
         If (M_NRFROM = 3) Then
           uFrmBaixaContReceber.M_CDCLIE :=
              cdsBuscaCLI_CODIGO.AsString;

end;

procedure TfrmBuscaClientes.grdConsultarKeyPress(Sender: TObject;
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

procedure TfrmBuscaClientes.grdConsultarDblClick(Sender: TObject);
begin
  inherited;
   If (cdsBusca.Active = True) Then
   Begin
      Close;
      ModalResult := mrOK;
   End;
end;

end.
