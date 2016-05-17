unit uFrmRelPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons;

type
  TfrmRelPeriodo = class(TForm)
    Panel1: TPanel;
    edtDTINIC: TDateEdit;
    edtDTFINA: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    BtImprimir: TBitBtn;
    BtSair: TBitBtn;
    procedure BtSairClick(Sender: TObject);
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINAExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDTINICKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTFINAKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelPeriodo: TfrmRelPeriodo;

implementation

uses uFuncoes;

{$R *.dfm}

procedure TfrmRelPeriodo.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmRelPeriodo.edtDTINICExit(Sender: TObject);
begin
    If (edtDTINIC.Text <> '  /  /    ') Then
    begin
        try
              StrToDate(edtDTINIC.Text);
              edtDTINIC.Date := StrToDate(edtDTINIC.Text);
        except
              on EConvertError do
              begin
                  ShowMessage ('Data Inválida!');
                  edtDTINIC.SetFocus;
                  Exit;
              End;
        end;
    End;
end;

procedure TfrmRelPeriodo.edtDTFINAExit(Sender: TObject);
begin
    If (edtDTFINA.Text <> '  /  /    ') Then
    begin
        try
              StrToDate(edtDTFINA.Text);
              edtDTFINA.Date := StrToDate(edtDTFINA.Text);
              //
              If (edtDTFINA.Date < edtDTINIC.Date) Then
              begin
                   edtDTFINA.SetFocus;
                   Exit;
              End;
        except
              on EConvertError do
              begin
                  ShowMessage ('Data Inválida!');
                  edtDTFINA.SetFocus;
                  Exit;
              End;
        end;
    End;
end;

procedure TfrmRelPeriodo.FormShow(Sender: TObject);
begin
    edtDTINIC.Date := Date();
    edtDTFINA.Date := Date();
end;

procedure TfrmRelPeriodo.edtDTINICKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) and not uFuncoes.Empty(ufuncoes.RemoveChar(edtDTINIC.Text)) then
     begin
          key := #0;
          if (edtDTFINA.Enabled) Then
              edtDTFINA.SetFocus;
     End;
end;

procedure TfrmRelPeriodo.edtDTFINAKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) and not uFuncoes.Empty(ufuncoes.RemoveChar(edtDTFINA.Text)) then
     begin
          key := #0;
          if (BtImprimir.Enabled) Then
              BtImprimir.SetFocus;
     End;
end;

end.
