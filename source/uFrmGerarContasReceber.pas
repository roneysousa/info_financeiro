unit uFrmGerarContasReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit;

type
  TfrmGeraContasReceber = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnFechar: TBitBtn;
    Label1: TLabel;
    cmbGrupo: TComboBox;
    Label2: TLabel;
    edtDTVENC: TDateEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure edtDTVENCExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeraContasReceber: TfrmGeraContasReceber;

implementation

{$R *.dfm}

procedure TfrmGeraContasReceber.btnFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmGeraContasReceber.edtDTVENCExit(Sender: TObject);
begin
     If (edtDTVENC.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(edtDTVENC.Text);
              edtDTVENC.Text := DatetoStr(edtDTVENC.Date);
              //
              If (edtDTVENC.Date < date()) Then
                begin
                    edtDTVENC.Date := Date();
                    edtDTVENC.SetFocus;
                    Exit;              
                End;
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inválida!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edtDTVENC.Clear;
                     edtDTVENC.SetFocus;
                End;
           end;
     End;
end;

end.
