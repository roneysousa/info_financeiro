unit uFrmEditarItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, CurrEdit, DBCtrls,
  DB;

type
  TfrmEditarItem = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnConfirma: TBitBtn;
    btnFechar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    edtCDCOR: TDBEdit;
    edtQUANT: TDBEdit;
    edtDesconto: TDBEdit;
    DBEdit6: TDBEdit;
    Label13: TLabel;
    DBEdit3: TDBEdit;
    edtNMCOR: TDBEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure edtCDCORKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edtCDCORChange(Sender: TObject);
    procedure edtDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescontoExit(Sender: TObject);
    procedure edtQUANTKeyPress(Sender: TObject; var Key: Char);
    procedure edtQUANTExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditarItem: TfrmEditarItem;

implementation

uses udmConsulta, uFrmLocCor, uFuncoes, Udm, uDm2;

const
    ScreenWidth: LongInt = 800; {I designed my form in 800x600 mode.}
    ScreenHeight: LongInt = 600;
    
{$R *.dfm}

procedure TfrmEditarItem.btnFecharClick(Sender: TObject);
begin
     If (dmConsultas.cdsItensVendas.State in [dsInsert, dsEdit]) Then
        dmConsultas.cdsItensVendas.Cancel;
      //
      Close;
end;

procedure TfrmEditarItem.btnConfirmaClick(Sender: TObject);
begin
     dmConsultas.cdsItensVendas.Post;
     //
     Close;
end;

procedure TfrmEditarItem.edtCDCORKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
     //
     If (Key = #13) and uFuncoes.Empty(edtCDCOR.Text) Then
     Begin
          Key := #0;
          //
          Application.CreateForm(TfrmBuscaCor, frmBuscaCor);
          try
               frmBuscaCor.showModal;
          Finally
               if not (frmBuscaCor.cdsBusca.IsEmpty) Then
                begin
                    edtCDCOR.Text := frmBuscaCor.cdsBuscaCOR_CODIGO.AsString;
                    Perform(WM_NEXTDLGCTL, 0, 0);
                End;
               //      
               frmBuscaCor.free;
          End;
     End;
     //
     If (Key = #13) and not uFuncoes.Empty(edtCDCOR.Text) Then
     Begin
          Key := #0;
          edtQUANT.SetFocus;
     End;
end;

procedure TfrmEditarItem.FormShow(Sender: TObject);
begin
      dmConsultas.cdsItensVendas.Edit; 
end;

procedure TfrmEditarItem.edtCDCORChange(Sender: TObject);
begin
     if not uFuncoes.Empty(edtCDCOR.Text) Then
      begin
           Dm.FilterCDS(DM2.cdsCores, fsInteger , edtCDCOR.Text);
           //
           If not (DM2.cdsCores.IsEmpty) Then
           begin
                edtCDCOR.Text := uFuncoes.StrZero(edtCDCOR.Text,3);
                edtNMCOR.Text := DM2.cdsCoresCOR_DESCRICAO.AsString;
           End
           Else
           begin
                 MessageBox (Application.Handle, 'Código de cor não cadastrado.',
                            'AVISO', MB_ICONWARNING + MB_OK);
                 edtCDCOR.Clear;
                 edtCDCOR.SetFocus;
                 Exit;
           End;
      End;
end;

procedure TfrmEditarItem.edtDescontoKeyPress(Sender: TObject; var Key: Char);
begin
    If (key = #27) Then
     begin
          Key := #0;
          Close;
     End;
     //
     If (Key = #13) and (StrtoFloat(edtQUANT.text) > 0) Then
      begin
           Key := #0;
           Perform(WM_NEXTDLGCTL, 0, 0);
      End;
end;

procedure TfrmEditarItem.edtDescontoExit(Sender: TObject);
begin
     If (StrtoFloat(edtQUANT.text) > 0) Then
          btnConfirma.SetFocus;
end;

procedure TfrmEditarItem.edtQUANTKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8, #13, #27] ) then
        key:=#0;

     If (key = #27) Then
     begin
          Key := #0;
          Close;
     End;
     //
     If (Key = #13) and not uFuncoes.Empty(edtQUANT.text) Then
     Begin
          Key := #0;
          edtDesconto.SetFocus;
     End;
end;

procedure TfrmEditarItem.edtQUANTExit(Sender: TObject);
begin
     if uFuncoes.Empty(edtCDCOR.Text) Then
     begin
         edtCDCOR.SetFocus;
         Exit;
     End;
     //
     If uFuncoes.Empty(edtQUANT.text) Then
     begin
         edtQUANT.SetFocus;
         Exit;
     End;
end;

procedure TfrmEditarItem.FormCreate(Sender: TObject);
begin
      scaled := true;
      if (screen.width <> ScreenWidth) then
      begin
            height := longint(height) * longint(screen.height) DIV ScreenHeight;
            width := longint(width) * longint(screen.width) DIV ScreenWidth;
            scaleBy(screen.width, ScreenWidth);
      end;
end;

end.
