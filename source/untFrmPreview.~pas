unit untFrmPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, Spin, ImgList, ExtCtrls, RpBase,
  RpFiler, RpRenderText, RpRenderRTF, RpRenderHTML, RpRenderPDF, RpDefine,
  RpRender, RpRenderCanvas, RpRenderPreview, Menus;

type
  TFrmPreview = class(TForm)
    StatusBar1: TStatusBar;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton14: TToolButton;
    ToolButton13: TToolButton;
    ToolBar2: TToolBar;
    ImageList1: TImageList;
    Panel1: TPanel;
    SpinEdit1: TSpinEdit;
    Label3: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label5: TLabel;
    Label1: TLabel;
    ScrollBox1: TScrollBox;
    Splitter1: TSplitter;
    ScrollBox2: TScrollBox;
    MainMenu1: TMainMenu;
    PopupMenu1: TPopupMenu;
    RvRenderPreview1: TRvRenderPreview;
    RvRenderPDF1: TRvRenderPDF;
    RvRenderHTML1: TRvRenderHTML;
    RvRenderRTF1: TRvRenderRTF;
    RvRenderText1: TRvRenderText;
    SaveDialog1: TSaveDialog;
    RvNDRWriter1: TRvNDRWriter;
    RvRenderPreview2: TRvRenderPreview;
    Arquivo1: TMenuItem;
    Imprimir1: TMenuItem;
    Pgina1: TMenuItem;
    Zoom1: TMenuItem;
    SalvarComo1: TMenuItem;
    Fechar1: TMenuItem;
    Primeira1: TMenuItem;
    Anterior1: TMenuItem;
    Prxima1: TMenuItem;
    ltima1: TMenuItem;
    MaisZoom1: TMenuItem;
    MenosZoom1: TMenuItem;
    PDF1: TMenuItem;
    HTML1: TMenuItem;
    RTF1: TMenuItem;
    XT1: TMenuItem;
    ToolButton15: TToolButton;
    procedure MaisZoom1Click(Sender: TObject);
    procedure MenosZoom1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure SalvarComo1Click(Sender: TObject);
    procedure XT1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
  private
    Pressionado: Boolean;
  public
   constructor Create(AOWner: TComponent;
     Relatorio: TMemoryStream;
     Titulo: string); reintroduce;
   procedure SalvarComo(const Index: SmallInt);
  end;

var
  FrmPreview: TFrmPreview;

implementation

uses untFrmPrint, uFuncoes;

{$R *.dfm}

{ TFrmPreview }

constructor TFrmPreview.Create(AOWner: TComponent;
  Relatorio: TMemoryStream; Titulo: string);
begin
inherited Create(AOWner);
  { Título do Relatório no Caption do Formulário}
  Caption := Titulo; 
  { Atribui o stream do relatório ao RvNDRWriter }  
  RvNDRWriter1.Stream := Relatorio; 
  { Passagem do Stream ao RvRenderPreview 1 }
  RvRenderPreview1.Render(RvNDRWriter1.Stream);
  { Passagem do Stream ao RvRenderPreview 2 }
  RvRenderPreview2.Render(RvRenderPreview1.NDRStream); 
  { Atribui o Nº total de páginas ao SpinEdit }
  SpinEdit1.MaxValue := RvRenderPreview1.Pages;
  { Atualiza o label de total de páginas }
  Label1.Caption := 'de ' +
    IntToStr(SpinEdit1.MaxValue); 
end;

procedure TFrmPreview.MaisZoom1Click(Sender: TObject);
begin
  if RvRenderPreview1.ZoomFactor < 200 then
    RvRenderPreview1.ZoomIn;
  if RvRenderPreview2.ZoomFactor < 200 then
    RvRenderPreview2.ZoomIn;
end;

procedure TFrmPreview.MenosZoom1Click(Sender: TObject);
begin
  if RvRenderPreview1.ZoomFactor > 25 then 
    RvRenderPreview1.ZoomOut;
  if RvRenderPreview2.ZoomFactor > 25 then
    RvRenderPreview2.ZoomOut;
end;

procedure TFrmPreview.ToolButton2Click(Sender: TObject);
begin
{ Primeira Página }
  RvRenderPreview1.RenderPage(1);
  if RvRenderPreview1.Pages > 1 then
    RvRenderPreview2.RenderPage(2)
  else
    RvRenderPreview2.RenderPage(1);
end;

procedure TFrmPreview.ToolButton3Click(Sender: TObject);
begin
 { Página Anterior }
  if RvRenderPreview1.CurrentPage > 1 then
  begin
    RvRenderPreview1.PrevPage;
    RvRenderPreview2.RenderPage(
      RvRenderPreview1.CurrentPage + 1);
  end;
