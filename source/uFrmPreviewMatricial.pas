unit uFrmPreviewMatricial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls;

type
  TfrmPreviewMatr = class(TForm)
    pnlSuperior: TPanel;
    pnlTexto: TPanel;
    spImprimir: TSpeedButton;
    spFechar: TSpeedButton;
    mmoArquivo: TMemo;
    OpenDialog1: TOpenDialog;
    procedure spFecharClick(Sender: TObject);
    procedure spImprimirClick(Sender: TObject);
  private
    Procedure PRINT_MEMO(Conteudo:TStrings);
    Function PrinterOnLine : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPreviewMatr: TfrmPreviewMatr;

implementation

uses Printers, uFuncoes, UFrmAdmin;

{$R *.dfm}

function TfrmPreviewMatr.PrinterOnLine: Boolean;
Const
      PrnStInt : Byte = $17;
      StRq : Byte = $02;
      PrnNum : Word = 0; { 0 para LPT1, 1 para LPT2, etc. }
Var
      nResult : byte;
Begin (* PrinterOnLine*)
    Asm
       mov ah,StRq;
       mov dx,PrnNum;
       Int $17;
       mov nResult,ah;
    end;
    PrinterOnLine := (nResult and $80) = $80;
end;

procedure TfrmPreviewMatr.PRINT_MEMO(Conteudo: TStrings);
Var
  MemoFile :TextFile;
  P :Integer;
  M_CAMINH : String;
Begin
   Try
     M_CAMINH := uFuncoes.PASTA_CUPOM(Strtoint(UFrmAdmin.M_CDUSUA));
     //M_CAMINH := 'C:\InfoG2\InfoPremio\Dados';
     If (fileexists(M_CAMINH+'\impressora.txt')) then
         M_CAMINH := uFuncoes.percorreArquivoTexto(M_CAMINH+'\impressora.txt');
     //
     {Relaciona a variável impressora com a}
     AssignFile(MemoFile, M_CAMINH);
     {abre a porta da impressão }
     Rewrite(MemoFile);
     For P := 0 to Conteudo.Count-1 do
          Writeln(MemoFile,Conteudo.Strings[P]);
   finally
       CloseFile(MemoFile);
   End;
end;

procedure TfrmPreviewMatr.spFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmPreviewMatr.spImprimirClick(Sender: TObject);
begin
     //If not PrinterOnLine then ShowMessage('Atenção! Verifique a Impressora...');
     PRINT_MEMO(mmoArquivo.Lines);
     //
     Close;
end;

end.
