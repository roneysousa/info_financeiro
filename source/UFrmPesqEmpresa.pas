unit UFrmPesqEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, FMTBcd, DB, SqlExpr,
  Provider, DBClient, Mask;

type
  TFrmPesqEmpresas = class(TForm)
    Edit2: TEdit;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    MaskEdit1: TMaskEdit;
    procedure Edit2Change(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesqEmpresas: TFrmPesqEmpresas;

implementation

uses UdmCon,Udm;

{$R *.dfm}

procedure TFrmPesqEmpresas.Edit2Change(Sender: TObject);
begin
  if length(edit2.Text) <> 0 then
    begin
    dmcon.CdsEmpresas.Close;
    if RadioButton2.Checked = True then
       begin
       dmcon.sdsempresas.CommandText := 'SELECT EMP_CODIGO, EMP_CNPJ,EMP_FANTASIA,EMP_RAZAO FROM EMPRESAS WHERE EMP_FANTASIA LIKE :PNOME';
       dmcon.sdsempresas.Params.ParamByName('PNOME').AsString := edit2.Text+'%';
       end;
    if RadioButton3.Checked = True then
       begin
       dmcon.sdsempresas.CommandText := 'SELECT EMP_CODIGO, EMP_CNPJ,EMP_FANTASIA,EMP_RAZAO FROM EMPRESAS WHERE EMP_RAZAO LIKE :PRAZAO ORDER BY EMP_RAZAO';
       dmcon.sdsempresas.Params.ParamByName('PRAZAO').AsString := edit2.Text+'%';
       end;
    dmcon.cdsempresas.Open;
    end;
end;

procedure TFrmPesqEmpresas.RadioButton1Click(Sender: TObject);
begin
  MaskEdit1.Visible := True;
  edit2.Visible := false;
  maskedit1.Left := 8;
  maskedit1.Top := 120;
  maskedit1.SetFocus;
end;

procedure TFrmPesqEmpresas.RadioButton2Click(Sender: TObject);
begin
  MaskEdit1.Visible := False;
  edit2.Visible := true;
  edit2.setfocus;
end;

procedure TFrmPesqEmpresas.RadioButton3Click(Sender: TObject);
begin
  MaskEdit1.Visible := False;
  edit2.Visible := true;
  edit2.setfocus;
end;

procedure TFrmPesqEmpresas.MaskEdit1Change(Sender: TObject);
begin
  if Length(maskedit1.Text) <> 0 then
  begin
    dmcon.CdsEmpresas.Close;
    dmcon.sdsempresas.CommandText := 'SELECT EMP_CODIGO, EMP_CNPJ,EMP_FANTASIA,EMP_RAZAO FROM EMPRESAS WHERE EMP_CNPJ LIKE :PCNPJ ORDER BY EMP_CNPJ';
    dmcon.sdsempresas.Params.ParamByName('PCNPJ').AsString := MaskEdit1.Text+'%';
    dmcon.CdsEmpresas.open;
  end;
end;

procedure TFrmPesqEmpresas.DBGrid1DblClick(Sender: TObject);
begin
  dm.CdsEmpresas.Close;
  dm.SdsEmpresas.ParamByName('pCODIGO').AsString := DBGRID1.Fields[0].AsString;
  dm.CdsEmpresas.Open;
  modalresult := mrOk;
end;

procedure TFrmPesqEmpresas.FormCreate(Sender: TObject);
begin
   dmcon.CdsEmpresas.Close;
   dmcon.sdsempresas.CommandText := 'SELECT EMP_CODIGO, EMP_CNPJ,EMP_FANTASIA,EMP_RAZAO FROM EMPRESAS WHERE EMP_FANTASIA LIKE :PNOME';
   dmcon.sdsempresas.Params.ParamByName('PNOME').AsString := edit2.Text+'%';   
   dmcon.CdsEmpresas.Open;
end;

procedure TFrmPesqEmpresas.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Shift = [ssCtrl]) and (Key = 46) Then
        KEY := 0;
end;

end.
