unit uFrmRelEtiqProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, Mask, ToolEdit, CurrEdit, Printers,
  DB, DBTables, DBCtrls, Spin, CJVBarCode, CJVDBBarcode, QuickRpt, QRCtrls,
  CJVQRBarCode, FMTBcd, SqlExpr, DBClient, RpDefine, RpBase, RpSystem, rpBars;

type
  TfrmQuantEtiquetas = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    edtQTETIQ: TCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtLINENT: TEdit;
    edtCOLENT: TEdit;
    DBText1: TDBText;
    dsProduto: TDataSource;
    sedQTCOLU: TSpinEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtPOSICAO: TSpinEdit;
    codBarras: TCJVQRBarCode;
    dsEtiquetas: TDataSource;
    Image1: TImage;
    dsParametros: TDataSource;
    qryProduto: TSQLQuery;
    BtSair: TBitBtn;
    BtImprimir: TBitBtn;
    tbEtiquetas: TClientDataSet;
    tbEtiquetasEQT_CDPROD: TStringField;
    tbEtiquetasEQT_NMPROD: TStringField;
    tbEtiquetasEQT_VLVEND: TCurrencyField;
    tbEtiquetasEQT_IMGBAR: TGraphicField;
    edtCDPROD: TEdit;
    Label6: TLabel;
    qryProdutoPRO_CODIGO: TStringField;
    qryProdutoPRO_BARRAS: TStringField;
    qryProdutoPRO_DESCRICAO: TStringField;
    qryProdutoPRO_VLVENDA: TFMTBCDField;
    spLocProduto: TSpeedButton;
    cmbTamanho: TComboBox;
    Label7: TLabel;
    RvSystem2: TRvSystem;
    procedure spFecharClick(Sender: TObject);
    procedure edtLINENTKeyPress(Sender: TObject; var Key: Char);
    procedure edtCOLENTKeyPress(Sender: TObject; var Key: Char);
    procedure edtPOSICAOChange(Sender: TObject);
    procedure edtQTETIQKeyPress(Sender: TObject; var Key: Char);
    procedure edtPOSICAOKeyPress(Sender: TObject; var Key: Char);
    procedure sedQTCOLUChange(Sender: TObject);
    procedure sedQTCOLUExit(Sender: TObject);
    procedure edtPOSICAOEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure BtImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCDPRODKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDPRODExit(Sender: TObject);
    procedure edtQTETIQEnter(Sender: TObject);
    procedure edtCDPRODChange(Sender: TObject);
    procedure edtQTETIQChange(Sender: TObject);
    procedure spLocProdutoClick(Sender: TObject);
    procedure RvSystem2Print(Sender: TObject);
  private
     Procedure CARREGAR_DADOS_02;
     Procedure CARREGAR_DADOS;
     Procedure IMPRIMIR_ETIQUETAS_02;
     function MMtoPixelX (MM : Integer) : Longint;
     function MMtoPixelY (MM : Integer) : Longint;
     Procedure INCLUIR_REG_BRANCOS;
     Procedure IMAGEM;
     procedure ETIQUETA;
     procedure LIMPAR_IMAGEM;
    { Private declarations }
  public
    procedure PROCURAR;
    { Public declarations }
  end;

var
  frmQuantEtiquetas: TfrmQuantEtiquetas;
  M_LININI, M_CONINI, W_QTREGI : Integer;
  M_CDPROD , M_NMPROD : String;
  M_VLVEND : Real;
  M_MAXIMO : Integer;

implementation

uses uFuncoes, Udm, uRelEtiquetaProdutos, uFrmBuscaProdutos,
  uFrmNewEtiqueta;

{$R *.dfm}

