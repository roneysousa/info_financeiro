unit uFrmLocFornec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBuscaDados, FMTBcd, DB, DBClient, Provider, SqlExpr, Grids,
  DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmBuscaFornec = class(TfrmBuscaDados)
    dstBuscaFOR_CODIGO: TIntegerField;
    dstBuscaFOR_FANTASIA: TStringField;
    cdsBuscaFOR_CODIGO: TIntegerField;
    cdsBuscaFOR_FANTASIA: TStringField;
    procedure btnConsultarClick(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtConsultarChange(Sender: TObject);
    procedure grdConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure edtConsultarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscaFornec: TfrmBuscaFornec;
  M_NRFROM : Integer;

implementation

uses Udm, uFuncoes, uFrmCadEntradaMercadoria, uFrmFecharEntrada,
uCadContaPagar, uFrmManuContasPagar;

{$R *.dfm}

procedure TfrmBuscaFornec.btnConsultarClick(Sender: TObject);
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

procedure TfrmBuscaFornec.grdConsultarDblClick(Sender: TObject);
begin
  inherited;
   If (cdsBusca.Active = True) Then
   Begin
      Close;
      ModalResult := mrOK;
   End;   
end;

procedure TfrmBuscaFornec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    If not uFuncoes.Empty(edtConsultar.Text) Then
      If (M_NRFROM = 1) Then
         dm.cdsProdutosFOR_CODIGO.AsString :=
              cdsBuscaFOR_CODIGO.AsString;
      //
      If (M_NRFROM = 2) Then
         uFrmCadEntradaMercadoria.M_CDFORN :=
              cdsBuscaFOR_CODIGO.AsString;
      //
      If (M_NRFROM = 3) Then
         uFrmFecharEntrada.M_CDFORN :=
              cdsBuscaFOR_CODIGO.AsString;
      //
      If (M_NRFROM = 4) Then
         uCadContaPagar.M_CDFORN :=
              cdsBuscaFOR_CODIGO.AsString;
      //
      If (M_NRFROM = 5) Then
         uFrmManuContasPagar.M_CDFORN :=
              cdsBuscaFOR_CODIGO.AsString;
end;

procedure TfrmBuscaFornec.edtConsultarChange(Sender: TObject);
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

procedure TfrmBuscaFornec.grdConsultarKeyPress(Sender: TObject;
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

procedure TfrmBuscaFornec.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    If (Key = #13) and not (cdsBusca.IsEmpty) Then
    Begin
         Key := #0;
         If (M_NRFROM = 1) Then
           dm.cdsProdutosFOR_CODIGO.AsString :=
              cdsBuscaFOR_CODIGO.AsString;
         //
         If (M_NRFROM = 2) Then
            uFrmCadEntradaMercadoria.M_CDFORN :=
                  cdsBuscaFOR_CODIGO.AsString;
         If (M_NRFROM = 3) Then
            uFrmFecharEntrada.M_CDFORN :=
                  cdsBuscaFOR_CODIGO.AsString;
         If (M_NRFROM = 4) Then
            uCadContaPagar.M_CDFORN :=
                 cdsBuscaFOR_CODIGO.AsString;
         //
         If (M_NRFROM = 5) Then
            uFrmManuContasPagar.M_CDFORN :=
                 cdsBuscaFOR_CODIGO.AsString;
         //
         Close;
         //ModalResult := mrOK;
    End;
end;

procedure TfrmBuscaFornec.edtConsultarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   If (cdsBusca.Active = True) Then
   Begin
     IF (KEY = VK_UP) then
          cdsBusca.Prior;
     //
     IF (KEY = VK_DOWN) then
          cdsBusca.Next;

      { If (KEY = VK_LEFT) Then
           cdsBusca.Next;
       If (KEY = VK_RIGHT) Then
           cdsBusca.Prior;}
   End;
end;

end.
