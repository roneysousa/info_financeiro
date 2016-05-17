unit uFrmCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DBClient, Provider, DB, SqlExpr, Buttons, Grids,
  DBGrids, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls;

type
  TfrmCadastro = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    lblConsultar: TLabel;
    rgConsultar: TRadioGroup;
    edtConsultar: TEdit;
    btnConsultar: TBitBtn;
    btnAlterar: TBitBtn;
    grdConsultar: TDBGrid;
    Panel3: TPanel;
    sbProximo: TSpeedButton;
    sbUltimo: TSpeedButton;
    sbAnterior: TSpeedButton;
    sbPrimeiro: TSpeedButton;
    dsConsultar: TDataSource;
    datasetConsultar: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    Panel1: TPanel;
    BtAdicionar: TBitBtn;
    BtEditar: TBitBtn;
    BtExcluir: TBitBtn;
    BtPesquisar: TBitBtn;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    Panel4: TPanel;
    procedure BtSairClick(Sender: TObject);
    procedure rgConsultarClick(Sender: TObject);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure sbPrimeiroClick(Sender: TObject);
    procedure sbProximoClick(Sender: TObject);
    procedure sbAnteriorClick(Sender: TObject);
    procedure sbUltimoClick(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtPesquisarClick(Sender: TObject);
  private
    procedure habilitaBotoes(const oper: Char);
    procedure habilitaCampos(const tof: Boolean);
  protected
    strOper : Char;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastro: TfrmCadastro;

implementation

{$R *.dfm}

procedure TfrmCadastro.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmCadastro.habilitaBotoes(const oper: Char);
begin
  case oper of
    'I': //Inclusão
    begin
      BtAdicionar.Enabled := False;
      BtGravar.Enabled := True;
      BtCancelar.Enabled := True;
      BtExcluir.Enabled := False;
      BtSair.Enabled := False;
      PageControl1.Pages[1].TabVisible := False;
      //sbStatus.Panels[0].Text := 'Incluindo';
    end;
    'A': //Alteração
    begin
      BtAdicionar.Enabled := False;
      BtGravar.Enabled := True;
      BtCancelar.Enabled := True;
      BtExcluir.Enabled := True;
      BtSair.Enabled := False;
      PageControl1.Pages[1].TabVisible := False;
      //sbStatus.Panels[0].Text := 'Alterando';
    end;
    'C': //Consulta
    begin
      BtAdicionar.Enabled := True;
      BtGravar.Enabled := False;
      BtCancelar.Enabled := False;
      BtExcluir.Enabled := False;
      BtSair.Enabled := True;
      PageControl1.Pages[1].TabVisible := True;
      //sbStatus.Panels[0].Text := 'Consultando';
    end;
  end;
end;

procedure TfrmCadastro.habilitaCampos(const tof: Boolean);
var
  i : Integer;
  cor : TColor;
begin
  if tof then
    cor := clWindow
  else
    cor := clBtnFace;
  for i := 0 to PageControl1.Pages[0].ControlCount - 1 do
  begin
    if (PageControl1.Pages[0].Controls[i] is TEdit) then
    begin
      (PageControl1.Pages[0].Controls[i] as TEdit).Enabled := tof;
      (PageControl1.Pages[0].Controls[i] as TEdit).Color := cor;
    end
    else
    if (PageControl1.Pages[0].Controls[i] is TComboBox) then
    begin
      (PageControl1.Pages[0].Controls[i] as TComboBox).Enabled := tof;
      (PageControl1.Pages[0].Controls[i] as TComboBox).Color := cor;
    end
    else
    if (PageControl1.Pages[0].Controls[i] is TMaskEdit) then
    begin
      (PageControl1.Pages[0].Controls[i] as TMaskEdit).Enabled := tof;
      (PageControl1.Pages[0].Controls[i] as TMaskEdit).Color := cor;
    end
    else
    if (PageControl1.Pages[0].Controls[i] is TDBLookupComboBox) then
    begin
      (PageControl1.Pages[0].Controls[i] as TDBLookupComboBox).Enabled := tof;
      (PageControl1.Pages[0].Controls[i] as TDBLookupComboBox).Color := cor;
    end
    Else
    if (PageControl1.Pages[0].Controls[i] is TDBEdit) then
    begin
      (PageControl1.Pages[0].Controls[i] as TDBEdit).Enabled := tof;
      (PageControl1.Pages[0].Controls[i] as TDBEdit).Color := cor;
    end
    else
    if (PageControl1.Pages[0].Controls[i] is TRadioGroup) then
      (PageControl1.Pages[0].Controls[i] as TRadioGroup).Enabled := tof
    else
    if (PageControl1.Pages[0].Controls[i] is TCheckBox) then
      (PageControl1.Pages[0].Controls[i] as TCheckBox).Enabled := tof;
  end;
end;

procedure TfrmCadastro.rgConsultarClick(Sender: TObject);
begin
  case rgConsultar.ItemIndex of
    0:
    begin
      lblConsultar.Caption := 'Código:';
      edtConsultar.Clear;
    end;
    1:
    begin
      lblConsultar.Caption := 'Nome/Descrição:';
      edtConsultar.Clear;
    end;
  end;
  if edtConsultar.CanFocus then
    edtConsultar.SetFocus;
end;

procedure TfrmCadastro.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
  if rgConsultar.ItemIndex = 0 then
  begin
    if not( key in['0'..'9', #8] ) then
    begin
      beep;
      key:=#0;
    end;
  end;
end;

procedure TfrmCadastro.edtConsultarChange(Sender: TObject);
begin
  btnConsultar.Enabled := (edtConsultar.Text <> '');
end;

procedure TfrmCadastro.btnAlterarClick(Sender: TObject);
begin
  strOper := 'A';
  //limpaCampos;
  habilitaBotoes(strOper);
  habilitaCampos(True);
end;

procedure TfrmCadastro.sbPrimeiroClick(Sender: TObject);
begin
  dsConsultar.DataSet.First;
end;

procedure TfrmCadastro.sbProximoClick(Sender: TObject);
begin
  dsConsultar.DataSet.Next;
end;

procedure TfrmCadastro.sbAnteriorClick(Sender: TObject);
begin
  dsConsultar.DataSet.Prior;
end;

procedure TfrmCadastro.sbUltimoClick(Sender: TObject);
begin
  dsConsultar.DataSet.Last;
end;

procedure TfrmCadastro.grdConsultarDblClick(Sender: TObject);
begin
  strOper := 'A';
  habilitaBotoes(strOper);
  habilitaCampos(True);
end;

procedure TfrmCadastro.BtAdicionarClick(Sender: TObject);
begin
  strOper := 'I';
  if dsConsultar.DataSet.Active then
    dsConsultar.DataSet.Close;
end;

procedure TfrmCadastro.BtGravarClick(Sender: TObject);
begin
  strOper := 'C';
  if dsConsultar.DataSet.Active then
    dsConsultar.DataSet.Close;
  habilitaBotoes(strOper);
  habilitaCampos(False);
end;

procedure TfrmCadastro.BtCancelarClick(Sender: TObject);
begin
  strOper := 'C';
  if dsConsultar.DataSet.Active then
    dsConsultar.DataSet.Close;
  habilitaBotoes(strOper);
  habilitaCampos(False);
end;

procedure TfrmCadastro.BtExcluirClick(Sender: TObject);
begin
  strOper := 'C';
  if dsConsultar.DataSet.Active then
    dsConsultar.DataSet.Close;
  habilitaBotoes(strOper);
  habilitaCampos(False);
end;

procedure TfrmCadastro.BtEditarClick(Sender: TObject);
begin
  strOper := 'A';
  habilitaBotoes(strOper);
  habilitaCampos(True);
end;

procedure TfrmCadastro.BtPesquisarClick(Sender: TObject);
begin
     PageControl1.ActivePageIndex := 1;
end;

end.
