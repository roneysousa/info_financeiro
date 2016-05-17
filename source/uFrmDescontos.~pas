unit uFrmDescontos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, CurrEdit;

type
  TfrmDescontos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BtGravar: TBitBtn;
    Label1: TLabel;
    edtDesconto1: TCurrencyEdit;
    Label14: TLabel;
    Label3: TLabel;
    edtDesconto2: TCurrencyEdit;
    Label4: TLabel;
    edtDesconto3: TCurrencyEdit;
    edtDesconto4: TCurrencyEdit;
    edtDesconto5: TCurrencyEdit;
    Label2: TLabel;
    edtDesconto6: TCurrencyEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtAcrescimo: TCurrencyEdit;
    edtAcrescimo2: TCurrencyEdit;
    Label8: TLabel;
    Label9: TLabel;
    Panel4: TPanel;
    edtTOTAL: TPanel;
    procedure FormShow(Sender: TObject);
    procedure edtDesconto1Exit(Sender: TObject);
    procedure edtDesconto2Exit(Sender: TObject);
    procedure edtDesconto3Exit(Sender: TObject);
    procedure edtDesconto4Exit(Sender: TObject);
    procedure edtDesconto5Exit(Sender: TObject);
    procedure edtDesconto6Exit(Sender: TObject);
    procedure edtAcrescimoExit(Sender: TObject);
    procedure edtAcrescimo2Exit(Sender: TObject);
  private
    { Private declarations }
    function Desconto1(): Double;
    function Desconto2(): Double;
    function Desconto3(): Double;
    function Desconto4(): Double;
    function Desconto5(): Double;
    function Desconto6(): Double;
    function Acrescimo1(): Double;
    function Acrescimo2(): Double;
  public
    { Public declarations }
  end;

var
  frmDescontos: TfrmDescontos;
  M_VALOR1, M_VALOR2, M_VALOR3, M_VALOR4, M_VALOR5, M_VALOR6, M_VALOR7 : Double;
  M_VLVEND, M_VLACR1, M_VLACR2 : Double;

implementation

uses uFuncoes;

{$R *.dfm}

function TfrmDescontos.Desconto1: Double;
begin
     M_VALOR2 := M_VALOR1 - uFuncoes.Gerapercentual(M_VALOR1, edtDesconto1.Value);
     M_VLVEND := M_VALOR2;
     edtTOTAL.Caption := FormatFloat('###,##0.#0',M_VALOR2);
end;

function TfrmDescontos.Desconto2: Double;
begin
     M_VALOR3 := M_VALOR2 - uFuncoes.Gerapercentual(M_VALOR2, edtDesconto2.Value);
     M_VLVEND := M_VALOR3;
     edtTOTAL.Caption := FormatFloat('###,##0.#0',M_VALOR3);
end;

procedure TfrmDescontos.FormShow(Sender: TObject);
begin
     M_VALOR2 := 0;
     M_VALOR3 := 0;
     M_VALOR4 := 0;
     M_VALOR5 := 0;
     M_VALOR6 := 0;
     //
     M_VLACR1 := 0;
     M_VLACR2 := 0;
     //
     M_VLVEND := M_VALOR1;
     edtTOTAL.Caption := FormatFloat('###,##0.#0',M_VALOR1);
end;

procedure TfrmDescontos.edtDesconto1Exit(Sender: TObject);
begin
     Desconto1;
end;

procedure TfrmDescontos.edtDesconto2Exit(Sender: TObject);
begin
     Desconto2;
end;

function TfrmDescontos.Desconto3: Double;
begin
     M_VALOR4 := M_VALOR3 - uFuncoes.Gerapercentual(M_VALOR3, edtDesconto3.Value);
     M_VLVEND := M_VALOR4;
     edtTOTAL.Caption := FormatFloat('###,##0.#0',M_VALOR4);
end;

procedure TfrmDescontos.edtDesconto3Exit(Sender: TObject);
begin
     Desconto3;
end;

function TfrmDescontos.Desconto4: Double;
begin
     M_VALOR5 := M_VALOR4 - uFuncoes.Gerapercentual(M_VALOR4, edtDesconto4.Value);
     M_VLVEND := M_VALOR5;
     edtTOTAL.Caption := FormatFloat('###,##0.#0',M_VALOR5);
end;

function TfrmDescontos.Desconto5: Double;
begin
     M_VALOR6 := M_VALOR5 - uFuncoes.Gerapercentual(M_VALOR5, edtDesconto5.Value);
     M_VLVEND := M_VALOR6;
     edtTOTAL.Caption := FormatFloat('###,##0.#0',M_VALOR6);
end;

function TfrmDescontos.Desconto6: Double;
begin
     M_VALOR7 := M_VALOR6 - uFuncoes.Gerapercentual(M_VALOR6, edtDesconto6.Value);
     M_VLVEND := M_VALOR7;
     edtTOTAL.Caption := FormatFloat('###,##0.#0',M_VALOR7);
end;

procedure TfrmDescontos.edtDesconto4Exit(Sender: TObject);
begin
     Desconto4;
end;

procedure TfrmDescontos.edtDesconto5Exit(Sender: TObject);
begin
     Desconto5;
end;

procedure TfrmDescontos.edtDesconto6Exit(Sender: TObject);
begin
     Desconto6;
end;

function TfrmDescontos.Acrescimo1: Double;
begin
     M_VLACR1 := M_VLVEND + uFuncoes.Gerapercentual(M_VLVEND, edtAcrescimo.Value);
     M_VLVEND := M_VLACR1;
     edtTOTAL.Caption := FormatFloat('###,##0.#0', M_VLACR1);
end;

function TfrmDescontos.Acrescimo2: Double;
begin
     M_VLACR2 := M_VLVEND + uFuncoes.Gerapercentual(M_VLACR1, edtAcrescimo2.Value);
     M_VLVEND := M_VLACR2;
     edtTOTAL.Caption := FormatFloat('###,##0.#0', M_VLACR2);
end;

procedure TfrmDescontos.edtAcrescimoExit(Sender: TObject);
begin
     Acrescimo1();
end;

procedure TfrmDescontos.edtAcrescimo2Exit(Sender: TObject);
begin
      Acrescimo2();
end;

end.
