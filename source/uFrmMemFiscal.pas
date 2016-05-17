unit uFrmMemFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit;

type
  TfrmMemoriaFiscal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtSair: TBitBtn;
    btImprimir: TBitBtn;
    Label1: TLabel;
    edtDTINIC: TDateEdit;
    edtDTFINA: TDateEdit;
    Label2: TLabel;
    procedure BtSairClick(Sender: TObject);
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINAExit(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMemoriaFiscal: TfrmMemoriaFiscal;
  W_DTINIC, W_DTFINA : String;

implementation

Uses uBematech, uFiscal, uFrmVendas;

{$R *.dfm}

procedure TfrmMemoriaFiscal.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmMemoriaFiscal.edtDTINICExit(Sender: TObject);
begin
     If (edtDTINIC.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtDTINIC.Text);
        except
          on EConvertError do
          begin
             ShowMessage ('Data Inválida!');
             edtDTINIC.Date := Date();
             edtDTINIC.SetFocus;
             Exit;
          End;
        end;
     End;

end;

procedure TfrmMemoriaFiscal.edtDTFINAExit(Sender: TObject);
begin
     If (edtDTFINA.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtDTFINA.Text);
            //
            If (edtDTINIC.Date > edtDTFINA.Date) Then
            Begin
                Application.MessageBox('Período inicial maior quer período final!!!','ATENÇÃO',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                edtDTINIC.SetFocus;
                Exit;
            End;
        except
          on EConvertError do
          begin
             ShowMessage ('Data Inválida!');
             edtDTFINA.Date := Date();
             edtDTFINA.SetFocus;
             Exit;
          End;
        end;
     End;
end;

procedure TfrmMemoriaFiscal.btImprimirClick(Sender: TObject);
Var
     M_DTINIC, M_DTFINA : String;
     iRetorno : Integer;
begin
     If (edtDTINIC.Text = '  /  /    ') Then
     Begin
           Application.MessageBox('Digite a período inicial!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDTINIC.SetFocus;
           Exit;
     End;
     //
     If (edtDTFINA.Text = '  /  /    ') Then
     Begin
           Application.MessageBox('Digite a período final!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDTFINA.SetFocus;
           Exit;
     End;
     //

     If (edtDTINIC.Date > edtDTFINA.Date) Then
     Begin
          Application.MessageBox('Período inicial maior quer periído final!!!','ATENÇÃO',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtDTINIC.SetFocus;
          Exit;
     End;
     //
   Try
     Screen.Cursor := crHourGlass;
     //
     btImprimir.Enabled := False;
     Try
         M_DTINIC := edtDTINIC.Text;
         M_DTFINA := edtDTFINA.Text;
         //
         uFiscal.FISCAL('MemoriaFiscal', uFrmVendas.M_IMPRES ,M_DTINIC, M_DTFINA);
         close;
     Except
          on Exc:Exception do
          begin
               Application.MessageBox(PChar('Erro ao tentar fazer leitura da memória fiscal!!!'+#13
                        + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               Close;
          End;
     End;
   Finally
      Screen.Cursor := crDefault;
      btImprimir.Enabled := True;
  end;
     Application.ProcessMessages;
end;

procedure TfrmMemoriaFiscal.FormShow(Sender: TObject);
begin
    edtDTINIC.Date := Date();
    edtDTFINA.Date := Date();
end;

procedure TfrmMemoriaFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

end.
