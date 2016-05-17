unit uFrmBuscaCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBuscaDados, FMTBcd, DB, DBClient, Provider, SqlExpr, Grids,
  DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmBuscaCaixa = class(TfrmBuscaDados)
    procedure btnConsultarClick(Sender: TObject);
    procedure edtConsultarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure edtConsultarChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscaCaixa: TfrmBuscaCaixa;
  W_NRFORM : Integer;
  M_CDCAIX : String;

implementation

uses Udm, uFuncoes, ufrmAberturaCaixa;

{$R *.dfm}

procedure TfrmBuscaCaixa.btnConsultarClick(Sender: TObject);
begin
  inherited;
      M_CDCAIX := cdsBusca.FieldByName('SEN_CODIGO').AsString;
      If (W_NRFORM = 1) and not (cdsBusca.IsEmpty) Then
         frmAberturaCaixa.dbeCAIXA.Text := cdsBusca.FieldByName('SEN_CODIGO').AsString;
end;

procedure TfrmBuscaCaixa.edtConsultarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   If (cdsBusca.Active = True) Then
   begin
     IF (KEY = VK_LEFT) then // avalio se é seta para cima ou para baixo;
          cdsBusca.Prior;
     //
     IF (KEY = VK_RIGHT) then
          cdsBusca.Next;
   End;       
end;

procedure TfrmBuscaCaixa.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
     If (key = #13) and (cdsBusca.RecordCount > 0) Then
     Begin
          Key := #0;
          btnConsultarClick(Sender);
     End;
end;

procedure TfrmBuscaCaixa.edtConsultarChange(Sender: TObject);
begin
  inherited;
     If not uFuncoes.Empty(edtConsultar.Text) Then
     Begin
          cdsBusca.Close;
          with dstBusca do
          begin
               Close;
               CommandText := 'Select SEN_CODIGO, SEN_NOME from USUARIOS';
               CommandText := CommandText + ' where UPPER(SEN_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
               CommandText := CommandText + 'order by SEN_NOME';
               Open;
          end;
          cdsBusca.Open;
     End
     Else
     Begin
          dstBusca.Close;
          cdsBusca.Close;
     End;
end;

procedure TfrmBuscaCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    If (cdsBusca.Active = True) Then
    Begin
      M_CDCAIX := cdsBusca.FieldByName('SEN_CODIGO').AsString;
      If (W_NRFORM = 1) and not (cdsBusca.IsEmpty) Then
         frmAberturaCaixa.dbeCAIXA.Text := cdsBusca.FieldByName('SEN_CODIGO').AsString;
    End;     
end;

end.
