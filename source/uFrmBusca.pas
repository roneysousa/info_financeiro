unit uFrmBusca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, FMTBcd, DB,
  DBClient, Provider, SqlExpr;

type
  TfrmBusca = class(TForm)
    Panel1: TPanel;
    grdConsultar: TDBGrid;
    edtConsultar: TEdit;
    lblConsultar: TLabel;
    btnConsultar: TBitBtn;
    dstBusca: TSQLDataSet;
    dspBusca: TDataSetProvider;
    cdsBusca: TClientDataSet;
    dsBusca: TDataSource;
    cdsBuscaUNI_CODIGO: TStringField;
    cdsBuscaUNI_DESCRICAO: TStringField;
    procedure edtConsultarChange(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBusca: TfrmBusca;
  M_NRFROM : Integer;

implementation

uses Udm, uFuncoes, uFrmCadProdutos;

{$R *.dfm}

procedure TfrmBusca.edtConsultarChange(Sender: TObject);
begin
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

{     btnConsultar.Enabled := edtConsultar.Text <> '';
     If uFuncoes.Empty(edtConsultar.Text) Then
        Dm.cdsBusca.Close;}
end;

procedure TfrmBusca.grdConsultarDblClick(Sender: TObject);
begin
     Close;
     ModalResult := mrOk;
end;

procedure TfrmBusca.btnConsultarClick(Sender: TObject);
begin
     //
     cdsBusca.Close;
     cdsBusca.Params[0].AsString := edtConsultar.Text + '%';
     cdsBusca.Open;
     //
end;

procedure TfrmBusca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    If not uFuncoes.Empty(edtConsultar.Text)
      And not(cdsBusca.IsEmpty)  Then
    Begin
       If (M_NRFROM = 1) Then
           dm.cdsProdutosUNI_CODIGO.Value := cdsBusca.FieldByName('UNI_CODIGO').Value;
       If (M_NRFROM = 2) Then
           dm.cdsProdutosUNI_ARMAZENAMENTO.Value := cdsBusca.FieldByName('UNI_CODIGO').Value;
       //
    End;
    //
end;

procedure TfrmBusca.edtConsultarKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #37) Then
       Key := #0;
     //
   If (Key = #13)
      and not uFuncoes.Empty(edtConsultar.Text)
      And not(cdsBusca.IsEmpty)  Then
    Begin
        Key := #0;
        Close;
     End;
end;

end.
