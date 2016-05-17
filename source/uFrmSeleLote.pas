unit uFrmSeleLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB;

type
  TfrmSelecionaLote = class(TForm)
    Panel1: TPanel;
    pnlBotoes: TPanel;
    BtConfirma: TBitBtn;
    GridItens: TDBGrid;
    dsLotes: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtConfirmaClick(Sender: TObject);
    procedure GridItensKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionaLote: TfrmSelecionaLote;
  M_NRFORM : Integer;

implementation

uses uDm2, uFuncoes, uFrmInvertario, uFrmVendas, uFrmCadPedido;

{$R *.dfm}

procedure TfrmSelecionaLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     If (M_NRFORM = 1) Then
       uFrmInvertario.M_NRLOTE := DM2.cdsLotes.FieldByName('LOT_NRLOTE').AsString;
     //
     If (M_NRFORM = 2) Then
       uFrmVendas.M_NRLOTE := DM2.cdsLotes.FieldByName('LOT_NRLOTE').AsString;
     //
     If (M_NRFORM = 3) Then
       uFrmCadPedido.M_NRLOTE := DM2.cdsLotes.FieldByName('LOT_NRLOTE').AsString;
     //
     Action := caFree;
end;

procedure TfrmSelecionaLote.BtConfirmaClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmSelecionaLote.GridItensKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (Key = #13)
       and not (DM2.cdsLotes.IsEmpty) Then
     begin
          Key := #0;
          Close;
     End;
end;

end.