procedure TfrmQuantEtiquetas.spFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmQuantEtiquetas.edtLINENTKeyPress(Sender: TObject; var Key: Char);
begin
   If not( key in['0'..'9',#8] ) then
     key:=#0;
end;

procedure TfrmQuantEtiquetas.edtCOLENTKeyPress(Sender: TObject; var Key: Char);
begin
   If not( key in['0'..'9',#8,#13] ) then
     key:=#0;
end;

procedure TfrmQuantEtiquetas.IMPRIMIR_ETIQUETAS_02;
Var
   M_LINENT, M_COLENT : String;
   SALTALINHA, TAMLIN , I ,M_CONTAD, M_POSIMP : Integer;
   M_COLUNA : array[1..3] of integer;
   M_LINHA  : array[1..10] of integer;
   M_LICONT : integer;
begin
end;

procedure TfrmQuantEtiquetas.edtPOSICAOChange(Sender: TObject);
Var
    W_LINHA, W_COLUNA : Real;
begin
     If not uFuncoes.Empty(edtPOSICAO.Text) Then
     begin
       If (sedQTCOLU.Value = 4) Then
       begin
         W_LINHA  := Int(edtPOSICAO.Value/4)+1;
         W_COLUNA := Int(edtPOSICAO.Value)-(Int(edtPOSICAO.Value/4)*4);
         //
         If (W_COLUNA = 0) Then
         begin
             edtCOLENT.Text := '4';
             edtLINENT.Text := FloattoStr(W_LINHA-1);
         End
         Else
         begin
             edtCOLENT.Text := FloattoStr(Int(W_COLUNA));
             edtLINENT.Text := FloattoStr(W_LINHA);
         End;
      End;
      //
       If (sedQTCOLU.Value = 3) Then
       begin
         If (edtPOSICAO.Value/3=0) Then
            W_LINHA  := Int(edtPOSICAO.Value/3)
         Else
            W_LINHA  := Int(edtPOSICAO.Value/3)+1;
         //
         W_COLUNA := Int(edtPOSICAO.Value)-(Int(edtPOSICAO.Value/3)*3);
         //
         If (W_COLUNA = 0) Then
         begin
             edtCOLENT.Text := '3';
             edtLINENT.Text := FloattoStr(Int(W_LINHA-1));
         End
         Else
         begin
             edtCOLENT.Text := FloattoStr(Int(W_COLUNA));
             edtLINENT.Text := FloattoStr(W_LINHA);
         End;
         //
       End;
     End
     else
     begin
         edtLINENT.Text := '1';
         edtCOLENT.Text := '1';
     End;

end;

procedure TfrmQuantEtiquetas.edtQTETIQKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8, #13, #27] ) then
          key:=#0;
     //
     If (Key = #27) Then
       Close;
     //
     If (Key = #13) and
        not uFuncoes.Empty(edtQTETIQ.Text) Then
     begin
          key:=#0;
          BtImprimir.SetFocus;
     End;
end;

procedure TfrmQuantEtiquetas.edtPOSICAOKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
          key:=#0;
     //
{     If (Key = #13) Then
     begin
          Key := #0;
          sbReceberClick(Sender);
     End;}
end;

procedure TfrmQuantEtiquetas.sedQTCOLUChange(Sender: TObject);
begin
   If not uFuncoes.Empty(sedQTCOLU.Text) Then
   begin
     If (sedQTCOLU.Value >= 3) or (sedQTCOLU.Value <= 4) Then
     begin
         //
         If (sedQTCOLU.Value = 3) Then
         begin
            edtPOSICAO.MaxValue := 30;
            edtPOSICAO.Value    := 1;
         End;
         //
         If (sedQTCOLU.Value = 4) Then
         begin
            edtPOSICAO.MaxValue := 80;
            edtPOSICAO.Value    := 1;
         End;
    End;
  End;

end;

Procedure TfrmQuantEtiquetas.sedQTCOLUExit(Sender: TObject);
begin
     If uFuncoes.Empty(sedQTCOLU.Text) Then
       sedQTCOLU.Value := 4;
end;

procedure TfrmQuantEtiquetas.edtPOSICAOEnter(Sender: TObject);
begin
     If uFuncoes.Empty(edtQTETIQ.Text) or (edtQTETIQ.Value = 0)  Then
        edtQTETIQ.SetFocus;
end;

function TfrmQuantEtiquetas.MMtoPixelX (MM : Integer) : Longint;
var
mmPointX : Real;
PageSize, OffSetUL : TPoint;
begin
mmPointX := Printer.PageWidth / GetDeviceCaps(Printer.Handle,HORZSIZE);
Escape (Printer.Handle,GETPRINTINGOFFSET,0,nil,@OffSetUL);
Escape (Printer.Handle,GETPHYSPAGESIZE,0,nil,@PageSize);
if MM > 0 then
Result := round ((MM * mmPointX) - OffSetUL.X)
else
Result := round (MM * mmPointX);
end;


function TfrmQuantEtiquetas.MMtoPixelY(MM: Integer): Longint;
var
mmPointY : Real;
PageSize, OffSetUL : TPoint;
begin
mmPointY := Printer.PageHeight /
GetDeviceCaps(Printer.Handle,VERTSIZE);
Escape (Printer.Handle,GETPRINTINGOFFSET,0,nil,@OffSetUL);
Escape (Printer.Handle,GETPHYSPAGESIZE,0,nil,@PageSize);
if MM > 0 then
Result := round ((MM * mmPointY) - OffSetUL.Y)
else
Result := round (MM * mmPointY);
end;

procedure TfrmQuantEtiquetas.CARREGAR_DADOS_02;
Var
   M_CONTAD, M_TOREGI : Integer;
   M_QTETIQ : Real;
   M_IMGBAR : TImage;
begin
     M_CONTAD := 1;
     M_QTETIQ := edtQTETIQ.Value;
     M_TOREGI := dm.CdsConfig.FieldByName('CFG_ETIQUETAPRODUTO').AsInteger - 1;
     W_QTREGI := 1;
     //
     If (tbEtiquetas.Active = False) Then
         tbEtiquetas.Open;
     //
     If (tbEtiquetas.RecordCount > 0) Then
        tbEtiquetas.EmptyDataSet;
        // uFuncoes.EsvaziaTabela(dmInfoModa.tbEtiquetas);
     //
     If (dm.CdsConfig.FieldByName('CFG_ETIQUETAPRODUTO').AsInteger > 0) Then
     Begin
       While (W_QTREGI <= M_TOREGI) do
       Begin
            tbEtiquetas.Append;
            tbEtiquetas.Post;
            //
            W_QTREGI := W_QTREGI+1;
       End;
     End;
     //
     M_CDPROD  := qryProduto.FieldByName('PRO_CODIGO').AsString;
     M_NMPROD  := qryProduto.FieldByName('PRO_DESCRICAO').AsString;
     M_VLVEND  := qryProduto.FieldByName('PRO_VLVENDA').AsFloat;
     //
     While (M_CONTAD <= M_QTETIQ) DO
     begin
          tbEtiquetas.Append;
          tbEtiquetas.FieldByName('EQT_CDPROD').AsString := M_CDPROD;
          tbEtiquetas.FieldByName('EQT_NMPROD').AsString := M_NMPROD;
          tbEtiquetas.FieldByName('EQT_VLVEND').AsFloat  := M_VLVEND;
          //
          //tbEtiquetas.FieldByName('EQT_IMGBAR').Assign(Image1.Picture.Bitmap);
          // Nova
          tbEtiquetas.FieldByName('EQT_IMGBAR').Assign(Image1.Picture.Bitmap);
          // Grava
          tbEtiquetas.Post;
          //
          M_CONTAD := M_CONTAD+1;
     End;
     //
     tbEtiquetas.Close;
     //
     If (dm.CdsConfig.Active = False) Then
          dm.CdsConfig.Open;
     //
     dm.CdsConfig.Edit;
        dm.CdsConfig.FieldByName('CFG_ETIQUETAPRODUTO').AsFloat :=
                dm.CdsConfig.FieldByName('CFG_ETIQUETAPRODUTO').AsFloat+edtQTETIQ.Value;
     dm.CdsConfig.Post;
     dm.CdsConfig.ApplyUpdates(0);
     //
     ETIQUETA;
end;

procedure TfrmQuantEtiquetas.INCLUIR_REG_BRANCOS;
Var
    M_TOREGI : Integer;
begin
     W_QTREGI := StrtoInt(edtQTETIQ.Text);
     M_TOREGI := 1;
     //
     If (dm.CdsConfig.FieldByName('CFG_ETIQUETAPRODUTO').AsInteger > 0) Then
       While (M_TOREGI<=W_QTREGI) do
       Begin
            tbEtiquetas.Append;
            tbEtiquetas.Post;
       End;
     //
     //dmInfoModa.tbEtiquetas.Close;
end;


procedure TfrmQuantEtiquetas.IMAGEM;
var
  bitmap : tbitmap;
  dc : hdc;
  desktoprect : trect;
  desktopcanvas : tcanvas;
  x, y : integer;
Begin
  dc:=getdc(getdesktopwindow);
 try
   desktopcanvas:=tcanvas.create;
   bitmap:=tbitmap.create;
   try
     bitmap.Width  := codBarras.Width;
     bitmap.Height := codBarras.Height;
     desktopcanvas.handle:=dc;
     desktoprect := rect(codBarras.Left,codBarras.Top,codBarras.Width,codBarras.Height);
     bitmap.canvas.CopyRect(desktoprect,desktopcanvas,desktoprect);
     Image1.Picture.Bitmap := bitmap;
   finally
   bitmap.free;
   desktopcanvas.free;
   end;
 finally
 releasedc(getdesktopwindow,dc);
 end;

end;

procedure TfrmQuantEtiquetas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     tbEtiquetas.Close;
     //
     Action := caFree; 
end;

procedure TfrmQuantEtiquetas.FormCreate(Sender: TObject);
begin
     M_MAXIMO := 65;
end;

procedure TfrmQuantEtiquetas.BtSairClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmQuantEtiquetas.BtImprimirClick(Sender: TObject);
begin
 If uFuncoes.Empty(edtQTETIQ.Text) Then
 Begin
      ShowMessage('Digite a quantidade de etiquetas!!!');
      edtQTETIQ.SetFocus;
      Exit;
 End;
 //
 if (cmbTamanho.ItemIndex  = 0) Then
 begin
   If (edtQTETIQ.Value > 0) Then
   begin
       //
       M_MAXIMO := 65;
       //
       BtImprimir.Enabled := False;
       Application.CreateForm(TfrmRelEtiqueta, frmRelEtiqueta);
       Try
          //
          CARREGAR_DADOS_02;
          //
          If (tbEtiquetas.Active = False) Then
             tbEtiquetas.Open;
          frmRelEtiqueta.qrEtiquetas.Preview ;
       Finally
          frmRelEtiqueta.Free;
          tbEtiquetas.Close;
          BtImprimir.Enabled :=  True;
          //
          edtCDPROD.Clear;
          edtQTETIQ.Clear;
          //
          codBarras.Texto := '0000000000000';
          //
          qryProduto.Close;
          edtCDPROD.SetFocus;
          //
       End;
   End;
 End
 Else
 begin
      If (edtQTETIQ.Value > 0) Then
       begin
           //
           M_MAXIMO := 25;
           //
           BtImprimir.Enabled := False;
           Application.CreateForm(TfrmNewEtiqueta, frmNewEtiqueta);
           Try
              //
              CARREGAR_DADOS;
              //
              If (tbEtiquetas.Active = False) Then
                 tbEtiquetas.Open;
              frmNewEtiqueta.qrEtiquetas.Preview ;
           Finally
              frmNewEtiqueta.Free;
              tbEtiquetas.Close;
              BtImprimir.Enabled :=  True;
              //
              edtCDPROD.Clear;
              edtQTETIQ.Clear;
              //
              codBarras.Texto := '0000000000000';
              //
              qryProduto.Close;
              edtCDPROD.SetFocus;
              //
           End;
       End;
 End;
end;

procedure TfrmQuantEtiquetas.FormShow(Sender: TObject);
begin
     ETIQUETA;
     //
     If (dm.CdsConfigCFG_PADRAOBARRAS.AsString = '1') Then
        codBarras.Tipo := btCodeEAN13
     Else
        codBarras.Tipo := btCode128C;
     //
     edtQTETIQ.Value := 0;
     //
    edtLINENT.Text :='1';
    edtCOLENT.Text :='1';
    //
    codBarras.Texto := '0000000000000';
    //qryProduto.FieldByName('PRO_BARRAS').AsString;
    //
    //Image1.Canvas.Draw(0,0,codBarras.Picture.Bitmap);
    GeraBarrasEAN13('0000000000000', Image1.Canvas);
    //
    edtCDPROD.SetFocus;
    BtImprimir.Enabled := False;
end;

procedure TfrmQuantEtiquetas.edtCDPRODKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
       key:=#0;
     //
     If (Key = #13) and uFuncoes.Empty(edtCDPROD.Text) Then
     Begin
         key:=#0;
         spLocProdutoClick(Sender);
     End;
     //
     If (Key = #13) and
        not uFuncoes.Empty(edtCDPROD.Text) Then
     begin
          key:=#0;
          edtQTETIQ.SetFocus;
     End;
end;

procedure TfrmQuantEtiquetas.PROCURAR;
begin
     With qryProduto do
     Begin
          Close;
          Params.ParamByName('pCODIGO').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
          Params.ParamByName('pBARRAS').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
          open;
     End;
     //
     If (qryProduto.IsEmpty) Then
     Begin
         Application.MessageBox(PChar('C�digo de produto n�o cadastrado!!!'),
                  'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         edtCDPROD.Clear;
         edtCDPROD.SetFocus;
         Exit;
     End
     Else
     begin
         edtCDPROD.Text  := qryProduto.FieldByName('PRO_CODIGO').AsString;
         codBarras.Texto := qryProduto.FieldByName('PRO_BARRAS').AsString;
         //
         //LIMPAR_IMAGEM;
         try
             Image1.Canvas.Draw(0,0,codBarras.Picture.Bitmap);
             GeraBarrasEAN13(qryProduto.FieldByName('PRO_BARRAS').AsString, Image1.Canvas);
         Except
            on e: exception do
            begin
                Application.MessageBox(PChar('Erro: ao tentar cria image.'+#13
                        + E.Message),
                        'ATEN��O', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
            End;
         End;
         edtQTETIQ.SetFocus;
     End;
end;

procedure TfrmQuantEtiquetas.edtCDPRODExit(Sender: TObject);
begin
      If not uFuncoes.Empty(edtCDPROD.Text) Then
        PROCURAR;
end;

procedure TfrmQuantEtiquetas.edtQTETIQEnter(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDPROD.Text) Then
        edtCDPROD.SetFocus;
end;

procedure TfrmQuantEtiquetas.edtCDPRODChange(Sender: TObject);
begin
      If not uFuncoes.Empty (edtCDPROD.Text)
        and (edtQTETIQ.Value > 0) Then
         BtImprimir.Enabled := True
      Else
         BtImprimir.Enabled := False;
end;

procedure TfrmQuantEtiquetas.edtQTETIQChange(Sender: TObject);
begin
      If not uFuncoes.Empty (edtCDPROD.Text)
        and (edtQTETIQ.Value > 0) Then
         BtImprimir.Enabled := True
      Else
         BtImprimir.Enabled := False;
end;

procedure TfrmQuantEtiquetas.spLocProdutoClick(Sender: TObject);
begin
  with TfrmBuscaProduto.create(self) do
  try
     uFrmBuscaProdutos.M_NRFROM := 8;
     showmodal;
  finally
    edtCDPROD.Text := M_CDPROD;
    free;
  end;
end;

procedure TfrmQuantEtiquetas.LIMPAR_IMAGEM;
begin
     Image1.Canvas.Brush.Color := clWhite;
     Image1.Canvas.Rectangle( 0, 0, Image1.Width, Image1.Height );
     Image1.Picture.Bitmap.Assign(nil);
end;

procedure TfrmQuantEtiquetas.ETIQUETA;
begin
     dm.parametros;
     //
     If (dm.CdsConfig.FieldByName('CFG_ETIQUETAPRODUTO').AsFloat >= M_MAXIMO) Then
     Begin
          dm.CdsConfig.Edit;
          dm.CdsConfig.FieldByName('CFG_ETIQUETAPRODUTO').AsFloat :=
            dm.CdsConfig.FieldByName('CFG_ETIQUETAPRODUTO').AsFloat-M_MAXIMO;
          dm.CdsConfig.Post;
          dm.CdsConfig.ApplyUpdates(0);
     End;
end;

procedure TfrmQuantEtiquetas.CARREGAR_DADOS;
Var
   M_CONTAD, M_TOREGI : Integer;
   M_QTETIQ : Real;
   M_IMGBAR : TImage;
begin
     M_CONTAD := 1;
     M_QTETIQ := edtQTETIQ.Value;
     M_TOREGI := dm.CdsConfig.FieldByName('CFG_ETIQUETAPRODUTO').AsInteger - 1;
     W_QTREGI := 1;
     //
     If (tbEtiquetas.Active = False) Then
         tbEtiquetas.Open;
     //
     If (tbEtiquetas.RecordCount > 0) Then
        tbEtiquetas.EmptyDataSet;
        // uFuncoes.EsvaziaTabela(dmInfoModa.tbEtiquetas);
     //
     If (dm.CdsConfig.FieldByName('CFG_ETIQUETAPRODUTO').AsInteger > 0) Then
     Begin
       While (W_QTREGI <= M_TOREGI) do
       Begin
            tbEtiquetas.Append;
            tbEtiquetas.Post;
            //
            W_QTREGI := W_QTREGI+1;
       End;
     End;
     //
     M_CDPROD  := qryProduto.FieldByName('PRO_CODIGO').AsString;
     M_NMPROD  := qryProduto.FieldByName('PRO_DESCRICAO').AsString;
     M_VLVEND  := qryProduto.FieldByName('PRO_VLVENDA').AsFloat;
     //
     While (M_CONTAD <= M_QTETIQ) DO
     begin
          tbEtiquetas.Append;
          tbEtiquetas.FieldByName('EQT_CDPROD').AsString := M_CDPROD;
          tbEtiquetas.FieldByName('EQT_NMPROD').AsString := M_NMPROD;
          tbEtiquetas.FieldByName('EQT_VLVEND').AsFloat  := M_VLVEND;
          //
          tbEtiquetas.FieldByName('EQT_IMGBAR').Assign(Image1.Picture.Bitmap);
          // Grava
          tbEtiquetas.Post;
          //
          M_CONTAD := M_CONTAD+1;
     End;
     //
     tbEtiquetas.Close;
     //
     If (dm.CdsConfig.Active = False) Then
          dm.CdsConfig.Open;
     //
     dm.CdsConfig.Edit;
        dm.CdsConfig.FieldByName('CFG_ETIQUETAPRODUTO').AsFloat :=
                dm.CdsConfig.FieldByName('CFG_ETIQUETAPRODUTO').AsFloat+edtQTETIQ.Value;
     dm.CdsConfig.Post;
     dm.CdsConfig.ApplyUpdates(0);
     //
     ETIQUETA;
end;

Procedure PrintBarcodeEAN(RVSystem:TRVSystem; Row, Column:Double; Value:String);
Begin
   With TRPBarsEAN.Create(RVSystem.BaseReport) do Begin
     BarHeight  := 1.2;
     BarWidth   := 0.032;
     WideFactor := BarWidth;
     Text := Value;
     PrintXY(Column,Row);
     Free;
   end;
End;

procedure TfrmQuantEtiquetas.RvSystem2Print(Sender: TObject);
Var Factor      : Double;
    CurLabel    : Integer;
    CurCol      : Double;
    CurRow      : Double;
    MarginTop   : Double;
    MarginLeft  : Double;
    LabelRow    : Integer;
    LabelRows   : Integer;
    LabelCols   : Integer;
    LabelWidth  : Double;
    LabelHeight : Double;

begin

   MarginLeft  := 1.4;
   MarginTop   := 2.2;
   LabelWidth  := 3.8;
   LabelHeight := 2.4;
   LabelRows   := 5;
   LabelCols   := 5;

   CurLabel := 0;
   LabelRow := 0;

   //GERAR_ETIQUETAS;
   //
   RVSystem2.BaseReport.SetFont('Arial',6);
   //While not qryEtiquetas.Eof do Begin
       Factor   := (CurLabel Mod LabelCols);
       CurCol   := (Factor*LabelWidth)+MarginLeft;
       CurRow   := (LabelRow * LabelHeight) + MarginTop;

       RVSystem2.BaseReport.GotoXY(CurCol,CurRow-0.04);
       //
       {RVSystem2.BaseReport.PrintLeft( Copy(qryEtiquetas.FieldByName('EQT_NMPROD').AsString,1,26),CurCol);
       If (qryEtiquetas.FieldByName('EQT_VLVEND').AsFloat > 0) Then
       begin
            RVSystem2.BaseReport.GotoXY(CurCol,CurRow+0.14);
            RVSystem2.BaseReport.PrintRight( FormatFloat('###,##0.#0',qryEtiquetas.FieldByName('EQT_VLVEND').AsFloat),CurCol+3.2);
       End;}
       //
       //If not Empty(qryEtiquetas.FieldByName('EQT_CDPROD').AsString) Then
        //  PrintBarCodeEAN(RVSystem2,CurRow + 0.18,CurCol + 0.04, qryEtiquetas.FieldByName('EQT_CDPROD').AsString);
          //PrintBarCodeEAN(RVSystem2,CurRow + 0.18,CurCol + 0.04,'471026820'+Format('%0.3d',[qryEtiquetas.FieldByName('EQT_CDPROD').AsInteger]));
       //
       Inc(CurLabel);
       If Factor=LabelCols-1 Then Inc(LabelRow);
       If LabelRow>=LabelRows Then Begin
          LabelRow := 0;
          RVSystem2.BaseReport.NewPage;
       End;
  {     qryEtiquetas.Next;
   End;
   qryEtiquetas.Close;}
end;

End.
