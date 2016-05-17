unit uFrmStatusServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DB;

type
  TfrmStatusServico = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnFechar: TBitBtn;
    DBGServicos: TDBGrid;
    dsServicos: TDataSource;
    lblRegistro: TLabel;
    btnPronto: TBitBtn;
    btnEntrege: TBitBtn;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsServicosDataChange(Sender: TObject; Field: TField);
    procedure btnProntoClick(Sender: TObject);
    procedure btnEntregeClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Atualizar;
  public
    { Public declarations }
  end;

var
  frmStatusServico: TfrmStatusServico;

implementation

uses udmDados, Udm;

{$R *.dfm}

procedure TfrmStatusServico.btnFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmStatusServico.FormShow(Sender: TObject);
begin
     Atualizar;
end;

procedure TfrmStatusServico.dsServicosDataChange(Sender: TObject;
  Field: TField);
begin

    btnPronto.Enabled  := (not dsServicos.DataSet.IsEmpty) and (dsServicos.DataSet.FieldByName('STS_STATUS').AsString = 'C');
    btnEntrege.Enabled := (not dsServicos.DataSet.IsEmpty) and (dsServicos.DataSet.FieldByName('STS_STATUS').AsString = 'P');
    //
    lblRegistro.Caption :=
       'Registro(s) : '+InttoStr(dsServicos.DataSet.RecNo) +' de '+InttoStr(dsServicos.DataSet.RecordCount);
end;

procedure TfrmStatusServico.btnProntoClick(Sender: TObject);
begin
     If Application.MessageBox('Confirma alterar status para pronto ?',
         'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
       begin
           If not (Dm.AtualizaStatusServico(
               dmDados.cdsListaServicosSTS_SEQUENCIA.AsInteger, 'P')) then
              Application.MessageBox (PChar('Erro ao tentar alterar status do serviço !'),
                        'ATENÇÃO',MB_ICONSTOP+ MB_OK);
           //
           Atualizar;
       End;
end;

procedure TfrmStatusServico.Atualizar;
begin
    dm.RefreshCDS(dmDados.cdsListaServicos);
end;

procedure TfrmStatusServico.btnEntregeClick(Sender: TObject);
begin
     If Application.MessageBox('Confirma alterar status para entrege ?',
         'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
       begin
           If not (Dm.AtualizaStatusServico(
               dmDados.cdsListaServicosSTS_SEQUENCIA.AsInteger, 'E')) then
              Application.MessageBox (PChar('Erro ao tentar alterar status do serviço !'),
                        'ATENÇÃO',MB_ICONSTOP+ MB_OK);
           //
           Atualizar;
       End;
end;

end.
