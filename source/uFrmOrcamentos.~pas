unit uFrmOrcamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB;

type
  TfrmOrcamentos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    grdConsultar: TDBGrid;
    dsOrcamentos: TDataSource;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrcamentos: TfrmOrcamentos;

implementation

uses udmConsulta;

{$R *.dfm}

procedure TfrmOrcamentos.btnCancelarClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmOrcamentos.FormShow(Sender: TObject);
begin
     With dmConsultas.cdsOrcamentos do
      begin
           Close;
           Open;  
      End;
end;

procedure TfrmOrcamentos.grdConsultarDblClick(Sender: TObject);
begin
     If not (dmConsultas.cdsOrcamentos.IsEmpty) Then
          btnOk.Click; 
end;

end.
