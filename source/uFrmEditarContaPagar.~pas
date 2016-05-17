unit uFrmEditarContaPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, Grids, DBGrids, DB;

type
  TfrmEditaContaPagar = class(TForm)
    pnlSuperior: TPanel;
    Panel2: TPanel;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    Label1: TLabel;
    edtNRCOMPRA: TEdit;
    Label2: TLabel;
    pnlGrid: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    pnlEdicao: TPanel;
    grdConsultar: TDBGrid;
    dbeNRPARC: TDBEdit;
    dbeDTVENC: TDBEdit;
    dbeVALOR: TDBEdit;
    dbeVLDESC: TDBEdit;
    cmbLoja: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    BtEditar: TBitBtn;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    procedure BtSairClick(Sender: TObject);
    procedure edtNRCOMPRAExit(Sender: TObject);
    procedure edtNRCOMPRAChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtEditarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtNRCOMPRAKeyPress(Sender: TObject; var Key: Char);
    procedure dbeDTVENCExit(Sender: TObject);
    procedure edtNRCOMPRAEnter(Sender: TObject);
    procedure dbeDTVENCKeyPress(Sender: TObject; var Key: Char);
    procedure dbeVALORKeyPress(Sender: TObject; var Key: Char);
    procedure dbeVLDESCKeyPress(Sender: TObject; var Key: Char);
  private
    procedure BUSCA_CONTA;
    procedure tratabotoes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditaContaPagar: TfrmEditaContaPagar;

implementation

uses uDm2, uFuncoes, udmConsulta;

{$R *.dfm}

procedure TfrmEditaContaPagar.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmEditaContaPagar.BUSCA_CONTA;
begin
     //
     dm2.cdsContasPagar.Close;
     With dm2.dstContasPagar do
     Begin
          Active := False;
          CommandText := 'Select * from CONTASPAGAR Where (PAG_NRENTRADA = :pNRCOMPRA)';
          Params.ParamByName('pNRCOMPRA').AsInteger := StrtoInt(edtNRCOMPRA.Text);
          Active := True;
     End;
     //
     dm2.cdsContasPagar.FetchParams;
     dm2.cdsContasPagar.Open;
     //
     If (dm2.cdsContasPagar.IsEmpty) then
     Begin
          Application.MessageBox(PChar('Registro de conta a pagar não encontrada...'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dm2.cdsContasPagar.Close;
          edtNRCOMPRA.SetFocus;
          Exit;
     End
     Else
         edtNRCOMPRA.Text := uFuncoes.StrZero(edtNRCOMPRA.Text,7); 
end;

procedure TfrmEditaContaPagar.edtNRCOMPRAExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtNRCOMPRA.Text) Then
          BUSCA_CONTA;
end;


procedure TfrmEditaContaPagar.edtNRCOMPRAChange(Sender: TObject);
begin
     If uFuncoes.Empty (edtNRCOMPRA.Text) Then
         dm2.cdsContasPagar.Close;
     If (BtCancelar.Enabled = True) Then
        tratabotoes;
end;

procedure TfrmEditaContaPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      dm2.cdsContasPagar.Close;
end;

procedure TfrmEditaContaPagar.tratabotoes;
begin
   BtEditar.Enabled   := not BtEditar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled   := not BtGravar.Enabled;
   BtSair.Enabled     := not BtSair.Enabled;
end;

procedure TfrmEditaContaPagar.BtEditarClick(Sender: TObject);
begin
     If (dm2.cdsContasPagar.Active = True)
      and (dm2.cdsContasPagar.RecordCount > 0) Then
     begin
         tratabotoes;
         dm2.cdsContasPagar.Edit;
         dbeDTVENC.SetFocus; 
    End;
end;

procedure TfrmEditaContaPagar.BtCancelarClick(Sender: TObject);
begin
     tratabotoes;
     dm2.cdsContasPagar.Cancel;
end;

procedure TfrmEditaContaPagar.BtGravarClick(Sender: TObject);
begin
     If uFuncoes.Empty(dbeDTVENC.Text) Then
     Begin
         Application.MessageBox('Digite a data de vencimento!!!','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         dbeDTVENC.SetFocus;
         Exit;
     End;
     //
     If uFuncoes.Empty(dbeVALOR.Text) Then
     Begin
         Application.MessageBox('Digite o valor da parcela!!!','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         dbeVALOR.SetFocus;
         Exit;
     End;
     //
     Try
         tratabotoes;
         dm2.cdsContasPagar.Post;
         dm2.cdsContasPagar.ApplyUpdates(0);
     Except

     End;
end;

procedure TfrmEditaContaPagar.edtNRCOMPRAKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and not uFuncoes.Empty(edtNRCOMPRA.Text) Then
     Begin
          Key := #0;
          cmbLoja.SetFocus; 
     End;
end;

procedure TfrmEditaContaPagar.dbeDTVENCExit(Sender: TObject);
begin
     If (dm2.cdsContasPagar.State in [dsEdit]) Then
     Begin
          If (dm2.cdsContasPagar.FieldByName('PAG_DATAVENCIMENTO').AsDateTime
            < dm2.cdsContasPagar.FieldByName('PAG_DATACOMPRA').AsDateTime) Then
          Begin
               Application.MessageBox(PChar('Data de vencimento deve ser '+#13'maior ou igual a da compra!!!'),
                        'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               dm2.cdsContasPagar.FieldByName('PAG_DATAVENCIMENTO').AsDateTime :=
                 dm2.cdsContasPagar.FieldByName('PAG_DATACOMPRA').AsDateTime;
               Exit;
          End;
     End;
end;

procedure TfrmEditaContaPagar.edtNRCOMPRAEnter(Sender: TObject);
begin
     If (BtCancelar.Enabled = True) Then
        tratabotoes;
     //
     dm2.cdsContasPagar.Close;
end;

procedure TfrmEditaContaPagar.dbeDTVENCKeyPress(Sender: TObject;
  var Key: Char);
begin
      If (Key = #13) and (dbeDTVENC.Text <> '  /  /    ') Then
      Begin
          Key := #0;
          dbeVALOR.SetFocus;
      End;
end;

procedure TfrmEditaContaPagar.dbeVALORKeyPress(Sender: TObject;
  var Key: Char);
begin
      If (Key = #13) and not uFuncoes.Empty(dbeVALOR.Text) Then
      Begin
          Key := #0;
          dbeVLDESC.SetFocus;
      End;
end;

procedure TfrmEditaContaPagar.dbeVLDESCKeyPress(Sender: TObject;
  var Key: Char);
begin
      If (Key = #13) and not uFuncoes.Empty(dbeVLDESC.Text) Then
      Begin
          Key := #0;
          BtGravar.SetFocus;
      End;
end;

end.
