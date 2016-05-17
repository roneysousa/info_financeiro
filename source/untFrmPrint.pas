unit untFrmPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RpDefine, RpRender, RpRenderCanvas, RpRenderPrinter, StdCtrls,
  Spin, Buttons, ExtCtrls;

type
  TFrmPrint = class(TForm)
    GroupBox1: TGroupBox;
    lblImpressora: TLabel;
    rgPaginas: TRadioGroup;
    btnImprimir: TBitBtn;
    btnFechar: TBitBtn;
    btnOpcoes: TBitBtn;
    Label2: TLabel;
    seCopias: TSpinEdit;
    RvRenderPrinter1: TRvRenderPrinter;
    pnlSelecao: TPanel;
    edtSelecao: TEdit;
    pnlPaginas: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    edtDe: TEdit;
    edtAte: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnOpcoesClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure rgPaginasClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrint: TFrmPrint;

implementation

uses untFrmPreview;


{$R *.dfm}

procedure TFrmPrint.FormCreate(Sender: TObject);
begin
  { Se não houver impressora instalada }
  if FrmPreview.RvNDRWriter1.Printers.Count = 0 then
    lblImpressora.Caption :=
      'Não há impressora instalada!'
  else
    lblImpressora.Caption :=
      FrmPreview.RvNDRWriter1.DeviceName;
  RvRenderPrinter1.FirstPage := 1;
  RvRenderPrinter1.LastPage := 9999;
  RvRenderPrinter1.Selection := '';
end;

procedure TFrmPrint.btnOpcoesClick(Sender: TObject);
begin
  if FrmPreview.RvNDRWriter1.
    ShowPrinterSetupDialog then
  { Atribui o nome da impressora selecionada }
    lblImpressora.Caption :=
      FrmPreview.RvNDRWriter1.DeviceName;
end;

procedure TFrmPrint.btnImprimirClick(Sender: TObject);
begin
  RvRenderPrinter1.NDRStream := FrmPreview.RvNDRWriter1.Stream;
  RvRenderPrinter1.Copies := seCopias.Value;
  //
  case rgPaginas.ItemIndex of
    1: RvRenderPrinter1.Selection :=
         edtSelecao.Text;
    2: begin
         RvRenderPrinter1.FirstPage :=
           StrToInt(edtDe.Text);
         RvRenderPrinter1.LastPage :=
           StrToInt(edtAte.Text);
       end;
  end;
  { Envia relatório para a impressora }
  RvRenderPrinter1.Render;
  {RvRenderPrinter1.Render(
    FrmPreview.RvNDRWriter1.Stream);}
  //  
  Close;
end;

procedure TFrmPrint.rgPaginasClick(Sender: TObject);
begin
  case rgPaginas.ItemIndex of
    0: begin
         pnlSelecao.Visible := False;
         pnlPaginas.Visible := False;
       end;
    1: begin
         pnlSelecao.Visible := True;
         pnlPaginas.Visible := False;
       end;
    2: begin
         pnlSelecao.Visible := False;
         pnlPaginas.Visible := True;
       end;
  end;
end;

procedure TFrmPrint.btnFecharClick(Sender: TObject);
begin
  Close;
end;

end.