end;

procedure TFrmPreview.ToolButton4Click(Sender: TObject);
begin
  if RvRenderPreview1.CurrentPage < 
     RvRenderPreview1.Pages then
  begin
    RvRenderPreview1.NextPage;
    RvRenderPreview2.RenderPage(
      RvRenderPreview1.CurrentPage + 1);
  end;
end;

procedure TFrmPreview.ToolButton5Click(Sender: TObject);
begin
  { Última Página }
  RvRenderPreview1.RenderPage(
    RvRenderPreview1.Pages);
  RvRenderPreview2.RenderPage(
    RvRenderPreview2.Pages);
end;

procedure TFrmPreview.ToolButton13Click(
  Sender: TObject);
begin
  if not Pressionado then
  begin
    ToolButton13.Down := True;
    { Caso o relatório tenha mais de uma página }
    if RvRenderPreview1.Pages > 1 then
      RvRenderPreview2.RenderPage(2)
    else
      RvRenderPreview2.RenderPage(1);
    ScrollBox2.Visible := True;
    Splitter1.Visible := True;
    Pressionado := True;
  end
  else
  begin
    ToolButton13.Down := False;
    ScrollBox2.Visible := False;
    Splitter1.Visible := False;
    Pressionado := False;
  end;
end;

procedure TFrmPreview.SalvarComo(
  const Index: SmallInt);
begin
  SaveDialog1.FilterIndex := index;
  if (SaveDialog1.Execute) and
     (SaveDialog1.FileName <> '') then
    case Index of
      1: RvRenderPDF1.PrintRender(
           RvNDRWriter1.Stream, SaveDialog1.FileName);
      2: RvRenderRTF1.PrintRender(
           RvNDRWriter1.Stream, SaveDialog1.FileName);
      3: RvRenderHTML1.PrintRender(
           RvNDRWriter1.Stream, SaveDialog1.FileName);
      4: RvRenderText1.PrintRender(
           RvNDRWriter1.Stream, SaveDialog1.FileName);
    end;
end;

procedure TFrmPreview.SalvarComo1Click(Sender: TObject);
begin
  SalvarComo(1);
end;

procedure TFrmPreview.XT1Click(Sender: TObject);
begin
  SalvarComo((Sender as TMenuItem).Tag);
end;

procedure TFrmPreview.Imprimir1Click(Sender: TObject);
begin
  FrmPrint := TFrmPrint.Create(Self);
  try
    FrmPrint.ShowModal;
  finally
    FrmPrint.Release;
    FrmPrint := nil;
  end;
end;

procedure TFrmPreview.Fechar1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPreview.ToolButton11Click(Sender: TObject);
begin
  RvRenderPreview1.ZoomFactor :=
    RvRenderPreview1.ZoomPageWidthFactor;
end;

procedure TFrmPreview.ToolButton12Click(Sender: TObject);
begin
  RvRenderPreview1.ZoomFactor :=
    RvRenderPreview1.ZoomPageFactor;
end;

procedure TFrmPreview.ComboBox1Change(Sender: TObject);
begin
  RvRenderPreview1.ZoomFactor :=
    StrToInt(ComboBox1.Text);
  RvRenderPreview2.ZoomFactor :=
    StrToInt(ComboBox1.Text);
end;

procedure TFrmPreview.FormShow(Sender: TObject);
begin
  RvRenderPreview1.ZoomFactor := 100;
end;

procedure TFrmPreview.SpinEdit1Change(Sender: TObject);
begin
 if not uFuncoes.Empty (SpinEdit1.Text) Then
 begin
  RvRenderPreview1.RenderPage(SpinEdit1.Value);
  if RvRenderPreview1.CurrentPage = 1 then
  begin
    if RvRenderPreview1.Pages > 1 then
      RvRenderPreview2.RenderPage(2)
    else
      RvRenderPreview2.RenderPage(1);
  end
  else
  if (RvRenderPreview1.CurrentPage > 1) and
     (RvRenderPreview1.CurrentPage < RvRenderPreview1.Pages) then
    RvRenderPreview2.RenderPage(RvRenderPreview1.CurrentPage + 1)
  else
  if (RvRenderPreview1.Pages = RvRenderPreview1.Pages) then
    RvRenderPreview2.RenderPage(RvRenderPreview1.Pages);
 //
 End;
end;

procedure TFrmPreview.ToolButton15Click(Sender: TObject);
begin
      Imprimir1Click(Sender);
end;

end.
