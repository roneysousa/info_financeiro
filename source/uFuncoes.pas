unit uFuncoes;

interface

uses
Windows, Dialogs, Messages, SysUtils, Classes, Controls, Forms, raFunc,
StdCtrls, Mask,Db, DBTables,DBIProcs,TypInfo,WinProcs, ExtCtrls, UFrmAdmin, Registry,
ExtDlgs,Jpeg, DBXpress, SqlExpr, DBClient, Provider, FMTBcd,
uFrmBaixaContReceber,uFrmParcelas, uFiscal, uFormaPagamento, ComObj, uDmRelatorios,
CJVQRBarCode, Graphics, VDODmPrinter, RpBase, RpSystem, RpDefine, RpRave, RpCon,
RpConDS, RpFiler, untFrmPreview, math;

// Funcões e procedures para o sistema.

Function StrZero(Zeros:string;Quant:integer):String;
Procedure Limpar_Status;
function Empty(inString:String): Boolean;
Function Codifica( const Str1: string): String;
Function SysComputerName: string;
Function ContaCaracs(Edit:String): integer;
Function Replicate( Caracter:String; Quant:Integer ): String;
Function CPF(num: string): boolean;
Function CGC(num: string): boolean;
Function Alltrim(const Search: string): string;
Function Datafinal(dataini:tdatetime; dias_uteis:integer):tdatetime;
Function DataExtenso(Data:TDateTime): String;
Function MesExtenso (xMes : TDateTime) : string;
function MesExtenso2( Mes:Word ) : string;
function StrToPChar(const Str: string): PChar;
Function Arredondar(Valor: Double; Dec: Integer): Double;
Function tbReplChar(const Ch: Char; const Len: integer): string;
Function Padr(s:string;n:integer):string;
function Padl(s:string;n:integer):string;
Function Justifica(mCad:string;mMAx:integer):string;
function extenso (valor: real): string;
function Maiuscula(Texto:String): String;
Function DiadaSemana(Data : String) : string;
Function NumeroDiadaSemana(Data : String) : Integer;
Function OnLine(Porta:Word):Boolean;
Function EsvaziaTabela(Tabela : TTable): Boolean;
function RemoveChar(Const Texto:String):String;
function RemoveEnter(Const Texto:String):String;
function StrIsInteger(const S: string): boolean;
function Gerapercentual(valor:real;Percent:Real):real;
Procedure Grava_Imagem_JPEG(Tabela:TTable; Campo:TBlobField;
Foto:TImage; Dialog:TOpenPictureDialog);
Procedure Grava_Imagem_JPEG_CDS(Tabela:TClientDataSet; Campo:TBlobField;
Foto:TImage; Dialog:TOpenPictureDialog);
Procedure Le_Imagem_JPEG(Campo:TBlobField; Foto:TImage);
Function PrinterOnLine : Boolean;
function ArredontaFloat(x : Real): Real;
function LTrim(Texto:String):String;
function RemoveAcentos(Str:String): String;
function mvcodigo(campo,tabela:string):integer;
function mvpedidoitem(iPedido : integer; campo,tabela:string):integer;
function mscodigo(campo,tabela:string):string;
Function PadC(S:string;Len:byte):string;
function PasswordInputBox(const ACaption, APrompt:string): string;
function TESTA_CAIXA(W_CDCAIX : Integer; W_FLSITU : Char) : boolean;
Procedure NotaFiscal(Local : string; W_CDLOJA, W_NRVEND : Integer);
Procedure NotaFiscal_2Via(W_CDLOJA, W_NRVEND : Integer);
Procedure NotaFiscalNova(Local, W_HOVEND, W_JANVEN :string; W_CDLOJA, W_NRVEND, W_CDCLIE, M_CDCAIX : Integer; W_NMCLIE : String; M_TOVEND, M_VLDESC, W_VLACRE, M_VLTROC : Double);
Procedure Nota_Venda(Local, W_HOVEND, W_JANVEN :string; W_CDLOJA, W_NRVEND, W_CDCLIE, M_CDCAIX : Integer; W_NMCLIE : String;
        M_TOVEND, M_VLDESC, W_VLACRE, M_VLTROC : Double);
Procedure NotaRecebimento(Local : string; M_NRSEQU, M_NRRECE, M_CDLOJA : integer; M_FLPARC, M_FLVIA : String);
Procedure Nota_Recebimento(Local, W_NMMODA : string; M_NRSEQU, M_NRRECE, M_CDLOJA : integer; M_FLPARC, M_FLVIA : String);
function CDLOJA(M_NMLOJA : String) : integer;
function CDSECAO(M_NMSECAO : String) : integer;
function CDFABRICANTE(M_NMFABRICANTE : String) : integer;
function CDSUBSECAO(M_CDSECAO : INTEGER; M_SUBSECAO : String) : integer;
function LOCALIZAR_BANCO(M_CDBANC : String) : Boolean;
function FormataCNPJ(CNPJ: string): string;
function FormataCPF(CPF: string): string;
function PROCURAR(M_CDPROD : String) : boolean;
function PRODUTO_ESTOQUE(M_CDPROD  : String; M_CDLOJA : Integer) : boolean;
function CALCULA_PRECOVENDA(W_VLCOMP, W_PERIPI, W_PEFRET, W_ICMSCO, W_PETAXA, W_LULIQU, W_ICMSAN : Real;
  W_CDTRIB : Integer) : Real;
function CALCULA_LUCROLIQUIDO(W_VLCOMP, W_PERIPI, W_PEFRET, W_ICMSCO, W_PETAXA, W_LUBRUTO, W_LULIQU : Real;
  W_CDTRIB : Integer) : Real;
function CALCULA_LUCROBRUTO(W_VLCOMP, W_PERIPI, W_PEFRET, W_ICMSCO, W_PETAXA, W_LUBRUTO, W_LULIQUIDO : Real;
  W_CDTRIB : Integer) : Real;
function VALOR_VENDA(W_VLCOMP, W_PERIPI, W_PEFRET, W_ICMSCO, W_PETAXA, W_LUBRUTO, W_LULIQU : Real;
  W_CDTRIB : Integer) : Real;
function percorreArquivoTexto ( nomeDoArquivo: String ) : String;
function PASTA_CUPOM(M_CDUSUA : Integer) : String;
function NOME_CLIENTE(M_CDCLIE : Integer) : String;
function RAZAO_CLIENTE(M_CDCLIE : Integer) : String;
function Verificar_Razao(aNome : String) : Boolean;
function CNPJ_CLIENTE(M_CDCLIE : Integer) : String;
function SALDO_DEVEDOR_CLIENTE(M_CDCLIE : Integer) : Double;
Function NOME_PRODUTO(M_CDPROD : String) : String;
Function IPI_PRODUTO(M_CDPROD : String) : Double;
Function VALOR_PRODUTO(M_CDPROD : String) : Double;
Function NOME_FORNECEDOR(M_CDPROD : String) : String;
Function NOME_SECAO(M_CDPROD : String) : String;
Function NOME_CAIXA(M_CDCAIX : Integer) : String;
Function GetFormaPagamento(M_FMPAGA : Integer) : String;
Function GetCondicaoPagamento(M_CDPAGA : Integer) : String;
Function GetModaPedido(M_NRPEDI : Integer) : INTEGER;
Function NomeMaquina : String;
Function VENDA(M_TOTVEN, M_VLDESC, M_VLACRE : Double ; M_CDLOJA, M_CDCAIX, M_IMPRES, M_CDCLIE, M_CDTABE, M_CDVEND : Integer;
M_DTVEND : TDate; M_NMCLIE, M_HOVEND, M_JANVEN, aTipoFrete : String;  fPercFrete : Double; iTransportadora, iPlano, iModalidade : Integer;
txtObservacao, txtObs2, txtObs3, iMesa, aFLTAXA : String; fValorTaxa : Double) : Boolean;
Procedure CRIAR_PARCELAS(M_QTPARC : Integer);
function IMPRESSORA(W_CDCAIX : integer): Integer;
function BUSCA_ALIQUOTA(W_CDPROD : String ) : String;
Procedure MODALIDADES;
Procedure GERAR_ARQUIVO_EMAIL(M_NRVEND, M_CDLOJA : Integer);
Procedure GERAR_ARQUIVO_WORD(M_NRVEND, M_CDLOJA : Integer);
Function FormataFONE(sFONE: string): string;
Procedure VIA_PEDIDO(M_NRPEDI, M_FMPAGA : Integer; M_FLSEGV, M_NMFORN : String);
Procedure VIA_ORCAMENTO(M_NRORCA, M_FMPAGA : Integer; M_FLSEGV, M_NMFORN, M_NMFORM : String);
Procedure CARREGAR_ITENS(M_NRPEDI : Integer);
Procedure CARREGAR_ITENS_ORCAMENTO(M_NRORCA : Integer);
Procedure TOTAIS;
Function GetTabela(M_NMTABE: string): Integer;
Function GetNomeTabela( M_CDTABE : Integer) : string;
Function ORCAMENTO(M_TOTVEN, M_VLDESC : Double ; M_CDLOJA, M_CDCAIX, M_IMPRES, M_CDCLIE, M_CDTABE, W_CDMODA : Integer;
M_DTVEND : TDate; M_NMCLIE, M_HOVEND, M_JANVEN, M_ENDCLI, M_BAICLI, M_CIDCLI, M_NUMCLI : String) : Boolean;
function GetCor(M_CODCOR : integer) : String;
function GetTipoCliente(M_NMTIPO : String) : integer;
function GetRegiao(M_NMREGI : String) : integer;
function GetCidade(M_CDCIDA : integer) : String;
function GetBairro(M_CDCIDA, M_CDBAIR : integer) : String;
function GetNomePlano(iCodigo : integer) : String;
procedure Seleciona_Cliente(M_CDCLIE : Integer);
Function getFornecedor(M_NRPEDI : Integer) : String;
Function getFornecedorOrcamento(M_NRORCA : Integer) : String;
Function getIPIProduto(M_CDPROD : String) : Double;
Function getRodape(M_NMARQU : String): String;
Function getModalidade(M_NMMODA : String) : Integer;
function setCod_Barras(objCode : TCJVQRBarCode; M_CDBARR : String) : String;
function IDTransation : String;
function RetZero(ZEROS:string;QUANT:integer):String;
procedure GeraBarrasEAN13(CodBarras: string; Imagem: TCanvas);
procedure DesenhaBarras(SequenciaHexa: string; Imagem: TCanvas);
function SetAvista(aValor, aTotal : Double) : Double;
function SetValorDesc(aVenda : integer; aDesconto: Double) : Double;
function SetValorAcre(aVenda : integer; aAcrescimo : Double) : Double;
function GetQuantItemVenda(aVenda : integer) : integer;
procedure Loja_Combo(aCombo : TComboBox);
function FormataCep(M_NUNCEP : string) : String;
function RetirarCarecterAtalho(const texto : string) : string;
function retornaProximoCodigoMenu : integer;
function retornarCodMenu(const textoMenu : String) : Integer;
function FormataData(sData : string) : String;
Function CalcularFrete(fValor, fPercentual : Double) : Double;
Function GetCodForn(iCodProduto : String) : integer;
Function GetCodPlano(aNomePlano : String) : integer;
Function GetReferencia(aDesc : String) : Boolean;
Function GetEmailFornecedor(iCodigo : Integer) : String;
Function GetIpiFornecedor(iCodigo : Integer) : Double;
Function GetVerificaCNPJ(aCNPJ : String) : Boolean;
Function ExcluirPedido(iPedido : Integer) : Boolean;
function Criptografia(mStr, mChave: string): string;
Function GetCliente(iCodigo : Integer; aRazao, aCGC : String) : Boolean;
Function GetValidarBairro(iCodigo, iCdCidade : Integer; aNome : String) : Boolean;
Function GetValidarCidade(iCdCidade : Integer; aNome, aUF : String) : Boolean;
Function GetValidarFornecedor(iCodigo : Integer; aRazao : String) : Boolean;
Function GetValidarPlanoPagamento(iCodigo : Integer; aDescricao : String) : Boolean;
Function GetValidarProduto(iCodigo, aDescricao : String) : Boolean;
Function GetValidarProdutoPedido(iPedido : Integer; aProduto : String) : Boolean;
Function GetValidarPedido(iPedido, iCliente : Integer) : Boolean;
Procedure CupomPedido(iPedido, iQuantidade : Integer; fTaxa : Double; aCDS : TClientDataSet; aTipo : String);
Procedure CupomPedido2Via(iPedido : Integer);
Function StrIsFloat(const S: string): boolean;
Function GetAtendenteVenda(iVenda : integer) : Integer;
Function CupomFechamentoCaixa(iNumCaixa, iLoja, iCaixa : Integer) : Boolean;
Function CaixaRGInicial(iNumCaixa : Integer) : Integer;
Function CaixaRGFinal(iNumCaixa : Integer) : Integer;
Function GetValorInicialCaixa(iSequencia, iCaixa : Integer) : Double;
Function GetValorDigitadoFechamentoCaixa(iNumCaixa, iModalidade : Integer) : Double;
Function GetTotalVendidoCaixa(iCaixa, iRegInicial, iRegFinal : Integer) : Double;
function Potencia(Base, Expoente : Extended) : Extended;
function Data_Juliana (Data_Atual: TDateTime): String;
Function CopiarArquivo(aOrigem, aDestino : String) : boolean;
procedure AddLog(aMensagem : String);
function LimpaString(ATexto: String):String;
Function ProximoDiaUtil (dData : TDateTime) : TDateTime;


const
    MSG_OK   = 'Registro gravado com sucesso.';
    MSG_ERRO = 'Erro ao tentar gravar registro.';
    MSG_PERGUTA = 'Deseja excluir este registro?';
    MSG_PERMISSOES = 'Você não tem pemissão para isto';
    MSG_ERROR = 'Ocorreu um erro!';
    chave = 'email';

implementation

uses Udm, udmConsulta, uDm2, ppReport, udmDados;

Var
   W_TOTAPC : integer;
   M_VLFRET : Double;

function FormataCNPJ(CNPJ: string): string;
begin
  Result :=Copy(CNPJ,1,2)+'.'+Copy(CNPJ,3,3)+'.'+Copy(CNPJ,6,3)+'/'+
    Copy(CNPJ,9,4)+'-'+Copy(CNPJ,13,2);
end;

function FormataCPF(CPF: string): string;
Begin              // 494.539.553-53
     result := Copy(CPF,1,3)+'.'+
               Copy(CPF,4,3)+'.'+
               Copy(CPF,7,3)+'-'+
               Copy(CPF,10,2);
End;

function FormataFONE(sFONE: string): string;
Begin
     // 99 9999 9999
     result := '('+Copy(sFONE,1,2)+')' +Copy(sFONE,3,4)+'-' +Copy(sFONE,7,4);
End;

function MesExtenso2( Mes:Word ) : string; const meses : array[0..11] of
PChar = ('JANEIRO', 'FEVEREIRO', 'MARÇO', 'ABRIL', 'MAIO', 'JUNHO', 'JULHO', 'AGOSTO', 'SETEMBRO','OUTUBRO', 'NOVEMBRO', 'DEZEMBRO');
begin
    result := meses[mes-1];
End;

function mscodigo(campo, tabela: string): string;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select min('+campo+') from '+tabela;
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      open;
      result := fields[0].AsString;
    finally
      free;
    end;

end;

function mvcodigo(campo, tabela: string): integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select min('+campo+') from '+tabela;
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      open;
      result := fields[0].AsInteger;
    finally
      free;
    end;
end;

function FormataCep(M_NUNCEP : string) : String;
Begin
     Result := Copy(M_NUNCEP,1,5)+'-'+Copy(M_NUNCEP,6,3);
End;

function RemoveAcentos(Str:String): String;
{Remove caracteres acentuados de uma string}
Const ComAcento = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ';
  SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
Var
x : Integer;
Begin
For x := 1 to Length(Str) do
  Begin
  if Pos(Str[x],ComAcento)<>0 Then
  begin
  Str[x] := SemAcento[Pos(Str[x],ComAcento)];
  end;
  end;
Result := Str;
end;

function Padl(s:string;n:integer):string; // Alinhamento pela esquerda
{alinha uma string à esquerda}
begin
  Result:=Format('%-'+IntToStr(n)+'.'+IntToStr(n)+'s',[s]);
end;

function LTrim(Texto:String):String;
{Remove os Espaços em branco à direita da string}
var
  I : Integer;
begin
  I := 0;
  while True do
  begin
  inc(I);
  if I > length(Texto) then
  break;
  if Texto[I] <> #32 then
  break;
  end;
  Result := Copy(Texto,I,length(Texto));
end;

function ArredontaFloat(x : Real): Real;
{Arredonda um número float para convertê-lo em String}
Begin
  if x > 0 Then
  begin
  if Frac(x) > 0.5 Then
  begin
  x := x + 1 - Frac(x);
  end
  else
  begin
  x := x - Frac(x);
  end;
  end
  else
  begin
  x := x - Frac(x);
  end;
  result := x
end;

function RemoveChar(Const Texto:String):String;
//
// Remove caracteres de uma string deixando apenas numeros
//
var
I: integer;
S: string;
begin
S := '';
for I := 1 To Length(Texto) Do
   begin
   if (Texto[I] in ['0'..'9']) then
       begin
       S := S + Copy(Texto, I, 1);
       end;
   end;
result := S;
end;

function RemoveEnter(Const Texto:String):String;
//
// Remove caracteres de uma string deixando apenas numeros
//
var
I: integer;
S: string;
begin
S := '';
for I := 1 To Length(Texto) Do
   begin
   if (Texto[I] <> Chr(13)) then
       begin
       S := S + Copy(Texto, I, 1);
       end;
   end;
result := S;
end;

function StrIsInteger(const S: string): boolean;
// Verificar se uma string contém um valor inteiro válido
begin
  try
  StrToInt(S);
  Result := true;
  except
  Result := false;
  end;
end;

function Gerapercentual(valor:real;Percent:Real):real;
// Retorna a porcentagem de um valor
begin
percent := percent / 100;
try
  valor := valor * Percent;
finally
  result := valor;
end;
end;

Procedure Grava_Imagem_JPEG(Tabela:TTable; Campo:TBlobField;
Foto:TImage; Dialog:TOpenPictureDialog);
var
    BS:TBlobStream;
    MinhaImagem:TJPEGImage;
Begin
     Dialog.InitialDir := 'c:\temp';
     Dialog.Execute;
     if Dialog.FileName <> '' Then
     Begin
          if not (Tabela.State in [dsEdit, dsInsert]) Then
              Tabela.Edit;
          BS := TBlobStream.Create((Campo as TBlobField), BMWRITE);
          MinhaImagem := TJPEGImage.Create;
          MinhaImagem.LoadFromFile(Dialog.FileName);
          MinhaImagem.SaveToStream(BS);
          Foto.Picture.Assign(MinhaImagem);
          BS.Free;
          MinhaImagem.Free;
          Tabela.Post;
          DBISaveChanges(Tabela.Handle);
     End;
End;

Procedure Grava_Imagem_JPEG_CDS(Tabela:TClientDataSet; Campo:TBlobField;
Foto:TImage; Dialog:TOpenPictureDialog);
var
    BS:TBlobStream;
    MinhaImagem:TJPEGImage;
Begin
     Dialog.InitialDir := 'c:\temp';
     Dialog.Execute;
     if Dialog.FileName <> '' Then
     Begin
          if not (Tabela.State in [dsEdit, dsInsert]) Then
              Tabela.Edit;
          BS := TBlobStream.Create((Campo as TBlobField), BMWRITE);
          MinhaImagem := TJPEGImage.Create;
          MinhaImagem.LoadFromFile(Dialog.FileName);
          MinhaImagem.SaveToStream(BS);
          Foto.Picture.Assign(MinhaImagem);
          BS.Free;
          MinhaImagem.Free;
          Tabela.Post;
          //DBISaveChanges(Tabela.Handle);
     End;
End;

Procedure Le_Imagem_JPEG(Campo:TBlobField; Foto:TImage);
var BS:TBlobStream;
    MinhaImagem:TJPEGImage;
Begin
    if Campo.AsString <> '' Then
    Begin
        BS := TBlobStream.Create((Campo as TBlobField), BMREAD);
        MinhaImagem := TJPEGImage.Create;
        MinhaImagem.LoadFromStream(BS);
        Foto.Picture.Assign(MinhaImagem);
        BS.Free;
        MinhaImagem.Free;
    End;
//Else Foto.Picture.LoadFromFile('c:\temp\limpa.jpg');
End;

function StrZero(Zeros:string;Quant:integer):String;
{Insere Zeros à frente de uma string}
var
I,Tamanho:integer;
aux: string;
begin
  aux := zeros;
  Tamanho := length(ZEROS);
  ZEROS:='';
  for I:=1 to quant-tamanho do
  ZEROS:=ZEROS + '0';
  aux := zeros + aux;
  StrZero := aux;
end;

Function Padr(s: string; n: integer): string;
{alinha uma string à direita}
begin
       Result:=Format('%'+IntToStr(n)+'.'+IntToStr(n)+'s',[s]);
end;


Function tbReplChar(const Ch: Char; const Len: integer): string;
var
  I: integer;
begin
  SetLength(Result, Len);
  for I := 1 to Len do
  Result[I] := Ch;
end;


Procedure Limpar_Status;
begin
     FrmAdmin.StatusBar1.Panels[2].Text := ' ';
     FrmAdmin.StatusBar1.Panels[1].Text := '';
end;

function Empty(inString:String): Boolean;
{Testa se a variavel está vazia ou não}
Var
  index : Byte;
Begin
  index := 1;
  Empty := True;
  while (index <= Length(inString))and (index <> 0) do
  begin
  if inString[index] = ' ' Then
  begin
inc(index)
  end
  else
Begin
  Empty := False;
  index := 0
end;
  end;
end;

Function Codifica( const Str1: string): String;
{Encripta uma string}
var
Mascara,Str2: String;
PonM, PonS: Byte;
begin
Mascara := '#$%$'#13#12;
Str2 := '';
PonM := 1;
for PonS:=1 to length(Str1) do
  begin
  AppendStr( Str2, Chr( Ord(Str1[PonS]) Xor Ord(Mascara[PonM])));
  Inc( PonM);
  if PonM>Length(Mascara) then
  begin
  PonM:=1;
  end;
  Result := Str2;
  end;
end;

{ Sys }
function SysComputerName: string;
var
  I: DWord;
begin
  I := MAX_COMPUTERNAME_LENGTH + 1;
  SetLength(Result, I);
  Windows.GetComputerName(PChar(Result), I);
  Result := string(PChar(Result));
end;

Function ContaCaracs(Edit: String): integer;
{Retorna quantos caracteres tem um Edit especificado}
begin
     Result := Length(Edit);
end;

function Replicate(Caracter: String; Quant: Integer): String;
{Repete o mesmo caractere várias vezes}
var I : Integer;
begin
Result := '';
  for I := 1 to Quant do
  Result := Result + Caracter;
end;

Function CPF(num: string): boolean;
var
n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
d1,d2: integer;
digitado, calculado: string;
begin
n1:=StrToInt(num[1]);
n2:=StrToInt(num[2]);
n3:=StrToInt(num[3]);
n4:=StrToInt(num[4]);
n5:=StrToInt(num[5]);
n6:=StrToInt(num[6]);
n7:=StrToInt(num[7]);
n8:=StrToInt(num[8]);
n9:=StrToInt(num[9]);
d1:=n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
d1:=11-(d1 mod 11);
if d1>=10 then d1:=0;
d2:=d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
d2:=11-(d2 mod 11);
if d2>=10 then d2:=0;
calculado:=inttostr(d1)+inttostr(d2);
digitado:=num[10]+num[11];
if calculado=digitado then
  cpf:=true
  else
  cpf:=false;
end;

function cgc(num: string): boolean;
var
n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12: integer;
d1,d2: integer;
digitado, calculado: string;
begin
n1:=StrToInt(num[1]);
n2:=StrToInt(num[2]);
n3:=StrToInt(num[3]);
n4:=StrToInt(num[4]);
n5:=StrToInt(num[5]);
n6:=StrToInt(num[6]);
n7:=StrToInt(num[7]);
n8:=StrToInt(num[8]);
n9:=StrToInt(num[9]);
n10:=StrToInt(num[10]);
n11:=StrToInt(num[11]);
n12:=StrToInt(num[12]);
d1:=n12*2+n11*3+n10*4+n9*5+n8*6+n7*7+n6*8+n5*9+n4*2+n3*3+n2*4+n1*5;
d1:=11-(d1 mod 11);
if d1>=10 then d1:=0;
d2:=d1*2+n12*3+n11*4+n10*5+n9*6+n8*7+n7*8+n6*9+n5*2+n4*3+n3*4+n2*5+n1*6;
d2:=11-(d2 mod 11);
if d2>=10 then d2:=0;
calculado:=inttostr(d1)+inttostr(d2);
digitado:=num[13]+num[14];
if calculado=digitado then
  cgc:=true
  else
  cgc:=false;
end;

Function Alltrim(const Search: string): string;
{Remove os espaços em branco de ambos os lados da string}
const
BlackSpace = [#33..#126];
var
Index: byte;
begin
Index:=1;
while (Index <= Length(Search)) and not (Search[Index] in BlackSpace) do
  begin
  Index:=Index + 1;
  end;
Result:=Copy(Search, Index, 255);
Index := Length(Result);
while (Index > 0) and not (Result[Index] in BlackSpace) do
  begin
  Index:=Index - 1;
  end;
Result := Copy(Result, 1, Index);
End;

Function Datafinal(dataini:tdatetime; dias_uteis:integer):tdatetime;
//
// Retorna uma data acresçida de mais um certo número de dias
//
var dw:integer;
Begin
  dw := DayOfWeek(dataini)-1;
  result := dataini+dias_uteis+((dias_uteis-1+dw) div 7)*2;
End;

function DataExtenso(Data:TDateTime): String;
{Retorna uma data por extenso}
var
  NoDia : Integer;
  DiaDaSemana : array [1..7] of String;
  Meses : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
{ Dias da Semana }
  DiaDasemana [1]:= 'domingo';
  DiaDasemana [2]:= 'segunda-feira';
  DiaDasemana [3]:= 'terça-feira';
  DiaDasemana [4]:= 'quarta-feira';
  DiaDasemana [5]:= 'quinta-feira';
  DiaDasemana [6]:= 'sexta-feira';
  DiaDasemana [7]:= 'sábado';
{ Meses do ano }
  Meses [1] := 'janeiro';
  Meses [2] := 'fevereiro';
  Meses [3] := 'março';
  Meses [4] := 'abril';
  Meses [5] := 'maio';
  Meses [6] := 'junho';
  Meses [7] := 'julho';
  Meses [8] := 'agosto';
  Meses [9] := 'setembro';
  Meses [10]:= 'outubro';
  Meses [11]:= 'novembro';
  Meses [12]:= 'dezembro';
  DecodeDate (Data, Ano, Mes, Dia);
  NoDia := DayOfWeek (Data);
  Result :=  IntToStr(Dia) +' de ' + Meses[Mes]+ ' de ' + IntToStr(Ano)+'.';
  //DiaDaSemana[NoDia] + ', '
end;

Function MesExtenso (xMes : TDateTime) : string;
Var
Dia, Mes, Ano : Word;
begin
Mes := 0;
DecodeDate (xMes, Ano, Mes, Dia);
{Try
Mes := Round (xMes);
Except
End;}
case Mes of
1: Result := 'janeiro';
2: Result := 'fevereiro';
3: Result := 'março';
4: Result := 'abril';
5: Result := 'maio';
6: Result := 'junho';
7: Result := 'julho';
8: Result := 'agosto';
9: Result := 'setembro';
10: Result := 'outubro';
11: Result := 'novembro';
12: Result := 'dezembro';
else
Result := '';
end;
end;

function StrToPChar(const Str: string): PChar;
{Converte String em Pchar}
type
  TRingIndex = 0..7;
var
  Ring: array[TRingIndex] of PChar;
  RingIndex: TRingIndex;
  Ptr: PChar;
begin
  Ptr := @Str[Length(Str)];
  Inc(Ptr);
  if Ptr^ = #0 then
  begin
  Result := @Str[1];
  end
  else
  begin
  Result := StrAlloc(Length(Str)+1);
  RingIndex := (RingIndex + 1) mod (High(TRingIndex) + 1);
  StrPCopy(Result,Str);
  StrDispose(Ring[RingIndex]);
  Ring[RingIndex]:= Result;
  end;
end;

Function Arredondar(Valor: Double; Dec: Integer): Double;
var
  Valor1,
  Numero1,
  Numero2,
  Numero3: Double;
begin
  Valor1:=Exp(Ln(10) * (Dec + 1));
  Numero1:=Int(Valor * Valor1);
  Numero2:=(Numero1 / 10);
  Numero3:=Round(Numero2);
  Result:=(Numero3 / (Exp(Ln(10) * Dec)));
end;

Function Justifica(mCad:string;mMAx:integer):string;
var
mPos,mPont,mTam,mNr,mCont:integer;
mStr:string;
begin
mTam:=Length(mCad);
if mTam>=mMax then
Result:=copy(mCad,1,mMax)
else
mStr:='';
mCont:=0;
mPont:=1;
mNr:=mMax-mTam;
while mCont<mNr do
begin
mPos:=pos(mStr,copy(mCad,mPont,100));
if mPos=0 then
begin
mStr:=mStr+' ';
mPont:=1;
continue;
end
else
begin
mCont:=mCont+1;
Insert(' ',mCad,mPos+mPont);
mPont:=mPont+mPos+length(mStr);
end;
Result:=mCad;
end;
end;

function extenso (valor: real): string;
var
Centavos, Centena, Milhar, Milhao, Texto, msg: string;
const
Unidades: array[1..9] of string = ('Um', 'Dois', 'Tres', 'Quatro', 'Cinco', 'Seis', 'Sete', 'Oito', 'Nove');
Dez: array[1..9] of string = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze', 'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
Dezenas: array[1..9] of string = ('Dez', 'Vinte', 'Trinta', 'Quarenta', 'Cinquenta', 'Sessenta', 'Setenta', 'Oitenta', 'Noventa');
Centenas: array[1..9] of string = ('Cento', 'Duzentos', 'Trezentos', 'Quatrocentos', 'Quinhentos', 'Seiscentos', 'Setecentos', 'Oitocentos', 'Novecentos');
function ifs(Expressao: Boolean; CasoVerdadeiro, CasoFalso: String): String;
begin
if Expressao
then Result:=CasoVerdadeiro
else Result:=CasoFalso;
end;



function MiniExtenso (trio: string): string;
var
Unidade, Dezena, Centena: string;
begin
Unidade:='';
Dezena:='';
Centena:='';
if (trio[2]='1') and (trio[3]<>'0') then
  begin
  Unidade:=Dez[strtoint(trio[3])];
  Dezena:='';
end
else
 begin
  if trio[2]<>'0' then Dezena:=Dezenas[strtoint(trio[2])];
  if trio[3]<>'0' then Unidade:=Unidades[strtoint(trio[3])];
 end;
if (trio[1]='1') and (Unidade='') and (Dezena='')
 then Centena:='cem'
else
 if trio[1]<>'0'
  then Centena:=Centenas[strtoint(trio[1])]
  else Centena:='';
 Result:= Centena + ifs((Centena<>'') and ((Dezena<>'') or (Unidade<>'')), ' e ', '')
  + Dezena + ifs((Dezena<>'') and (Unidade<>''),' e ', '') + Unidade;
end;
begin
if (valor>999999.99) or (valor<0) then
 begin
  msg:='O valor está fora do intervalo permitido.';
  msg:=msg+'O número deve ser maior ou igual a zero e menor que 999.999,99.';
  msg:=msg+' Se não for corrigido o número não será escrito por extenso.';
  showmessage(msg);
  Result:='';
  exit;
 end;
if valor=0 then
 begin
  Result:='';
  Exit;
 end;
Texto:=formatfloat('000000.00',valor);
Milhar:=MiniExtenso(Copy(Texto,1,3));
Centena:=MiniExtenso(Copy(Texto,4,3));
Centavos:=MiniExtenso('0'+Copy(Texto,8,2));
Result:=Milhar;
if Milhar<>'' then
  if copy(texto,4,3)='000' then
  Result:=Result+' Mil Reais'
  else
  Result:=Result+' Mil, ';
if (((copy(texto,4,2)='00') and (Milhar<>'')
  and (copy(texto,6,1)<>'0')) or (centavos=''))
  and (Centena<>'') then Result:=Result+' e ';
if (Milhar+Centena <>'') then Result:=Result+Centena;
if (Milhar='') and (copy(texto,4,3)='001') then
  Result:=Result+' Real'
 else
  if (copy(texto,4,3)<>'000') then Result:=Result+' Reais';
if Centavos='' then
 begin
  Result:=Result+'.';
  Exit;
 end
else
 begin
  if Milhar+Centena='' then
  Result:=Centavos
  else
  Result:=Result+', e '+Centavos;
if (copy(texto,8,2)='01') and (Centavos<>'') then
  Result:=Result+' Centavo'
 else
  Result:=Result+' Centavos';
end;
end;

function Maiuscula(Texto:String): String;
{Converte a primeira letra do texto especificado para
maiuscula e as restantes para minuscula}
var
OldStart: Integer;
begin
if Texto <> '' then
  begin
  Texto := UpperCase(Copy(Texto,1,1))+LowerCase(Copy(Texto,2,Length(Texto)));
  Result := Texto;
  end;
end;

Function DiadaSemana(Data : String) : string;
const
  semana : array[1..7] of string = ('Domingo','Segunda-feira','Terça-feira','Quarta-feira','Quinta-feira','Sexta-feira', 'Sabado');
begin
  Result := semana[DayOfWeek(strtodate(Data))]
end;

Function NumeroDiadaSemana(Data : String) : Integer;
const
  semana : array[1..7] of integer = (1,2,3,4,5,6,7);
begin
  Result := semana[DayOfWeek(strtodate(Data))]
end;

Function OnLine(Porta:Word):Boolean;
// Verificar se Impressora esta Conectada
Const
Portas :Byte = $02;
Var
Res :Byte;
Begin
{ Código em Assembler }
Asm
mov ah,Portas; {Requisita o acesso as portas}
mov dx,Porta;{Define a porta de teste}
Int $17; {Chama a interrupção de Impressora}
mov Res,ah; {Guarda em Res o resultado da operação }
end;
Result := (Res and $80) = $80; {Testa o valor de saída}
End;

function EsvaziaTabela(Tabela : TTable): Boolean;
// Esvazia a tabela passada como parametro
var
lExclusivo : boolean;
begin
Tabela.Active := False;
repeat
try
  Tabela.Exclusive := True;
  Tabela.Active := True;
  Tabela.EmptyTable;
  lExclusivo := True;
  Break;
except
  on EDatabaseError do
  if MessageDlg('A tabela está sendo usada por outro usuário. Tenta novamente ?', mtError,[mbOK, mbCancel], 0) <> mrOK then
  begin
  lExclusivo := False;
  raise;
  end;
  end;
until False;
Result := lExclusivo;
end;

Function PrinterOnLine : Boolean;
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
End;

Function PadC(S:string;Len:byte):string;
// Centraliza uma string em um espaço determinado
var
 Str:String;
 L:byte;
begin
str :='';
if len < Length(s) then
  begin
  Result := '';
  Exit;
  end;
l:=(Len-Length(S)) div 2;
while l > 0 do
  begin
  str:=str+' ';
  dec(l);
  end;
for l:=1 to length(S) do
  begin
  str := str+s[L];
  end;
 Result := str;
end;

function PasswordInputBox(const ACaption, APrompt:string): string;
var
  Form: TForm;
  Prompt: TLabel;
  Edit: TEdit;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
  Value: string;
  I: Integer;
  Buffer: array[0..51] of Char;
begin
  Result := '';
  Form := TForm.Create(Application);
  with Form do
  try
    Canvas.Font := Font;
    for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
    for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
    GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(DialogUnits));
    DialogUnits.X := DialogUnits.X div 52;
    BorderStyle := bsDialog;
    Caption := ACaption;
    ClientWidth := MulDiv(180, DialogUnits.X, 4);
    ClientHeight := MulDiv(63, DialogUnits.Y, 8);
    Position := poScreenCenter;
    Prompt := TLabel.Create(Form);
    with Prompt do
    begin
      Parent := Form;
      AutoSize := True;
      Left := MulDiv(8, DialogUnits.X, 4);
      Top := MulDiv(8, DialogUnits.Y, 8);
      Caption := APrompt;
    end;
    Edit := TEdit.Create(Form);
    with Edit do
    begin
      Parent := Form;
      Left := Prompt.Left;
      Top := MulDiv(19, DialogUnits.Y, 8);
      Width := MulDiv(164, DialogUnits.X, 4);
      MaxLength := 255;
      PasswordChar := '*';
      SelectAll;
    end;
    ButtonTop := MulDiv(41, DialogUnits.Y, 8);
    ButtonWidth := MulDiv(50, DialogUnits.X, 4);
    ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
    with TButton.Create(Form) do
    begin
      Parent := Form;
      Caption := 'OK';
      ModalResult := mrOk;
      Default := True;
      SetBounds(MulDiv(38, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
    end;
    with TButton.Create(Form) do
    begin
      Parent := Form;
      Caption := 'Cancel';
      ModalResult := mrCancel;
      Cancel := True;
      SetBounds(MulDiv(92, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
    end;
    if ShowModal = mrOk then
    begin
      Value := Edit.Text;
      Result := Value;
    end;
  finally
    Form.Free;
    Form:=nil;  
  end;
end;

function TESTA_CAIXA(W_CDCAIX : Integer; W_FLSITU : Char) : boolean;
Begin
      With dmConsultas.cdsCaixa2 do
      Begin
           Close;
           Params.ParamByName('pCAIXA').AsInteger   := W_CDCAIX;
           Params.ParamByName('pSITUACAO').AsString := W_FLSITU;
           //
           Open;
      End;
      //
      If (dmConsultas.cdsCaixa2.IsEmpty) Then
          result := False
      Else
          result := True;
End;

Procedure NotaFiscal_2Via(W_CDLOJA, W_NRVEND : Integer);
Var
    // Variável da classe TVDODmPrinter que fará o relatório
    VDOImpressora : TVDODmPrinter;
    Linha : string;
    LinCab1, LinCab2, M_ESPACO : String;
    M_NUMMES, M_QTCARA : Integer;
    LINHA1, VALOR, M_POSINI : integer;
    //
    Data, W_CDITEN, W_NMDESC, W_MNMODA, W_FLCANC : String;
    W_UNITEN : String;
    W_VLMODA, W_VLUNIT, W_VLSUBT, W_TOVEND, W_VLDESC, W_VLACRE, W_VLVEND, M_VLTROC, W_QTITEN : Real;
    //
    M_CDCLIE, M_CAMINH, M_NMCLIE, M_NMVEND, M_FLSITU, M_NMFILE : String;
    M_CDCAIX, M_FLIMPR, M_NRITEM : Integer;
begin
     //
     M_CAMINH := uFuncoes.PASTA_CUPOM(StrtoInt(UFrmAdmin.M_CDUSUA));
     //
  M_CDCLIE := StrZero(dmConsultas.cdsVendas.FieldByName('MOV_CLIENTE').AsString,7);
  M_NMCLIE := dmConsultas.cdsVendas.FieldByName('MOV_NOMECLIENTE').AsString;
  W_VLDESC := dmConsultas.cdsVendas.FieldByName('MOV_DESCONTO').AsCurrency;
  W_VLACRE := dmConsultas.cdsVendas.FieldByName('MOV_ACRESCIMO').AsCurrency;
  M_FLSITU := dmConsultas.cdsVendas.FieldByName('MOV_SITUACAO').AsString;
  // Caixa
  With dmConsultas.qryMovCaixa do
  Begin
       Close;
       Params.ParamByName('pLOJA').AsInteger  := W_CDLOJA;
       Params.ParamByName('pVENDA').AsInteger := W_NRVEND;
       Open;
  End;
  //
  M_CDCAIX := dmConsultas.qryMovCaixa.FieldByName('MCA_CAIXA').AsInteger;
  // Vendedor
  With dmConsultas.qryVendedor do
  Begin
       Close;
       Params.ParamByName('pCODIGO').AsInteger  := dmConsultas.cdsVendas.FieldByName('MOV_VENDEDOR').AsInteger;
       Open;
  End;
  //
  M_NMVEND := dmConsultas.qryVendedor.FieldByName('FUN_NOME').AsString;
  //
  If (W_VLDESC > 0) Then
      W_TOVEND := dmConsultas.cdsVendas.FieldByName('MOV_VALOR').AsCurrency + W_VLDESC
  Else
      W_TOVEND := dmConsultas.cdsVendas.FieldByName('MOV_VALOR').AsCurrency;
  //
  W_VLVEND := dmConsultas.cdsVendas.FieldByName('MOV_VALOR').AsCurrency;
  //
  dm.CdsEmpresas.Close;
  With dm.SdsEmpresas do
  Begin
       Active := False;
       CommandText := 'SELECT * FROM EMPRESAS Where (EMP_CODIGO = :pCODIGO)';
       Params.ParamByName('pCODIGO').AsInteger := W_CDLOJA;
       Active := true;
  End;
  dm.CdsEmpresas.Open;
  //
  Data:= Copy(DatetoStr(Date),1,3)+Copy(DatetoStr(Date),4,3)+Copy(DatetoStr(Date),7,4);
  //
 try
     VDOImpressora := TVDODmPrinter.Create(nil);
     VDOImpressora.Title := 'Visualizar Impressão';
     VDOImpressora.ShowPreview       := True;
     VDOImpressora.ShowProgress      := True;
     VDOImpressora.Font.Size         := fsCondensed;
     M_QTCARA := 159;
     //
     With VDOImpressora do
     Begin
          BeginDoc;
          //
          Font.Size  := fsCondensed;
          Font.Style := [];
          { salta duas linhas}
          NewLine(2);
          M_POSINI := 0;
          { Imprime e alinhado à esquerda dentro de uma área de 52 caracteres}
          Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*',48 )]), True);
          { Imprime a string "Cupom ", alinhado à esquerda"-" dentro de uma área de trita caracteres}
          Print(M_POSINI, Format('%-48s', [uFuncoes.PadC('INFOG2 - CUPOM DE VENDA - 2ª VIA',48)]), True);
          { Imprime e alinhado à esquerda dentro de uma área de 48 caracteres}
          Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*',48 )]), True);
          { Imprime o nome da Loja}
          Print(M_POSINI, Format('%-48s', [uFuncoes.PadC('LOJA: '+dm.CdsEmpresas.FieldByName('EMP_FANTASIA').AsString,48)]), True);
          Print(M_POSINI, Format('%-48s', [uFuncoes.PadC(dm.CdsEmpresas.FieldByName('EMP_ENDERECO').AsString,52)]), True);
          { ---- Impressão dos Cabeçalho-----}
          { Imprime e alinhado à esquerda dentro de uma área de 48 caracteres}
          Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*',48 )]),TRUE);
          Print(M_POSINI, Format('%-48s', ['Nº. DA VENDA....: '+uFuncoes.StrZero(InttoStr(W_NRVEND),7)]), True);
          //Print(M_POSINI, Format('%-48s', ['CLIENTE.........: '+ M_CDCLIE + ' - '+M_NMCLIE]), True
          //
          If (M_NMCLIE = 'VENDA AO CONSUMIDO') Then
              Print(M_POSINI, Format('%-48s', ['CLIENTE.........: '+ M_CDCLIE + ' - '+M_NMCLIE]), True)
          Else
          begin
               Dm.FilterCDS(Dm.CdsClientes, fsInteger, M_CDCLIE);
               Print(M_POSINI, Format('%-48s', ['CLIENTE.........: '+ M_NMCLIE]), True);
               if not (Dm.CdsClientes.IsEmpty) Then
               begin
                   Print(M_POSINI, Format('%-48s', ['TELEFONE........: '+ FormataFONE(Dm.CdsClientesCLI_FONE1.AsString)]), True);
                   Print(M_POSINI, Format('%-48s', ['ENDEREÇO........: '+ Dm.CdsClientesCLI_ENDERECO. AsString]), True);
                   Print(M_POSINI, Format('%-48s', ['NUMERO..........: '+ Dm.CdsClientesCLI_NUMERO.AsString]), True);
                   Print(M_POSINI, Format('%-48s', ['COMPLEMENTO.....: '+ Dm.CdsClientesCLI_END_COBRANCA.AsString]), True);
                   Print(M_POSINI, Format('%-48s', ['BAIRRO..........: '+ GetBairro(Dm.CdsClientesCID_CODIGO.AsInteger, Dm.CdsClientesBAI_CODIGO.AsInteger)]), True);
                   Print(M_POSINI, Format('%-48s', ['CIDADE/UF.......: '+ GetCidade(Dm.CdsClientesCID_CODIGO.AsInteger)]), True);
               End;
          End;
          //
          Print(M_POSINI, Format('%-48s', ['VENDEDOR........: '+M_NMVEND]), True);
          Print(M_POSINI, Format('%-48s', ['CAIXA...........: '+uFuncoes.StrZero(InttoStr(M_CDCAIX),3)+ ' - ' + NOME_CAIXA(M_CDCAIX)]), True);
          { Imprime a Data de Emissão, baseada na data atual e salta para próxima linha}
          Print(M_POSINI, Format('%-48s', ['DATA/HORA.......: '+dmConsultas.cdsVendas.FieldByName('MOV_DATAVENDA').AsString+uFuncoes.Replicate(' ',10)
               +dmConsultas.cdsVendas.FieldByName('MOV_HORAVENDA').AsString]), True);
          //
          If (M_FLSITU = 'C') Then
           Begin
                Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*',48 )]),true);
                Print(M_POSINI, Format('%-48s', [uFuncoes.PadC('*** VENDA CANCELADA ***',48)]),true);
           End;
           //
           Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*',48 )]), true);
           Print(M_POSINI, Format('%-48s', ['ITEM CODIGO        DESCRICAO']), true);
           Print(M_POSINI, Format('%-48s', ['QUANT.    UNIDADE    VALOR UNITARIO   SUB-TOTAL']), true);
           Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('-',48 )]), true);
           //
           {----- Fase de Emissão dos Itens da Nota -----}
           { Move o ponteiro para o primeiro registro}
            With dmConsultas.cdsProdVenda do
              Begin
                  Active := False;
                  Params.ParamByName('pPEDIDO').AsInteger := W_NRVEND;
                  Active := True;
              End;
            dmConsultas.cdsProdVenda.First;
            M_NRITEM := 1;
            While not (dmConsultas.cdsProdVenda.Eof) do
            Begin
                {carrega os dados}
                 W_CDITEN := dmConsultas.cdsProdVenda.FieldByName('MOP_PRODUTO').AsString;
                 W_NMDESC := Copy(dmConsultas.cdsProdVenda.FieldByName('MOP_NMPRODUTO').AsString,1,27);
                 W_QTITEN := dmConsultas.cdsProdVenda.FieldByName('MOP_QUANTIDADE').AsFloat;
                 W_UNITEN := dmConsultas.cdsProdVenda.FieldByName('MOP_UNIDADE').AsString;
                 W_VLUNIT := dmConsultas.cdsProdVenda.FieldByName('MOP_VALOR').AsCurrency;
                 W_VLSUBT := dmConsultas.cdsProdVenda.FieldByName('MOP_VALOR').AsCurrency*
                             dmConsultas.cdsProdVenda.FieldByName('MOP_QUANTIDADE').AsCurrency;
                 //
                 Print(M_POSINI, Format('%-48s',  [uFuncoes.StrZero(InttoStr(M_NRITEM),3)+ '  ' + W_CDITEN + ' '+W_NMDESC]));
                 Print(M_POSINI, Format('%2s',    [W_FLCANC]),true);
                 //
                 Print(M_POSINI, Format('%-12.3f', [W_QTITEN]));
                 Print(M_POSINI, Format('%-11s', [W_UNITEN]));
                 Print(M_POSINI, Format('%12s',  [FormatFloat('###,###,##0.#0',W_VLUNIT)]));
                 Print(M_POSINI, Format('%12s',  [FormatFloat('###,###,##0.#0',W_VLSUBT)]),true);
                 //
                 M_NRITEM := M_NRITEM + 1;
                 //
                 dmConsultas.cdsProdVenda.Next;
            End;
            //
            Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('-',48)]),true);
            Print(M_POSINI, Format('%-30s', ['TOTAL........:   '])+ Format('%15s',[FormatFloat('###,##0.#0', W_TOVEND - W_VLACRE)]),true);
            Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('-',48)]),true);
            If (W_VLDESC > 0) Then
                Print(M_POSINI, Format('%-20s',['DESCONTO.......:    '])+Format('%15s',[FormatFloat('###,##0.#0',W_VLDESC)]),true);
            If (W_VLACRE > 0) Then
                Print(M_POSINI, Format('%-20s',['ACRESCIMO......:    '])+Format('%15s',[FormatFloat('###,##0.#0',W_VLACRE)]),true);
            { Imprime Total a Pagar }
            Print(M_POSINI, Format('%-20s',['TOTAL A PAGAR..:    '])+Format('%15s',[FormatFloat('###,##0.#0',W_VLVEND)]),true);
            { Salta três linhas}
            NewLine();
            {Imprime Modalidades}
            dm.cdsMovimentoCaixa.Close;
            With dm.dstMovimentoCaixa do
            Begin
                 Active := False;
                 Commandtext := 'Select * from MOVIMENTO_CAIXA '+
                                'Where (MCA_LOJA = :pLOJA) and (MCA_VENDA = :pVENDA)';
                 Params.ParamByName('pLOJA').AsInteger  := W_CDLOJA;
                 Params.ParamByName('pVENDA').AsInteger := W_NRVEND;
                 Active := True;
            End;
            dm.cdsMovimentoCaixa.Open;
            //
            dm.cdsMovimentoCaixa.First;
            While not (dm.cdsMovimentoCaixa.Eof) do
            Begin
                 W_MNMODA := dm.cdsMovimentoCaixa.FieldByName('MCA_NOMEMODA').AsString;
                 W_VLMODA := dm.cdsMovimentoCaixa.FieldByName('MCA_VLMODALIDADE').AsCurrency;
                 M_VLTROC := M_VLTROC + dm.cdsMovimentoCaixa.FieldByName('MCA_VLTROCO').AsCurrency;
                 //
                 Print(M_POSINI, Format('%-20s',[ W_MNMODA + ' : ']));
                 Print(M_POSINI, Format('%15s',[FormatFloat('###,###,##0.#0',W_VLMODA)]),true);
                 // Proximo
                 dm.cdsMovimentoCaixa.Next;
            End;
            //
            {NewLine();
            Print(M_POSINI, Format('%-20s',['TROCO..........:    '])+Format('%15s',[FormatFloat('###,##0.00',dmConsultas.cdsVendas.FieldByName('MOV_TAXA_SERVICO').AsCurrency)]),true);}
            { Imprime troco}
            NewLine();
            Print(M_POSINI, Format('%-20s',['TROCO..........:    '])+Format('%15s',[FormatFloat('###,##0.00',StrtoFloat(AllTrim(FloattoStr(M_VLTROC))))]),true);
            { Salta três linhas }
            NewLine(3);
            Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate(' ',2)+uFuncoes.Replicate('-',44)]),true);
            If (M_NMCLIE <> 'VENDA AO CONSUMIDOR') Then
                Print(M_POSINI, Format('%-48s', [uFuncoes.PadC(M_NMCLIE,48)]),true)
            Else
                Print(M_POSINI, Format('%-48s', [uFuncoes.PadC('ASSINATURA DO CLIENTE',48)]),true);
            { Salta Três linhas }
            NewLine(3);
            { Imprime separador}
            Print(M_POSINI,Format('%-48s', [uFuncoes.Replicate('*',48 )]),true);
            Print(M_POSINI,Format('%-48s', [uFuncoes.PadC('OBRIGADO POR SUA PREFERENCIA',48)]),true);
            Print(M_POSINI,Format('%-48s', [uFuncoes.Replicate('*',48 )]),true);
            Print(M_POSINI,Format('%-48s', ['DESENVOLVIDO POR:INFOG2 TECNOLOGIA-(86)3226-4510']),true);
            { Salta uma linhas }
            NewLine();
            //
            EndDoc;
            FreeAndNil(VDOImpressora);
    End;   // fim-with VDOImpressora
 Finally

 End;
end;

Procedure NotaFiscal(Local : string; W_CDLOJA, W_NRVEND : Integer);
Var
  Impressora:TextFile;
  Data, W_CDITEN, W_NMDESC, W_MNMODA, W_FLCANC : String;
  W_UNITEN : String;
  W_VLMODA, W_VLUNIT, W_VLSUBT, W_TOVEND, W_VLDESC, W_VLACRE, W_VLVEND, M_VLTROC, W_QTITEN : Real;
  //
  M_CDCLIE, M_CAMINH, M_NMCLIE, M_NMVEND, M_FLSITU, M_NMFILE : String;
  M_CDCAIX, M_FLIMPR, M_NRITEM : Integer;
begin
     //
     M_CAMINH := uFuncoes.PASTA_CUPOM(StrtoInt(UFrmAdmin.M_CDUSUA));
     //
     If (fileexists(M_CAMINH+'\impressora.txt')) then
        M_CAMINH := uFuncoes.percorreArquivoTexto(M_CAMINH+'\impressora.txt')
     Else
     begin
        M_NMFILE := 'CUPOM.TXT';
        //
        If (M_CAMINH = 'C:\') Then
           M_CAMINH := ExtractFilePath( Application.ExeName ) + M_NMFILE
           //M_CAMINH
        Else
           M_CAMINH := M_CAMINH+'\'+M_NMFILE;
     End;
  //M_CAMINH := ExtractFilePath( Application.ExeName )+'\NN.TXT';
  M_CDCLIE := StrZero(dmConsultas.cdsVendas.FieldByName('MOV_CLIENTE').AsString,7);
  M_NMCLIE := dmConsultas.cdsVendas.FieldByName('MOV_NOMECLIENTE').AsString;
  W_VLDESC := dmConsultas.cdsVendas.FieldByName('MOV_DESCONTO').AsCurrency;
  W_VLACRE := dmConsultas.cdsVendas.FieldByName('MOV_ACRESCIMO').AsCurrency;
  M_FLSITU := dmConsultas.cdsVendas.FieldByName('MOV_SITUACAO').AsString;
  // Caixa
  With dmConsultas.qryMovCaixa do
  Begin
       Close;
       Params.ParamByName('pLOJA').AsInteger  := W_CDLOJA;
       Params.ParamByName('pVENDA').AsInteger := W_NRVEND;
       Open;
  End;
  //
  M_CDCAIX := dmConsultas.qryMovCaixa.FieldByName('MCA_CAIXA').AsInteger;
  // Vendedor
  With dmConsultas.qryVendedor do
  Begin
       Close;
       Params.ParamByName('pCODIGO').AsInteger  := dmConsultas.cdsVendas.FieldByName('MOV_VENDEDOR').AsInteger;
       Open;
  End;
  //
  M_NMVEND := dmConsultas.qryVendedor.FieldByName('FUN_NOME').AsString;
  //
  If (W_VLDESC > 0) Then
      W_TOVEND := dmConsultas.cdsVendas.FieldByName('MOV_VALOR').AsCurrency + W_VLDESC
  Else
      W_TOVEND := dmConsultas.cdsVendas.FieldByName('MOV_VALOR').AsCurrency;
  //
  W_VLVEND := dmConsultas.cdsVendas.FieldByName('MOV_VALOR').AsCurrency;
  //
  dm.CdsEmpresas.Close;
  With dm.SdsEmpresas do
  Begin
       Active := False;
       CommandText := 'SELECT * FROM EMPRESAS Where (EMP_CODIGO = :pCODIGO)';
       Params.ParamByName('pCODIGO').AsInteger := W_CDLOJA;
       Active := true;
  End;
  dm.CdsEmpresas.Open;
  //
  Data:= Copy(DatetoStr(Date),1,3)+Copy(DatetoStr(Date),4,3)+Copy(DatetoStr(Date),7,4);
  {Relaciona a variável impressora com a}
   AssignFile(IMPRESSORA, M_CAMINH);
  {abre a porta da impressão }
  Rewrite(IMPRESSORA);
  {envia caractere de controle para comprimir a impressão}
  Write(IMPRESSORA,#15);
  { salta duas linhas}
  Writeln(impressora);
  { Imprime e alinhado à esquerda dentro de uma área de 52 caracteres}
  Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('*',48 )]));
  { Imprime a string "Cupom ", alinhado à esquerda"-" dentro de uma área de trita caracteres}
  Writeln(Impressora,Format('%-48s',[uFuncoes.PadC('INFOG2 - CUPOM DE VENDA - 2'+CHR(167)+' VIA',48)]));
  { Imprime e alinhado à esquerda dentro de uma área de 48 caracteres}
  Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('*',48 )]));
  { Imprime o nome da Loja}
  Writeln(Impressora,Format('%-48s',[uFuncoes.PadC('LOJA: '+dm.CdsEmpresas.FieldByName('EMP_FANTASIA').AsString,48)]));
  Writeln(Impressora,Format('%-52s',[uFuncoes.PadC(dm.CdsEmpresas.FieldByName('EMP_ENDERECO').AsString,52)]));
  //Writeln(Impressora,Format('%-52s',['FONE....: ']));
  { Salta uma linhas}
  //Writeln(Impressora);
  { ---- Impressão dos Cabeçalho-----}
  { Imprime e alinhado à esquerda dentro de uma área de 48 caracteres}
  Writeln (Impressora,Format('%-30s', [uFuncoes.Replicate('*',48 )]));
  Writeln (Impressora,Format('%-30s', ['N'+CHR(167)+'. DA VENDA....: '+uFuncoes.StrZero(InttoStr(W_NRVEND),7)]));
  Writeln (Impressora,Format('%-52s', ['CLIENTE.........: '+ M_CDCLIE + ' - '+M_NMCLIE]));
  Writeln (Impressora,Format('%-30s', ['VENDEDOR........: '+M_NMVEND]));
  Writeln (Impressora,Format('%-30s', ['CAIXA...........: '+uFuncoes.StrZero(InttoStr(M_CDCAIX),3)+ ' - ' + NOME_CAIXA(M_CDCAIX)]));
  { Imprime a Data de Emissão, baseada na data atual e salta para próxima linha}
  Writeln (Impressora,Format('%-30s', ['DATA/HORA.......: '+dmConsultas.cdsVendas.FieldByName('MOV_DATAVENDA').AsString+uFuncoes.Replicate(' ',10)
     +dmConsultas.cdsVendas.FieldByName('MOV_HORAVENDA').AsString]));
  //
  If (M_FLSITU = 'C') Then
  Begin
       Writeln (Impressora,Format('%-30s', [uFuncoes.Replicate('*',48 )]));
       Writeln (Impressora,Format('%-48s', [uFuncoes.PadC('*** VENDA CANCELADA ***',48)]));
  End;
  //
  Writeln (Impressora,Format('%-30s', [uFuncoes.Replicate('*',48 )]));
  Writeln (Impressora,Format('%-30s', ['ITEM CODIGO        DESCRICAO']));
  Writeln (Impressora,Format('%-30s', ['QUANT.    UNIDADE    VALOR UNITARIO   SUB-TOTAL']));
  Writeln (Impressora,Format('%-30s', [uFuncoes.Replicate('-',48 )]));
  //
  {----- Fase de Emissão dos Itens da Nota -----}
  { Move o ponteiro para o primeiro registro}
  With dmConsultas.cdsProdVenda do
  Begin
       Active := False;
       Params.ParamByName('pPEDIDO').AsInteger := W_NRVEND;
       Active := True;
  End;
  dmConsultas.cdsProdVenda.First;
  M_NRITEM := 1;
  While not (dmConsultas.cdsProdVenda.Eof) do
  Begin
      {carrega os dados}
       W_CDITEN := dmConsultas.cdsProdVenda.FieldByName('MOP_PRODUTO').AsString;
       W_NMDESC := Copy(dmConsultas.cdsProdVenda.FieldByName('MOP_NMPRODUTO').AsString,1,27);
       W_QTITEN := dmConsultas.cdsProdVenda.FieldByName('MOP_QUANTIDADE').AsFloat;
       W_UNITEN := dmConsultas.cdsProdVenda.FieldByName('MOP_UNIDADE').AsString;
       W_VLUNIT := dmConsultas.cdsProdVenda.FieldByName('MOP_VALOR').AsCurrency;
       W_VLSUBT := dmConsultas.cdsProdVenda.FieldByName('MOP_VALOR').AsCurrency*
                   dmConsultas.cdsProdVenda.FieldByName('MOP_QUANTIDADE').AsCurrency;
       //
       //Writeln (Impressora, W_CDITEN + ' '+W_NMDESC+ '    '+W_FLCANC);
       Write   (Impressora, Format('%-46s',  [uFuncoes.StrZero(InttoStr(M_NRITEM),3)+ '  ' + W_CDITEN + ' '+W_NMDESC]));
       Writeln (Impressora, Format('%2s',    [W_FLCANC]));
       //
       Write   (Impressora, Format('%-12.3f', [W_QTITEN]));
       Write   (Impressora, Format('%-11s', [W_UNITEN]));
       Write   (Impressora, Format('%12s',  [FormatFloat('###,###,##0.#0',W_VLUNIT)]));
       Writeln (Impressora, Format('%12s',  [FormatFloat('###,###,##0.#0',W_VLSUBT)]));
       //
       M_NRITEM := M_NRITEM + 1;
       //
       dmConsultas.cdsProdVenda.Next;
  End;
  //
  Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('-',48)]));
  Writeln (Impressora,Format('%-30s', ['TOTAL........:   '])+ Format('%15s',[FormatFloat('###,##0.#0', W_TOVEND - W_VLACRE)]));
  Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('-',48)]));
  If (W_VLDESC > 0) Then
      Writeln(Impressora,Format('%-20s',['DESCONTO.......:    '])+Format('%15s',[FormatFloat('###,##0.#0',W_VLDESC)]));
  If (W_VLACRE > 0) Then
      Writeln(Impressora,Format('%-20s',['ACRESCIMO......:    '])+Format('%15s',[FormatFloat('###,##0.#0',W_VLACRE)]));
  { Imprime Total a Pagar }
  Writeln(Impressora,Format('%-20s',['TOTAL A PAGAR..:    '])+Format('%15s',[FormatFloat('###,##0.#0',W_VLVEND)]));
  { Salta três linhas}
  Writeln(Impressora);
  {Imprime Modalidades}
  dm.cdsMovimentoCaixa.Close;
  With dm.dstMovimentoCaixa do
  Begin
       Active := False;
       Commandtext := 'Select * from MOVIMENTO_CAIXA '+
                      'Where (MCA_LOJA = :pLOJA) and (MCA_VENDA = :pVENDA)';
       Params.ParamByName('pLOJA').AsInteger  := W_CDLOJA;
       Params.ParamByName('pVENDA').AsInteger := W_NRVEND;
       Active := True;
  End;
  dm.cdsMovimentoCaixa.Open;
  //
  dm.cdsMovimentoCaixa.First;
  While not (dm.cdsMovimentoCaixa.Eof) do
  Begin
       W_MNMODA := dm.cdsMovimentoCaixa.FieldByName('MCA_NOMEMODA').AsString;
       W_VLMODA := dm.cdsMovimentoCaixa.FieldByName('MCA_VLMODALIDADE').AsCurrency;
       M_VLTROC := M_VLTROC + dm.cdsMovimentoCaixa.FieldByName('MCA_VLTROCO').AsCurrency;
       //
       Write(Impressora,Format('%-20s',[ W_MNMODA + ' : ']));
       Writeln(Impressora,Format('%15s',[FormatFloat('###,###,##0.#0',W_VLMODA)]));
       // Proximo
       dm.cdsMovimentoCaixa.Next;
  End;
  { Imprime troco}
  Writeln(Impressora);
  Writeln(Impressora,Format('%-20s',['TROCO..........:    '])+Format('%15s',[FormatFloat('###,##0.00',StrtoFloat(AllTrim(FloattoStr(M_VLTROC))))]));
  { Salta três linhas }
  Writeln(Impressora);
  Writeln(Impressora);
  Writeln(Impressora);
  Writeln(Impressora, Format('%-48s', [uFuncoes.Replicate(' ',2)+uFuncoes.Replicate('-',44)]));
  If (M_NMCLIE <> 'VENDA AO CONSUMIDOR') Then
      Writeln(Impressora, Format('%-48s', [uFuncoes.PadC(M_NMCLIE,48)]))
  Else
      Writeln(Impressora, Format('%-48s', [uFuncoes.PadC('ASSINATURA DO CLIENTE',48)]));
  { Salta Três linhas }
  Writeln(Impressora);
  Writeln(Impressora);
  Writeln(Impressora);
  { Imprime separador}
  Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('*',48 )]));
  Writeln (Impressora,Format('%-48s', [uFuncoes.PadC('OBRIGADO POR SUA PREFERENCIA',48)]));
  Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('*',48 )]));
  Writeln (Impressora,Format('%-48s', ['DESENVOLVIDO POR:INFOG2 TECNOLOGIA-(86)3226-4510']));
  { Salta uma linhas }
  Writeln(Impressora);
  { Fecha a porta de impressão}
  System.Close(Impressora);
  // Abri o bloco de notas
  //Winexec(Pchar('NotePad.exe '+M_CAMINH),SW_SHOWNORMAL);
end;

function CDLOJA(M_NMLOJA : String) : integer;
begin
  with dmRelatorios.cdsLojas do
  begin
        Active := False;
        CommandText := 'Select EMP_CODIGO, EMP_FANTASIA from EMPRESAS where (EMP_FANTASIA = :pNOME)';
        Params.ParamByName('pNOME').AsString := M_NMLOJA;
        Active := True;
        //
     If not (IsEmpty) Then
       result := FieldByname('EMP_CODIGO').AsInteger;
  end;
{     With dmConsultas.qryLoja do
     Begin
          SQL.Clear;
          Close;
          Sql.Add('Select EMP_CODIGO, EMP_FANTASIA from EMPRESAS');
          Sql.Add('Where (EMP_FANTASIA = :pNOME)');
          Params.ParamByName('pNOME').AsString := M_NMLOJA;
          Open;
     End;
     //
     If not (dmConsultas.qryLoja.IsEmpty) Then
       result := dmConsultas.qryLoja.FieldByname('EMP_CODIGO').AsInteger;}
End;

function CDFABRICANTE(M_NMFABRICANTE : String) : integer;
Begin
     With dmConsultas.qryFornecedor do
     Begin
          Close;
          Params.ParamByName('pFANTASIA').AsString := M_NMFABRICANTE;
          Open;
     End;
     //
     If not (dmConsultas.qryFornecedor.IsEmpty) Then
       result := dmConsultas.qryFornecedor.FieldByname('FOR_CODIGO').AsInteger
     Else
       result := 0;
End;

function CDSECAO(M_NMSECAO : String) : integer;
Begin
     With dmConsultas.qrySecao do
     Begin
          SQL.Clear;
          Close;
          Sql.Add('Select * from SECAO');
          Sql.Add('Where (SEC_DESCRICAO = :pDESCRICAO)');
          Params.ParamByName('pDESCRICAO').AsString := M_NMSECAO;
          Open;
     End;
     //
     If not (dmConsultas.qrySecao.IsEmpty) Then
       result := dmConsultas.qrySecao.FieldByname('SEC_CODIGO').AsInteger;
End;

function CDSUBSECAO(M_CDSECAO : INTEGER ; M_SUBSECAO : String) : integer;
Begin
     With dmConsultas.qrySubSebSecao do
     Begin
          SQL.Clear;
          Close;
          Sql.Add('Select * from SUBSECAO Where (SEC_CODIGO = :pSECAO)');
          Sql.Add('and (SUB_DESCRICAO = :pDESCRICAO )');
          Params.ParamByName('pSECAO').AsInteger    := M_CDSECAO;
          Params.ParamByName('pDESCRICAO').AsString := M_SUBSECAO;
          Open;
     End;
     //
     If not (dmConsultas.qrySubSebSecao.IsEmpty) Then
       result := dmConsultas.qrySubSebSecao.FieldByname('SUB_CODIGO').AsInteger;
End;

Function LOCALIZAR_BANCO(M_CDBANC : String) : Boolean;
begin
     With dmConsultas.qryBancos do
     Begin
          Close;
          Params.ParamByName('pCODIGO').AsString := M_CDBANC;
          Open;
     End;
     //
     If (dmConsultas.qryBancos.IsEmpty) Then
         result := False
     Else
         result := true;
end;

function PROCURAR(M_CDPROD : String) : boolean;
begin
     With dmConsultas.qryProdutos do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select PRO_CODIGO, PRO_DESCRICAO, UNI_CODIGO, UNI_ARMAZENAMENTO, ');
          SQL.Add('PRO_VLVENDA from PRODUTOS Where (PRO_CODIGO = :pCODIGO)');
          Params.ParamByName('pCODIGO').AsString := M_CDPROD;
          Open;
     End;
     //
     If (dmConsultas.qryProdutos.IsEmpty) Then
        result := False
     Else
        result := True;
End;

//
function PRODUTO_ESTOQUE(M_CDPROD : String; M_CDLOJA : Integer) : boolean;
Begin
     With dmConsultas.qryEstoqueProcura do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select E.PRO_CODIGO, E.EST_QUANTIDADE  from ESTOQUE E');
          SQL.Add('Where (EST_CODIGOLOJA = :pLOJA) AND (PRO_CODIGO = :pCODIGO)');
          Params.ParamByName('pCODIGO').AsString := M_CDPROD;
          Params.ParamByName('pLOJA').AsInteger  := M_CDLOJA;
          Open;
     End;
     //
     If (dmConsultas.qryEstoqueProcura.IsEmpty) Then
        result := False
     Else
        result := True;
End;

// Preço de Venda
function CALCULA_PRECOVENDA(W_VLCOMP, W_PERIPI, W_PEFRET, W_ICMSCO, W_PETAXA, W_LULIQU, W_ICMSAN : Real;
  W_CDTRIB : Integer) : Real;
Var
      M_VLIPFT, M_VLICME, M_VLTAXA, M_PEICMV, M_VLVEND, M_VLCUST : Real;
      M_PECOMI, M_PERPIS, M_PECOFI, M_PEIPMF, M_ANICMS : Real;
Begin
        // ***  Valores calculados sobre o valor de compra
        M_VLIPFT := W_VLCOMP*(W_PERIPI+W_PEFRET)/100;    //&& Valor do ipi + valor de frete
        M_VLICME := W_VLCOMP*(W_ICMSCO)/100;             //&& ICMS de compra
        M_ANICMS := W_VLCOMP*(W_ICMSAN)/100;             // Antecipação de ICMS
        M_VLTAXA := W_VLCOMP*(W_PETAXA)/100;
        //
        M_PECOMI := dm.CdsConfigCFG_PECOMI.AsFloat;
        M_PERPIS := dm.CdsConfigCFG_PERPIS.AsFloat;
        M_PECOFI := dm.CdsConfigCFG_PECOFI.AsFloat;
        M_PEIPMF := dm.CdsConfigCFG_PEIPMF.AsFloat;
        //
        M_PEICMV := 0;
        //
        IF (W_CDTRIB <> 0) Then
        Begin
             With dmConsultas.qryTributacao do
             begin
                  Close;
                  Params.ParamByName('pCODIGO').AsInteger := W_CDTRIB;
                  Open;
             End;
             //
             If not (dmConsultas.qryTributacao.IsEmpty ) Then
                 // nova alteração 09/04/2008
                 M_PEICMV := dmConsultas.qryTributacao.FieldByName('TRI_PERCETUAL').AsCurrency;
              //M_PEICMV := 0;
              //dmConsultas.qryTributacao.FieldByName('TRI_ICMS').AsCurrency;
        End;
        //
        //***  Valores somados ao valor de compra
        M_VLCUST := W_VLCOMP + M_VLIPFT - M_VLICME + M_VLTAXA+M_ANICMS;
        M_VLVEND := M_VLCUST/(1-(M_PEICMV+W_LULIQU+M_PECOMI+M_PERPIS+M_PECOFI+M_PEIPMF)/100);
        //****
        result := M_VLVEND;
        dm.cdsProdutos.FieldByName('PRO_VLCUSTO').AsCurrency := M_VLCUST;
End;


// EDITANDO LUCRO LIQUIDO
function CALCULA_LUCROLIQUIDO(W_VLCOMP, W_PERIPI, W_PEFRET, W_ICMSCO, W_PETAXA, W_LUBRUTO, W_LULIQU : Real;
  W_CDTRIB : Integer) : Real;
Var
      M_VLIPFT, M_VLICME, M_VLTAXA, M_PEICMV, M_VLVEND, M_VLCUST : Real;
      M_PECOMI, M_PERPIS, M_PECOFI, M_PEIPMF : Real;
      M_LUBRUT, M_LULIQU : Real;
Begin
        //***  Valores calculados sobre o valor de compra
        M_VLIPFT := Arredondar(W_VLCOMP*(W_PERIPI+W_PEFRET)/100,2);    // && Valor do ipi + valor de frete
        M_VLICME := W_VLCOMP*(W_ICMSCO)/100;              //&& ICMS de compra
        M_VLTAXA := W_VLCOMP*(W_PETAXA)/100;              //&& Valor do desconto
        //
        M_PECOMI := dm.CdsConfigCFG_PECOMI.AsFloat;
        M_PERPIS := dm.CdsConfigCFG_PERPIS.AsFloat;
        M_PECOFI := dm.CdsConfigCFG_PECOFI.AsFloat;
        M_PEIPMF := dm.CdsConfigCFG_PEIPMF.AsFloat;
        //
        M_PEICMV := 0;
        //
        IF (W_CDTRIB <> 0) Then
        Begin
             With dmConsultas.qryTributacao do
             begin
                  Close;
                  Params.ParamByName('pCODIGO').AsInteger := W_CDTRIB;
                  Open;
             End;
             //
             If not (dmConsultas.qryTributacao.IsEmpty ) Then
                 // novo :09/04/2008
                 M_PEICMV := dmConsultas.qryTributacao.FieldByName('TRI_PERCETUAL').AsCurrency;
                 //M_PEICMV := 0;
                 //dmConsultas.qryTributacao.FieldByName('TRI_ICMS').AsCurrency;
        End;
        //
        // ***  Valores somados ao valor de compra
        M_VLCUST := W_VLCOMP + M_VLIPFT - M_VLICME + M_VLTAXA;
        //
        M_VLVEND := 0;
        M_LUBRUT := 0;
        If (W_VLCOMP > 0) then
           Begin
             M_VLVEND := M_VLCUST/(1-(M_PEICMV+W_LULIQU+M_PECOMI+M_PERPIS+M_PECOFI+M_PEIPMF)/100);
             M_LUBRUT := Arredondar((M_VLVEND - M_VLCUST) / M_VLCUST * 100,2);
           End;
        //
        result   := M_VLVEND;
        dm.cdsProdutos.FieldByName('PRO_LUCROBRUTO').AsCurrency := M_LUBRUT;
End;

//  EDITANDO LUCRO BRUTO
function CALCULA_LUCROBRUTO(W_VLCOMP, W_PERIPI, W_PEFRET, W_ICMSCO, W_PETAXA, W_LUBRUTO, W_LULIQUIDO : Real;
  W_CDTRIB : Integer) : Real;
Var
      M_VLIPFT, M_VLICME, M_VLTAXA, M_PEICMV, M_VLVEND, M_VLCUST : Real;
      M_PECOMI, M_PERPIS, M_PECOFI, M_PEIPMF : Real;
      M_VLFORM, W_VLFORM, M_VLIMPO, M_LULIQU : Real;
Begin
        //***  Valores calculados sobre o valor de compra
        M_VLIPFT := W_VLCOMP*(W_PERIPI+W_PEFRET)/100;   // && Valor do ipi + valor de frete
        M_VLICME := W_VLCOMP*(W_ICMSCO)/100;            //&& ICMS de compra
        M_VLTAXA := W_VLCOMP*(W_PETAXA)/100;
        //
        M_PECOMI := dm.CdsConfigCFG_PECOMI.AsFloat;
        M_PERPIS := dm.CdsConfigCFG_PERPIS.AsFloat;
        M_PECOFI := dm.CdsConfigCFG_PECOFI.AsFloat;
        M_PEIPMF := dm.CdsConfigCFG_PEIPMF.AsFloat;
        //
        M_PEICMV := 0;
        //
        IF (W_CDTRIB <> 0) Then
        Begin
             With dmConsultas.qryTributacao do
             begin
                  Close;
                  Params.ParamByName('pCODIGO').AsInteger := W_CDTRIB;
                  Open;
             End;
             //
             If not (dmConsultas.qryTributacao.IsEmpty ) Then
                 // novo :09/04/2008
                 M_PEICMV := dmConsultas.qryTributacao.FieldByName('TRI_PERCETUAL').AsCurrency;
                 //M_PEICMV := 0;
                 //dmConsultas.qryTributacao.FieldByName('TRI_ICMS').AsCurrency;
        End;
        //***  Valores somados ao valor de compra
        M_VLFORM := W_VLCOMP + M_VLIPFT - M_VLICME + M_VLTAXA;
        IF (W_LUBRUTO <> 0) Then
        Begin
           //M_VLVEND := M_VLFORM*(1+(W_LUBRUTO/100));
           dm.cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency := M_VLFORM*(1+(W_LUBRUTO/100));
           // Valor dos percentuais cobrados sobre valor de venda
           //M_VLIMPO := M_VLVEND*((M_PEICMV+M_PECOMI+M_PERPIS+M_PECOFI+M_PEIPMF)/100);
           M_VLIMPO := dm.cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency*
               ((M_PEICMV+M_PECOMI+M_PERPIS+M_PECOFI+M_PEIPMF)/100);
           W_VLFORM := M_VLFORM + M_VLIMPO;
           //M_LULIQU := (M_VLVEND - W_VLFORM)/M_VLVEND * 100;
           M_LULIQU := (dm.cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency - W_VLFORM)/
            dm.cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency * 100;
        End;
        //
        M_VLVEND := M_VLFORM/(1-(M_PEICMV+W_LULIQUIDO+M_PECOMI+M_PERPIS+M_PECOFI+M_PEIPMF)/100);
        //
        dm.cdsProdutos.FieldByName('PRO_LUCROLIQUIDO').AsCurrency := M_LULIQU;
        //result := M_VLVEND;
End;

// EDITANDO VALOR DE VENDA
function VALOR_VENDA(W_VLCOMP, W_PERIPI, W_PEFRET, W_ICMSCO, W_PETAXA, W_LUBRUTO, W_LULIQU : real;
  W_CDTRIB : Integer) : Real;
Var
      M_VLIPFT, M_VLICME, M_VLTAXA, M_PEICMV, M_VLVEND, M_VLCUST : Real;
      M_PECOMI, M_PERPIS, M_PECOFI, M_PEIPMF : Real;
      M_VLIMPO, W_VLCUST, M_VLBRUT : Real;
Begin
        //***  Valores calculados sobre o valor de compra
        M_VLIPFT := W_VLCOMP*(W_PERIPI+W_PEFRET)/100;   // && Valor do ipi + valor de frete
        M_VLICME := W_VLCOMP*(W_ICMSCO)/100;            //&& ICMS de compra
        M_VLTAXA := W_VLCOMP*(W_PETAXA)/100;            //&& Valor do desconto
        M_VLVEND := dm.cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency;
        //
        M_PECOMI := dm.CdsConfigCFG_PECOMI.AsFloat;
        M_PERPIS := dm.CdsConfigCFG_PERPIS.AsFloat;
        M_PECOFI := dm.CdsConfigCFG_PECOFI.AsFloat;
        M_PEIPMF := dm.CdsConfigCFG_PEIPMF.AsFloat;
        //
        M_PEICMV := 0;
        //
        IF (W_CDTRIB <> 0) Then
        Begin
             With dmConsultas.qryTributacao do
             begin
                  Close;
                  Params.ParamByName('pCODIGO').AsInteger := W_CDTRIB;
                  Open;
             End;
             //
             If not (dmConsultas.qryTributacao.IsEmpty ) Then
                 // novo :09/04/2008
                 M_PEICMV := dmConsultas.qryTributacao.FieldByName('TRI_PERCETUAL').AsCurrency;
                 //M_PEICMV := 0;
                 //dmConsultas.qryTributacao.FieldByName('TRI_ICMS').AsCurrency;
        End;
        //***  Valores somados ao valor de compra
        M_VLCUST := W_VLCOMP + M_VLIPFT - M_VLICME + M_VLTAXA;
        //
        M_VLBRUT := Arredondar((M_VLVEND - M_VLCUST) / M_VLCUST * 100,2);
        // Valor dos percentuais cobrados sobre valor de venda
        M_VLIMPO := M_VLVEND *((M_PEICMV+M_PECOMI+M_PERPIS+M_PECOFI+M_PEIPMF)/100);
        W_VLCUST := M_VLCUST + M_VLIMPO;
        // Valor liquido
        result  := (M_VLVEND - W_VLCUST)/M_VLVEND * 100;
        // Valor bruto
        dm.cdsProdutos.FieldByName('PRO_LUCROBRUTO').AsCurrency := M_VLBRUT;
End;

function percorreArquivoTexto ( nomeDoArquivo: String ) : String;
var arq: TextFile;
linha: String;
begin
AssignFile ( arq, nomeDoArquivo );
Reset ( arq );
ReadLn ( arq, linha );
while not Eof ( arq ) do
begin
{ Processe a linha lida aqui. }
{ Para particionar a linha lida em pedaços, use a função Copy. }
ReadLn ( arq, linha );
end;
CloseFile ( arq );
result := linha;
end;

function PASTA_CUPOM(M_CDUSUA : Integer) : String;
begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select SEN_CODIGO, SEN_PASTA_CUPOM from USUARIOS');
           SQL.Add('Where (SEN_CODIGO = :pCODIGO)');
           Params.ParamByName('pCODIGO').AsInteger := M_CDUSUA;
           Open;
           //
           If not (IsEmpty) Then
              If not Empty(FieldByName('SEN_PASTA_CUPOM').AsString) Then
                  result := FieldByName('SEN_PASTA_CUPOM').AsString
              Else
                  result := 'C:\';
           //
           Close;
      End;
End;

Procedure Nota_Recebimento(Local , W_NMMODA : string; M_NRSEQU, M_NRRECE, M_CDLOJA : integer; M_FLPARC, M_FLVIA : String);
Var
    // Variável da classe TVDODmPrinter que fará o relatório
    VDOImpressora : TVDODmPrinter;
    Linha : string;
    LinCab1, LinCab2, M_ESPACO : String;
    M_NUMMES, M_QTCARA : Integer;
    M_UNIDAD, M_QUANT, M_NMDESC, M_VLUNIT, M_VALISS : String;
    LINHA1, VALOR, M_POSINI : integer;
    //
  Data, W_CDITEN, W_NMDESC, W_MNMODA, W_FLCANC : String;
  W_VLMODA, W_TOVEND, W_VLDESC, W_VLVEND, M_VLTROC : Real;
  M_CAMINH, M_CDCLIE, M_NMCLIE, M_NMVEND, M_FLSITU : String;
  M_CDCAIX, M_FLIMPR, M_NRITEM : Integer;
  M_DTMOVI, M_DTPAGA : TDate;
  W_VLPARC, W_VLJURO, W_VLPAGO, W_VLMULT : Double;
  M_NMFILE : String;

begin
   try
     M_CDCLIE := StrZero(DM2.cdsContasReceber.FieldByName('REC_CLIENTE').AsString,7);
     M_NMCLIE := NOME_CLIENTE(DM2.cdsContasReceber.FieldByName('REC_CLIENTE').AsInteger);
     M_DTPAGA := DM2.cdsContasReceber.FieldByName('REC_DATAPAGAMENTO').AsDateTime;
     W_VLDESC := dmConsultas.cdsVendas.FieldByName('MOV_DESCONTO').AsCurrency;
     M_FLSITU := dmConsultas.cdsVendas.FieldByName('MOV_SITUACAO').AsString;
     W_VLVEND := DM2.cdsContasReceber.FieldByName('REC_VALORPARCELA').AsCurrency;
     //
     dm.CdsEmpresas.Close;
     With dm.SdsEmpresas do
      Begin
           Active := False;
           CommandText := 'SELECT * FROM EMPRESAS Where (EMP_CODIGO = :pCODIGO)';
           Params.ParamByName('pCODIGO').AsInteger := M_CDLOJA;
           Active := true;
      End;
     dm.CdsEmpresas.FetchParams;
     dm.CdsEmpresas.Open;
     //
     VDOImpressora := TVDODmPrinter.Create(nil);
     VDOImpressora.Title := 'Visualizar Impressão';
     VDOImpressora.ShowPreview       := True;
     VDOImpressora.ShowProgress      := True;
     VDOImpressora.Font.Size         := fsCondensed;
     M_QTCARA := 159;
     //
     With VDOImpressora do
     Begin
          BeginDoc;
          //
          Font.Size  := fsCondensed;
          Font.Style := [];
          //
          M_DTMOVI := Date();
          Data := Copy(DatetoStr(M_DTMOVI),1,3)+Copy(DatetoStr(M_DTMOVI),4,3)+Copy(DatetoStr(M_DTMOVI),7,4);
          NewLine();
          //
          M_POSINI := 0;
          { Imprime e alinhado à esquerda dentro de uma área de 52 caracteres}
          Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*',48 )]), True);
          { Imprime a string "Cupom ", alinhado à esquerda"-" dentro de uma área de trita caracteres}
          Print(M_POSINI, Format('%-48s',[uFuncoes.PadC('INFOG2 AUTOMACAO',48)]),true);
          If (M_FLVIA = '1') Then
               Print(M_POSINI, Format('%-48s',[uFuncoes.PadC('RECIBO DE PAGAMENTO',48)]),true)
          Else
               Print(M_POSINI, Format('%-48s',[uFuncoes.PadC('RECIBO DE PAGAMENTO 2º VIA',48)]),true);
          { Imprime e alinhado à esquerda dentro de uma área de 48 caracteres}
          Print(M_POSINI, Format('%-30s', [uFuncoes.Replicate('*',48 )]),true);
          { Imprime o nome da Loja}
          Print(M_POSINI, Format('%-48s',[uFuncoes.PadC('LOJA: '+dm.CdsEmpresas.FieldByName('EMP_FANTASIA').AsString,48)]),true);
          Print(M_POSINI, Format('%-48s',[uFuncoes.PadC(dm.CdsEmpresas.FieldByName('EMP_ENDERECO').AsString,48)]),true);
          { ---- Impressão dos Cabeçalho-----}
          { Imprime e alinhado à esquerda dentro de uma área de 48 caracteres}
          Print(M_POSINI, Format('%-30s', [uFuncoes.Replicate('*',48 )]),true);
          Print(M_POSINI, Format('%-30s', ['N. Recebimento.: '+ uFuncoes.StrZero(InttoStr(M_NRRECE),7)]),true);
          Print(M_POSINI, Format('%-30s', ['Data Pagamento.: '+ Data]),true);
          Print(M_POSINI, Format('%-48s', ['Cliente........: '+ M_CDCLIE +' - '+Copy(M_NMCLIE,1,21)]),true);
          Print(M_POSINI, Format('%-48s', ['Caixa..........: '+ uFuncoes.StrZero(UFrmAdmin.M_CDUSUA,3)+ ' - '+ UFrmAdmin.M_NMUSUA ]),true);
          //
          Print(M_POSINI, Format('%-30s', ['*************** P A R C E L A S ****************']),true);
          Print(M_POSINI, Format('%-30s', ['N. PARCELA VENCIMENTO  VL_PARC DESCONTO  VL_PAGO']),true);
          Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('-',48 )]),true);
          //
          W_VLPARC := 0;
          W_VLDESC := 0;
          W_VLJURO := 0;
          //  M_FLPARC = 'S' Para varias parcelas, <> 'S' para uma parcela
          If (M_FLPARC = 'S') Then
          begin
             //
             DM2.cdsContasReceber.Close;
             With dm2.dstContasReceber do
             begin
                Active := False;
                If (M_NRSEQU <> 0) Then
                begin
                     CommandText := 'Select * from CONTASRECEBER Where (REC_CLIENTE = :pCLIENTE)  '
                                +'and (REC_SITUACAO = :pSITUACAO) and (REC_DATAPAGAMENTO = :pDTPAGAMENTO) ';
                End
                Else
                Begin
                     CommandText := 'Select * from CONTASRECEBER Where (REC_SEQUENCIA = :pNRSEQU) and (REC_CLIENTE = :pCLIENTE) '
                                +'and (REC_SITUACAO = :pSITUACAO) and (REC_DATAPAGAMENTO = :pDTPAGAMENTO) ';
                      Params.ParamByName('pNRSEQU').AsInteger  := M_NRSEQU;
                End;
                Params.ParamByName('pCLIENTE').AsInteger := StrtoInt(M_CDCLIE);
                Params.ParamByName('pSITUACAO').AsString := 'P';
                Params.ParamByName('pDTPAGAMENTO').AsDate := Date();
                Active := True;
          End;
          DM2.cdsContasReceber.FetchParams;
          DM2.cdsContasReceber.Open;
          //
          DM2.cdsPContas.DisableControls;
          DM2.cdsPContas.First;
          //
          While not (DM2.cdsPContas.Eof) do
            begin
                 Print(M_POSINI, Format('%-8s',   [uFuncoes.StrZero(DM2.cdsPContas.FieldByName('REC_NRCRED').AsString,7)])+
                                 Format('%-3s',   [uFuncoes.StrZero(DM2.cdsPContas.FieldByName('REC_PARCELA').AsString,2)])+
                                 Format('%-10s',  [DM2.cdsPContas.FieldByName('REC_DTVENC').AsString])+
                                 Format('%9.2f',  [DM2.cdsPContas.FieldByName('REC_VLPARC').AsFloat])+
                                 Format('%9.2f',  [DM2.cdsPContas.FieldByName('REC_VLDESC').AsFloat])+
                                 Format('%9.2f',  [DM2.cdsPContas.FieldByName('REC_VLPAGO').AsFloat]),true);
                 //
                 W_VLPARC := W_VLPARC + DM2.cdsPContas.FieldByName('REC_VLPARC').AsFloat;
                 W_VLDESC := W_VLDESC + DM2.cdsPContas.FieldByName('REC_VLDESC').AsFloat;
                 W_VLJURO := W_VLJURO + DM2.cdsPContas.FieldByName('REC_VLJURO').AsFloat;
                 W_VLMULT := W_VLMULT + DM2.cdsPContas.FieldByName('REC_VLMULTA').AsFloat;
                 W_VLPAGO := W_VLPAGO + DM2.cdsPContas.FieldByName('REC_VLPAGO').AsFloat;
                 //
                 DM2.cdsPContas.Next;
            End;
            DM2.cdsPContas.EnableControls;
            DM2.cdsPContas.Close;
         End
         Else
         begin
            W_VLPARC := DM2.cdsContasReceber.FieldByName('REC_VALORPARCELA').AsFloat;
            W_VLDESC := DM2.cdsContasReceber.FieldByName('REC_VALORDESCONTO').AsFloat;
            W_VLMULT := DM2.cdsContasReceber.FieldByName('REC_VLMULTA').AsFloat;
            W_VLJURO := DM2.cdsContasReceber.FieldByName('REC_VALORJUROS').AsFloat;
            W_VLPAGO := DM2.cdsContasReceber.FieldByName('REC_PAGO').AsFloat;
            //
            Print(M_POSINI, Format('%-8s',   [uFuncoes.StrZero(DM2.cdsContasReceber.FieldByName('REC_CREDITO').AsString,7)])+
                            Format('%-3s',   [uFuncoes.StrZero(DM2.cdsContasReceber.FieldByName('REC_PARCELA').AsString,2)])+
                            Format('%-10s',  [DM2.cdsContasReceber.FieldByName('REC_DATAVENCIMENTO').AsString])+
                            Format('%9.2f',  [DM2.cdsContasReceber.FieldByName('REC_VALORPARCELA').AsFloat])+
                            Format('%9.2f',  [DM2.cdsContasReceber.FieldByName('REC_VALORDESCONTO').AsFloat])+
                            Format('%9.2f',  [DM2.cdsContasReceber.FieldByName('REC_PAGO').AsFloat]),true);
         End;
         // nova alteração 07/01/2008
         if (DM2.LISTA_PRODUTOS(DM2.cdsContasReceber.FieldByName('REC_NRVENDA').AsInteger)) Then
          begin
               NewLine(2);
               Print(M_POSINI, Format('%-30s', ['*************** ITENS DA VENDA  ******************']),true);
               Print(M_POSINI, Format('%-30s', ['ITEM CODIGO        DESCRICAO']),true);
               Print(M_POSINI, Format('%-30s', ['QUANT.    UNIDADE    VALOR UNITARIO   SUB-TOTAL']),true);
               Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('-',48 )]),true);
               //
               With DM2.cdsHisProdutos do
               begin
                    First;
                    M_NRITEM := 1;
                    While not (Eof) do
                    begin
                       Print(M_POSINI, Format('%-46s',  [uFuncoes.StrZero(InttoStr(M_NRITEM),3)+ '  ' + FieldByName('HIS_PRODUTO').AsString+ ' '+Copy(FieldByName('PRO_DESCRICAO').AsString,1,29)]),true);
                       Print(M_POSINI, Format('%-12.3f',[FieldByName('HIS_MOVIMENTO').AsFloat])+
                                       Format('%-11s', [FieldByName('HIS_UNIDADE').AsString])+
                                       Format('%12s',  [FormatFloat('###,###,##0.#0',FieldByName('HIS_VLVENDA').AsCurrency)])+
                                       Format('%12s',  [FormatFloat('###,###,##0.#0',(FieldByName('HIS_VLVENDA').AsCurrency * FieldByName('HIS_MOVIMENTO').AsFloat))]),true);
                       //  Proximo
                       M_NRITEM := M_NRITEM + 1;
                       Next;
                    End;
                End; // fim-with
                //
                NewLine(2)
          End;
          //
          Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('-',48)]),true);
          NewLine();
          //
          Print(M_POSINI, Format('%-30s', ['TOTAL A PAGAR..: '])+
                     Format('%12.2f', [W_VLPARC]),true);
          Print(M_POSINI, Format('%-30s', ['JUROS/MULTA....: '])+
                     Format('%12.2f', [W_VLJURO + W_VLMULT]),true);
          Print(M_POSINI, Format('%-30s', ['DESCONTO.......: '])+
                     Format('%12.2f', [W_VLDESC]),true);
          Print(M_POSINI, Format('%-30s', ['VALOR PAGO.....: '])+
                     Format('%12.2f', [W_VLPAGO]),true);
          NewLine();
          Print(M_POSINI, Format('%-30s',  [W_NMMODA+ ': '])+
          //Print(M_POSINI, Format('%-30s',  ['DINHEIRO.......: '])+
                     Format('%12.2f', [W_VLPAGO]),true);
          Print(M_POSINI, Format('%-30s',  ['SALDO DEVEDOR..: '])+
                     Format('%12.2f', [SALDO_DEVEDOR_CLIENTE(DM2.cdsContasReceber.FieldByName('REC_CLIENTE').AsInteger)]),true);
          //
          NewLine(3);
          //
          Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate(' ',2)+uFuncoes.Replicate('-',44)]),true);
          Print(M_POSINI, Format('%-48s', [uFuncoes.PadC('ASSINATURA DO CLIENTE',52)]),true);
          //
          NewLine(3);
          //
          Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*',48)]),true);
          Print(M_POSINI, Format('%-48s', [uFuncoes.PadC('OBRIGADO POR SUA PREFERENCIA',48)]),true);
          Print(M_POSINI, Format('%-48s', ['DESENVOLVIDO POR:INFOG2 TECNOLOGIA-(86)3226-4510']),true);
          { Salta duas linhas }
          NewLine(2);
          //
          EndDoc;
          FreeAndNil(VDOImpressora);
     End; // fim- with VDOImpressora
    Finally

    End;
end;

Procedure NotaRecebimento(Local : string; M_NRSEQU, M_NRRECE, M_CDLOJA : integer; M_FLPARC, M_FLVIA : String);
Var
  Impressora:TextFile;
  Data, W_CDITEN, W_NMDESC, W_MNMODA, W_FLCANC : String;
  W_VLMODA, W_TOVEND, W_VLDESC, W_VLVEND, M_VLTROC : Real;
  M_CAMINH, M_CDCLIE, M_NMCLIE, M_NMVEND, M_FLSITU : String;
  M_CDCAIX, M_FLIMPR, M_NRITEM : Integer;
  M_DTMOVI, M_DTPAGA : TDate;
  W_VLPARC, W_VLJURO, W_VLPAGO : Double;
  M_NMFILE : String;
begin
     //
     M_CAMINH := uFuncoes.PASTA_CUPOM(StrtoInt(UFrmAdmin.M_CDUSUA));
     M_DTMOVI := Date();
     //
     If (fileexists(M_CAMINH+'\impressora.txt')) then
        M_CAMINH := uFuncoes.percorreArquivoTexto(M_CAMINH+'\impressora.txt')
     Else
     begin
        M_NMFILE := 'CUPOM_REC.TXT';
        //
        If (M_CAMINH = 'C:\') Then
           M_CAMINH := M_CAMINH + M_NMFILE
        Else
           M_CAMINH := M_CAMINH+'\'+M_NMFILE;
     End;
     //
     M_CDCLIE := StrZero(DM2.cdsContasReceber.FieldByName('REC_CLIENTE').AsString,7);
     M_NMCLIE := NOME_CLIENTE(DM2.cdsContasReceber.FieldByName('REC_CLIENTE').AsInteger);
     M_DTPAGA := DM2.cdsContasReceber.FieldByName('REC_DATAPAGAMENTO').AsDateTime;
     W_VLDESC := dmConsultas.cdsVendas.FieldByName('MOV_DESCONTO').AsCurrency;
     M_FLSITU := dmConsultas.cdsVendas.FieldByName('MOV_SITUACAO').AsString;
     W_VLVEND := DM2.cdsContasReceber.FieldByName('REC_VALORPARCELA').AsCurrency;
     //
     dm.CdsEmpresas.Close;
     With dm.SdsEmpresas do
      Begin
           Active := False;
           CommandText := 'SELECT * FROM EMPRESAS Where (EMP_CODIGO = :pCODIGO)';
           Params.ParamByName('pCODIGO').AsInteger := M_CDLOJA;
           Active := true;
      End;
     dm.CdsEmpresas.FetchParams;
     dm.CdsEmpresas.Open;
     //
     Data := Copy(DatetoStr(M_DTMOVI),1,3)+Copy(DatetoStr(M_DTMOVI),4,3)+Copy(DatetoStr(M_DTMOVI),7,4);
     {Relaciona a variável impressora com a}
     AssignFile(IMPRESSORA, M_CAMINH);
     {abre a porta da impressão }
     Rewrite(IMPRESSORA);
     {envia caractere de controle para comprimir a impressão}
     Write(IMPRESSORA,#15);
     Writeln(IMPRESSORA);
     { Imprime a string "Cupom ", alinhado à esquerda"-" dentro de uma área de trita caracteres}
     Writeln(Impressora,Format('%-48s',[uFuncoes.PadC('INFOG2 AUTOMACAO',48)]));
     If (M_FLVIA = '1') Then
         Writeln(Impressora,Format('%-48s',[uFuncoes.PadC('RECIBO DE PAGAMENTO',48)]))
     Else
         Writeln(Impressora,Format('%-48s',[uFuncoes.PadC('RECIBO DE PAGAMENTO 2'+chr(167)+' VIA',48)]));
     { Imprime e alinhado à esquerda dentro de uma área de 48 caracteres}
     Writeln (Impressora,Format('%-30s', [uFuncoes.Replicate('*',48 )]));
     { Imprime o nome da Loja}
     Writeln(Impressora,Format('%-48s',[uFuncoes.PadC('LOJA: '+dm.CdsEmpresas.FieldByName('EMP_FANTASIA').AsString,48)]));
     Writeln(Impressora,Format('%-48s',[uFuncoes.PadC(dm.CdsEmpresas.FieldByName('EMP_ENDERECO').AsString,48)]));
     { ---- Impressão dos Cabeçalho-----}
     { Imprime e alinhado à esquerda dentro de uma área de 48 caracteres}
     Writeln (Impressora,Format('%-30s', [uFuncoes.Replicate('*',48 )]));
     Writeln (Impressora,Format('%-30s', ['N. Recebimento.: '+ uFuncoes.StrZero(InttoStr(M_NRRECE),7)]));
     Writeln (Impressora,Format('%-30s', ['Data Pagamento.: '+ Data]));
     Writeln (Impressora,Format('%-48s', ['Cliente........: '+ M_CDCLIE +' - '+Copy(M_NMCLIE,1,21)]));
     Writeln (Impressora,Format('%-48s', ['Caixa..........: '+ uFuncoes.StrZero(UFrmAdmin.M_CDUSUA,3)+ ' - '+ UFrmAdmin.M_NMUSUA ]));
     //
     Writeln (Impressora,Format('%-30s', ['*************** P A R C E L A S ****************']));
     Writeln (Impressora,Format('%-30s', ['N. PARCELA VENCIMENTO  VL_PARC DESCONTO  VL_PAGO']));
     Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('-',48 )]));
     //
     W_VLPARC := 0;
     W_VLDESC := 0;
     W_VLJURO := 0;
     //  M_FLPARC = 'S' Para varias parcelas, <> 'S' para uma parcela
     If (M_FLPARC = 'S') Then
      begin
           //
           DM2.cdsContasReceber.Close;
           With dm2.dstContasReceber do
           begin
                Active := False;
                If (M_NRSEQU <> 0) Then
                begin
                     CommandText := 'Select * from CONTASRECEBER Where (REC_CLIENTE = :pCLIENTE)  '
                                +'and (REC_SITUACAO = :pSITUACAO) and (REC_DATAPAGAMENTO = :pDTPAGAMENTO) ';
                End
                Else
                Begin
                     CommandText := 'Select * from CONTASRECEBER Where (REC_SEQUENCIA = :pNRSEQU) and (REC_CLIENTE = :pCLIENTE) '
                                +'and (REC_SITUACAO = :pSITUACAO) and (REC_DATAPAGAMENTO = :pDTPAGAMENTO) ';
                      Params.ParamByName('pNRSEQU').AsInteger  := M_NRSEQU;
                End;
                Params.ParamByName('pCLIENTE').AsInteger := StrtoInt(M_CDCLIE);
                Params.ParamByName('pSITUACAO').AsString := 'P';
                Params.ParamByName('pDTPAGAMENTO').AsDate := Date();
                Active := True;
           End;
           DM2.cdsContasReceber.FetchParams;
           DM2.cdsContasReceber.Open;
           //
           DM2.cdsPContas.DisableControls;
           DM2.cdsPContas.First;
           //
           While not (DM2.cdsPContas.Eof) do
            begin
                 Write   (Impressora,Format('%-8s',   [uFuncoes.StrZero(DM2.cdsPContas.FieldByName('REC_NRCRED').AsString,7)]));
                 Write   (Impressora,Format('%-3s',   [uFuncoes.StrZero(DM2.cdsPContas.FieldByName('REC_PARCELA').AsString,2)]));
                 Write   (Impressora,Format('%-10s',  [DM2.cdsPContas.FieldByName('REC_DTVENC').AsString]));
                 Write   (Impressora,Format('%9.2f',  [DM2.cdsPContas.FieldByName('REC_VLPARC').AsFloat]));
                 Write   (Impressora,Format('%9.2f',  [DM2.cdsPContas.FieldByName('REC_VLDESC').AsFloat]));
                 Writeln (Impressora,Format('%9.2f',  [DM2.cdsPContas.FieldByName('REC_VLPAGO').AsFloat]));
                 //
                 W_VLPARC := W_VLPARC + DM2.cdsPContas.FieldByName('REC_VLPARC').AsFloat;
                 W_VLDESC := W_VLDESC + DM2.cdsPContas.FieldByName('REC_VLDESC').AsFloat;
                 W_VLJURO := W_VLJURO + DM2.cdsPContas.FieldByName('REC_VLJURO').AsFloat;
                 W_VLPAGO := W_VLPAGO + DM2.cdsPContas.FieldByName('REC_VLPAGO').AsFloat;
                 //
                 DM2.cdsPContas.Next;
            End;
            DM2.cdsPContas.EnableControls;
            DM2.cdsPContas.Close;
      End
      Else
      begin
           W_VLPARC := DM2.cdsContasReceber.FieldByName('REC_VALORPARCELA').AsFloat;
           W_VLDESC := DM2.cdsContasReceber.FieldByName('REC_VALORDESCONTO').AsFloat;
           W_VLJURO := DM2.cdsContasReceber.FieldByName('REC_VALORJUROS').AsFloat;
           W_VLPAGO := DM2.cdsContasReceber.FieldByName('REC_PAGO').AsFloat;
           //
           Write   (Impressora,Format('%-8s',   [uFuncoes.StrZero(DM2.cdsContasReceber.FieldByName('REC_CREDITO').AsString,7)]));
           Write   (Impressora,Format('%-3s',   [uFuncoes.StrZero(DM2.cdsContasReceber.FieldByName('REC_PARCELA').AsString,2)]));
           Write   (Impressora,Format('%-10s',  [DM2.cdsContasReceber.FieldByName('REC_DATAVENCIMENTO').AsString]));
           Write   (Impressora,Format('%9.2f',  [DM2.cdsContasReceber.FieldByName('REC_VALORPARCELA').AsFloat]));
           Write   (Impressora,Format('%9.2f',  [DM2.cdsContasReceber.FieldByName('REC_VALORDESCONTO').AsFloat]));
           Writeln (Impressora,Format('%9.2f',  [DM2.cdsContasReceber.FieldByName('REC_PAGO').AsFloat]));
      End;
     // nova alteração 07/01/2008
     if (DM2.LISTA_PRODUTOS(DM2.cdsContasReceber.FieldByName('REC_NRVENDA').AsInteger)) Then
      begin
           Writeln (Impressora);
           Writeln (Impressora);
           Writeln (Impressora,Format('%-30s', ['*************** ITENS DA VENDA  ******************']));
           Writeln (Impressora,Format('%-30s', ['ITEM CODIGO        DESCRICAO']));
           Writeln (Impressora,Format('%-30s', ['QUANT.    UNIDADE    VALOR UNITARIO   SUB-TOTAL']));
           Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('-',48 )]));
           //
           With DM2.cdsHisProdutos do
            begin
                 First;
                 M_NRITEM := 1;
                 While not (Eof) do
                  begin
                       Writeln (Impressora, Format('%-46s',  [uFuncoes.StrZero(InttoStr(M_NRITEM),3)+ '  ' + FieldByName('HIS_PRODUTO').AsString+ ' '+Copy(FieldByName('PRO_DESCRICAO').AsString,1,29)]));
                       Write   (Impressora, Format('%-12.3f',[FieldByName('HIS_MOVIMENTO').AsFloat]));
                       Write   (Impressora, Format('%-11s', [FieldByName('HIS_UNIDADE').AsString]));
                       Write   (Impressora, Format('%12s',  [FormatFloat('###,###,##0.#0',FieldByName('HIS_VLVENDA').AsCurrency)]));
                       Writeln (Impressora, Format('%12s',  [FormatFloat('###,###,##0.#0',(FieldByName('HIS_VLVENDA').AsCurrency * FieldByName('HIS_MOVIMENTO').AsFloat))]));
                       //  Proximo
                       M_NRITEM := M_NRITEM + 1;
                       Next;
                  End;
            End; // fim-with
           //
           Writeln (Impressora);
           Writeln (Impressora);
      End;
     //
     Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('-',48)]));
     Writeln (Impressora);
     //
     Write   (Impressora,Format('%-30s', ['TOTAL A PAGAR..: ']));
     Writeln (Impressora,Format('%12.2f', [W_VLPARC]));
     Write (Impressora,Format('%-30s', ['JUROS/MULTA....: ']));
     Writeln (Impressora,Format('%12.2f', [W_VLJURO]));
     Write (Impressora,Format('%-30s', ['DESCONTO.......: ']));
     Writeln (Impressora,Format('%12.2f', [W_VLDESC]));
     Write   (Impressora,Format('%-30s', ['TOTAL PAGO...: ']));
     Writeln (Impressora,Format('%12.2f', [W_VLPAGO]));
     Writeln (Impressora);
     Write   (Impressora,Format('%-30s',  ['DINHEIRO.......: ']));
     Writeln (Impressora,Format('%12.2f', [W_VLPAGO]));
     Write   (Impressora,Format('%-30s',  ['SALDO DEVEDOR..: ']));
     Writeln (Impressora,Format('%12.2f', [SALDO_DEVEDOR_CLIENTE(DM2.cdsContasReceber.FieldByName('REC_CLIENTE').AsInteger)]));
     //
     Writeln (Impressora);
     Writeln (Impressora);
     Writeln (Impressora);
     //
     Writeln(Impressora, Format('%-48s', [uFuncoes.Replicate(' ',2)+uFuncoes.Replicate('-',44)]));
     Writeln(Impressora, Format('%-48s', [uFuncoes.PadC('ASSINATURA DO CLIENTE',52)]));
     //
     Writeln (Impressora);
     Writeln (Impressora);
     Writeln (Impressora);
     //
     Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('*',48)]));
     Writeln (Impressora,Format('%-48s', [uFuncoes.PadC('OBRIGADO POR SUA PREFERENCIA',48)]));
     Writeln (Impressora,Format('%-48s', ['DESENVOLVIDO POR:INFOG2 TECNOLOGIA-(86)3226-4510']));
     { Salta três linhas }
     Writeln(Impressora);
     Writeln(Impressora);
     { Fecha a porta de impressão}
     System.Close(Impressora);
     // Abri o bloco de notas
     //Winexec(Pchar('NotePad.exe '+M_CAMINH),SW_SHOWNORMAL);
End;

function NOME_CLIENTE(M_CDCLIE : Integer) : String;
begin
     With dmConsultas.cdsConsulta2 do
      begin
           Active := False;
           CommandText := 'Select CLI_FANTASIA, CLI_RAZAO from CLIENTES ';
           CommandText := CommandText + 'Where (CLI_CODIGO = :pCODIGO)';
           Params.ParamByName('pCODIGO').AsInteger := M_CDCLIE;
           Active := True;
           //
           If not (IsEmpty) Then
              result := FieldByName('CLI_FANTASIA').AsString;
           //
           Active := False;
      End;
End;

function RAZAO_CLIENTE(M_CDCLIE : Integer) : String;
var qraux : TSQLquery;
    texto : string;
begin
  result := 'NÃO ENCONTRADO';
  texto := 'Select CLI_FANTASIA, CLI_RAZAO from CLIENTES Where (CLI_CODIGO = :pCODIGO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger := M_CDCLIE;
      open;
      If not (IsEmpty) Then
         result := FieldByName('CLI_RAZAO').AsString;
    finally
      free;
    end;
End;

function CNPJ_CLIENTE(M_CDCLIE : Integer) : String;
var qraux : TSQLquery;
    texto : string;
begin
  result := ' ';
  texto := 'Select CLI_RAZAO, CLI_CGC from CLIENTES Where (CLI_CODIGO = :pCODIGO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger := M_CDCLIE;
      open;
      If not (IsEmpty) Then
         result := FieldByName('CLI_CGC').AsString;
    finally
      free;
    end;
End;

function SALDO_DEVEDOR_CLIENTE(M_CDCLIE : Integer) : Double;
begin
     With dmConsultas.cdsConsulta2 do
      begin
           Active := False;
           CommandText := 'Select Sum(REC_VALORPARCELA) as SALDO_DEVEDOR from CONTASRECEBER ';
           CommandText := CommandText  + ' Where (REC_CLIENTE = :pCODIGO) and (REC_SITUACAO = :pFLSITU) ';
           Params.ParamByName('pCODIGO').AsInteger := M_CDCLIE;
           Params.ParamByName('pFLSITU').AsString  := 'A';
           Active := True;
           //
           If not (IsEmpty) Then
              result := FieldByName('SALDO_DEVEDOR').AsCurrency;
           //
           Active := False;
      End;
End;

Function NOME_PRODUTO(M_CDPROD : String) : String;
Begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select PRO_DESCRICAO from PRODUTOS');
           SQL.Add('Where (PRO_CODIGO = :pCODIGO)');
           Params.ParamByName('pCODIGO').AsString := M_CDPROD;
           Open;
           //
           If not (IsEmpty) Then
              result := FieldByName('PRO_DESCRICAO').AsString;
           //
           Close;
      End;
End;

Function IPI_PRODUTO(M_CDPROD : String) : Double;
begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select PRO_IPI from PRODUTOS');
           SQL.Add('Where (PRO_CODIGO = :pCODIGO)');
           Params.ParamByName('pCODIGO').AsString := M_CDPROD;
           Open;
           //
           If not (IsEmpty) Then
              result := FieldByName('PRO_IPI').AsFloat;
           //
           Close;
      End;
End;

Function VALOR_PRODUTO(M_CDPROD : String) : Double;
Begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select PRO_VLVENDA from PRODUTOS');
           SQL.Add('Where (PRO_CODIGO = :pCODIGO)');
           Params.ParamByName('pCODIGO').AsString := M_CDPROD;
           Open;
           //
           If not (IsEmpty) Then
              result := FieldByName('PRO_VLVENDA').AsCurrency;
           //
           Close;
      End;
End;

Function NOME_FORNECEDOR(M_CDPROD : String) : String;
Var
    M_CDFORN : Integer;
Begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select FOR_CODIGO from PRODUTOS');
           SQL.Add('Where (PRO_CODIGO = :pCODIGO)');
           Params.ParamByName('pCODIGO').AsString := M_CDPROD;
           Open;
           //
           If not (IsEmpty) Then
            begin
                 M_CDFORN := FieldByName('FOR_CODIGO').AsInteger;
                 //
                 SQL.Clear;
                 Close;
                 SQL.Add('Select FOR_FANTASIA from FORNECEDORES');
                 SQL.Add('Where (FOR_CODIGO = :pCODIGO)');
                 Params.ParamByName('pCODIGO').AsInteger := M_CDFORN;
                 Open;
                 //
                 If not (IsEmpty) Then
                    result := FieldByName('FOR_FANTASIA').AsString
                 Else
                    result := 'SEM FORNECEDOR';
            End;
           //
           Close;
      End;
End;

Function NOME_SECAO(M_CDPROD : String) : String;
Var
    M_CDSECAO : Integer;
Begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select P.PRO_CODIGO, P.SEC_CODIGO, S.SEC_DESCRICAO from PRODUTOS P ');
           SQL.Add('INNER join SECAO S ON P.SEC_CODIGO = S.SEC_CODIGO ');
           SQL.Add('Where (P.PRO_CODIGO = :pCODIGO)');
           Params.ParamByName('pCODIGO').AsString := M_CDPROD;
           Open;
           //
           If not (IsEmpty) Then
            begin
                 //
                 If not (IsEmpty) Then
                    result := FieldByName('SEC_DESCRICAO').AsString
                 Else
                    result := 'SEM SEÇÃO';
            End;
           //
           Close;
      End;
End;

Function NOME_CAIXA(M_CDCAIX : Integer) : String;
begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select SEN_NOME from  USUARIOS');
           SQL.Add('Where (SEN_CODIGO = :pCODIGO)');
           Params.ParamByName('pCODIGO').AsInteger := M_CDCAIX;
           Open;
           //
           If not (IsEmpty) Then
              result := FieldByName('SEN_NOME').AsString;
           //
           Close;
      End;
End;

// Retorna o nome do computador
Function NomeMaquina : String;
var
    lpBuffer : PChar;
    nSize : DWord;
    const Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
     try
          nSize := Buff_Size;
          lpBuffer := StrAlloc(Buff_Size);
          GetComputerName(lpBuffer,nSize);
          Result := String(lpBuffer);
          StrDispose(lpBuffer);
     except
          Result := '';
     end;
end;


Function VENDA(M_TOTVEN, M_VLDESC, M_VLACRE : Double; M_CDLOJA, M_CDCAIX, M_IMPRES, M_CDCLIE, M_CDTABE, M_CDVEND : Integer;
M_DTVEND : TDate; M_NMCLIE, M_HOVEND, M_JANVEN, aTipoFrete : String;  fPercFrete : Double; iTransportadora, iPlano, iModalidade : Integer;
txtObservacao, txtObs2, txtObs3, iMesa, aFLTAXA : String; fValorTaxa : Double) : Boolean;
Var
   W_NRVEND, M_CAMINH, M_NMVEND : String;
   M_VLDIGI, M_TOENTR, M_TOVEND : Real;
   //M_CDVEND : Integer;
   M_FLSUPE : Boolean;
   M_VLREAL, M_VLPERC  : Double;
   M_FLIMPR, W_TOTAPC : Integer;
   //
   M_TPACDE, W_NRSEQU : String;
   M_FLTROC, M_FLOTEF : Boolean;
   M_FMPGTO ,M_OPTEF, M_CDMODA, M_NMMODA, M_HOMOVI :String;
   M_VLMODA, M_VLVEND : Real;
   M_DTMOVI : TDate;
   M_VLCOMP, M_VLCUST, M_VLVENDPRO : Real;
   M_CDNATU, M_QTPARC : Integer;
   M_QTANTE, M_QTATUA, M_VLTROC, M_VLENTR, M_MDAPRA : Double;
   M_TPMOVI, M_MSCUPO, W_FLVEND, M_CDPROD : String;
   M_SEQREC, iRetorno : Integer;
   TD : TTransactionDesc;
   M_FLVEND : boolean;
begin
       result := false;
       dm.parametros;
       M_MSCUPO := dm.CdsConfig.FieldByName('CFG_MENSAGEM_CUPOM').AsString;
       M_FLTROC := False;
       M_FLOTEF := False;
       //
       M_TPMOVI := 'V';
       M_VLTROC := 0;
       M_VLVEND := M_TOTVEN;
       M_TOVEND := M_VLVEND;
       //
       M_VLENTR := 0;
       M_MDAPRA := 0;
       //
       M_VLMODA := 0.0;
       M_TOENTR := 0.0;
       W_FLVEND := 'N';
       // testa se os valores das modalidades são maiores que zero
           dmConsultas.cdsModalidade.open;
           dmConsultas.cdsModalidade.First;
           dmConsultas.cdsModalidade.DisableControls;
           //
           While not (dmConsultas.cdsModalidade.Eof) do
           begin
                dmConsultas.cdsModalidade.Edit;
                M_TOENTR := M_TOENTR+dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
                // proximo
                dmConsultas.cdsModalidade.Next;
           End;
           //
           dmConsultas.cdsModalidade.EnableControls;
           //                        M_VLVEND
           If (Arredondar(M_TOENTR,2) < Arredondar(M_TOVEND,2)) Then
           begin
                Application.MessageBox('O valor de entrada menor que'+#13
                                  +'o valor Total da Venda.','ATENÇÃO', MB_OK+MB_ICONSTOP);
                dmConsultas.cdsModalidade.First;
                uDM.M_NRMENS := 1;
                exit;                     // sair da procedure.
           end;
       // testa se modalidades é parcelada
       dmConsultas.cdsModalidade.First;
       dmConsultas.cdsModalidade.DisableControls;
       //
       While not (dmConsultas.cdsModalidade.Eof) do
       begin
            dmConsultas.cdsModalidade.Edit;
            If (dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency > 0)
              AND (dmConsultas.cdsModalidade.FieldByName('MOD_FLFIXA').AsString <> 'D')
              and (dmConsultas.cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger > 0) Then
            begin
                 M_MDAPRA := M_MDAPRA + dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
                 W_TOTAPC := dmConsultas.cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger;
                 //
                 criar_parcelas(W_TOTAPC);
                 Application.CreateForm(TfrmParcelas, frmParcelas);
                 with frmParcelas do
                    try
                         ufrmParcelas.M_CDMODA := dmConsultas.cdsModalidade.FieldByName('MOD_CODIGO').AsInteger;
                         ufrmParcelas.M_TOMODA := dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
                         ufrmParcelas.M_TPMODA := dmConsultas.cdsModalidade.FieldByName('MOD_FLFIXA').AsString;
                         lbl_NMMODA.Caption    := dmConsultas.cdsModalidade.FieldByName('MOD_NOME').AsString;
                         lbl_VLTOTAL.Caption   := FormatFloat('###,###,##0.#0',dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency);
                         If (ufrmParcelas.M_TPMODA = 'P') AND (M_CDCLIE >0 ) Then
                         begin
                              edtCDCLIE.Text := InttoStr(M_CDCLIE);
                              edtNMCLIE.Text := uFuncoes.NOME_CLIENTE(M_CDCLIE);
                         End;
                         showmodal;
                    finally
                         If not Empty(edtCDCLIE.Text) Then
                            M_CDCLIE := StrtoInt(edtCDCLIE.Text);
                         free;
                    end;
            End;
            // proximo
            dmConsultas.cdsModalidade.Next;
       End;
       //
       dmConsultas.cdsModalidade.EnableControls;
       //                        M_VLVEND
       If (Arredondar(M_TOENTR,2) < Arredondar(M_TOVEND,2)) Then
       begin
            Application.MessageBox('O valor de entrada menor que'+#13
                                  +'o valor Total da Venda.','ATENÇÃO', MB_OK+MB_ICONSTOP);
            dmConsultas.cdsModalidade.First;
            uDM.M_NRMENS := 1;
            exit;                     // sair da procedure.
       end;
       // Inicia um transação no BD
       TD.TransactionID  := M_CDCAIX;
       TD.IsolationLevel := xilREADCOMMITTED;
       Dm.SqlAdmin.StartTransaction(TD);
       //
       Try
           // Inicia o fechamento do cupom com o uso das formas de pagamento.
           M_DTMOVI := M_DTVEND;
           M_HOMOVI := M_HOVEND;
           // Fechamento de cupom
           iRetorno := uFiscal.FISCAL('TotalCupom', M_IMPRES,
                              'D',
                              '$',
                              FormatFloat('###,##0.#0', M_VLDESC));
           If (iRetorno = 1) Then
               begin
                    dmConsultas.cdsModalidade.DisableControls;
                    dmConsultas.cdsModalidade.First;
                    While not (dmConsultas.cdsModalidade.Eof) do
                    begin
                        If (dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency > 0) Then
                           begin
                                M_CDMODA := dmConsultas.cdsModalidade.FieldByName('MOD_CODIGO').AsString;
                                M_NMMODA := dmConsultas.cdsModalidade.FieldByName('MOD_NOME').AsString;
                                M_VLMODA := dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
                                //  Formas de Pagamento
                                If (M_VLMODA > 0.0) Then
                                    uFiscal.FISCAL('Pagamento', M_IMPRES,
                                                   M_NMMODA,
                                                   FormatFloat('###,##0.#0',M_VLMODA));
                           End;
                         //
                        dmConsultas.cdsModalidade.Next;
                   End;
               End;
           //
           iRetorno := uFiscal.FISCAL('FecharCupom',M_IMPRES,
                                      M_MSCUPO);
           //
           If (iRetorno = 1) Then
             Begin
                  With dmConsultas.cdsCaixa2 do
                  Begin
                       Close;
                       Params.ParamByName('pCAIXA').AsInteger   := M_CDCAIX;
                       Params.ParamByName('pSITUACAO').AsString := 'A';
                       Open;
                  End;
                  //   aqui
                  If not (dmConsultas.cdsCaixa2.IsEmpty) Then
                       M_CDLOJA := dmConsultas.cdsCaixa2.FieldByname('CAI_LOJA').AsInteger;
                  //
                  dm.parametros;
                  //
                  While (W_FLVEND = 'N') do
                  Begin
                    Dm.CdsConfig.edit;
                    Dm.CdsConfig.FieldByName('CFG_VENDA').AsFloat     :=
                         Dm.CdsConfig.FieldByName('CFG_VENDA').AsFloat + 1;
                    Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat :=
                         Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat+1;
                    M_CDNATU := Dm.CdsConfig.FieldByName('CFG_NATUREZAVENDA').AsInteger;
                    W_NRVEND := uFuncoes.StrZero(FloattoStr(Dm.CdsConfig.FieldByName('CFG_VENDA').AsFloat),7);
                    W_NRSEQU := uFuncoes.StrZero(FloattoStr(Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat),10);
                    Dm.CdsConfig.Post;
                    Dm.CdsConfig.ApplyUpdates(0);
                    //
                    //M_TOVEND := StrtoFloat(txtTOVEND.Caption);
                    M_VLTROC := M_TOENTR-M_TOVEND;
                    // Tabela Vendas
                    Dm.cdsmovimento.Close;
                    With Dm.dstMovimento do
                    Begin
                       Active := False;
                       CommandText := 'Select * from VENDAS Where (MOV_PEDIDO = :pPEDIDO)';
                       Params.ParamByName('pPEDIDO').AsInteger := StrtoInt(W_NRVEND);
                       Active := True;
                    End;
                    Dm.cdsmovimento.Open;
                     // Novo registro de Venda
                    If (Dm.cdsMovimento.IsEmpty) Then
                         W_FLVEND := 'S'
                    Else
                         W_FLVEND := 'N';
                    //
                  End;  // fim-do-enquanto
                  //
                  Seleciona_Cliente(M_CDCLIE);
                  // Novo 10/01/2008
                  M_VLENTR := M_TOVEND - M_MDAPRA;
                  //
                  {If (aFLTAXA = 'S') Then
                      M_TOVEND := M_TOVEND + Arredondar(Gerapercentual(M_TOVEND, Dm.CdsConfigCFG_TAXA_SERVICO.AsFloat),2);}
                  //
                    With Dm.cdsMovimento do
                    Begin
                       Append;
                       FieldByName('MOV_PEDIDO').AsInteger     := StrtoInt(W_NRVEND);
                       //FieldByName('MOV_CUPOM').AsInteger  := M_NRCUPO;
                       FieldByName('MOV_LOJA').AsInteger       := M_CDLOJA;
                       FieldByName('MOV_SEQUENCIA').AsInteger  := StrtoInt(W_NRSEQU);
                       FieldByName('MOV_DATAVENDA').AsDateTime := M_DTMOVI;
                       FieldByName('MOV_HORAVENDA').AsString   := M_HOMOVI;
                       FieldByName('MOV_VALOR').AsCurrency     := M_TOVEND;
                       FieldByName('MOV_TROCO').AsCurrency     := M_VLTROC;
                       FieldByName('MOV_SITUACAO').AsString    := 'F';
                       FieldByName('MOV_VENDEDOR').AsInteger   := M_CDVEND;
                       FieldByName('MOV_DESCONTO').AsCurrency  := M_VLDESC;
                       FieldByName('MOV_ACRESCIMO').AsFloat    := M_VLACRE;
                       FieldByName('MOV_CLIENTE').AsInteger    := M_CDCLIE;
                       FieldByName('MOV_NOMECLIENTE').AsString := M_NMCLIE;
                       FieldByName('MOV_TABELA').AsInteger     := M_CDTABE;
                       // Nova 10/01/2008
                       FieldByName('MOV_ENTRADA').AsFloat := M_VLENTR;
                       //
                       if (Dm.CdsConfigCFG_FLVENDEDOR_ITEM_VENDA.AsString = 'N') Then
                       begin
                             FieldByName('DOM_ENDERECO').AsString    := Dm.CdsClientesCLI_ENDERECO.AsString;
                             FieldByName('DOM_NUMERO').AsInteger     := Dm.CdsClientesCLI_NUMERO.AsInteger;
                             FieldByName('DOM_BAIRRO').AsString      := Dm.CdsClientesBAI_NOME.AsString;
                             FieldByName('DOM_CIDADE').AsString      := GetCidade(Dm.CdsClientesCID_CODIGO.AsInteger);
                       End
                       Else
                       begin
                             If not uFuncoes.Empty(dmDados.cdsPreVenda.FieldByName('PRV_NOMECLIENTE').AsString) Then
                                 FieldByName('MOV_NOMECLIENTE').AsString := dmDados.cdsPreVenda.FieldByName('PRV_NOMECLIENTE').AsString
                             Else
                                 FieldByName('MOV_NOMECLIENTE').AsString := M_NMCLIE;
                             FieldByName('DOM_NRFONE').AsString   := dmDados.cdsPreVenda.FieldByName('DOM_NRFONE').AsString;
                             FieldByName('DOM_ENDERECO').AsString := dmDados.cdsPreVenda.FieldByName('DOM_ENDERECO').AsString;
                             if not uFuncoes.Empty(dmDados.cdsPreVenda.FieldByName('DOM_NUMERO').AsString)
                                and (dmDados.cdsPreVenda.FieldByName('DOM_NUMERO').AsInteger > 0) Then
                                 FieldByName('DOM_NUMERO').AsInteger  := dmDados.cdsPreVenda.FieldByName('DOM_NUMERO').AsInteger;
                             FieldByName('DOM_BAIRRO').AsString   := dmDados.cdsPreVenda.FieldByName('DOM_BAIRRO').AsString;
                             FieldByName('DOM_CIDADE').AsString   := dmDados.cdsPreVenda.FieldByName('DOM_CIDADE').AsString;
                             FieldByName('DOM_REFERE').AsString   := dmDados.cdsPreVenda.FieldByName('DOM_REFERE').AsString;
                             FieldByName('DOM_COMPLEMENTO').AsString := dmDados.cdsPreVenda.FieldByName('DOM_COMPLEMENTO').AsString; 
                       End;
                       //
                       FieldByName('MOV_TIPO_FRETE').AsString  := aTipoFrete;
                       FieldByName('MOV_PERC_FRETE').AsFloat   := fPercFrete;
                       FieldByName('MOV_IDTRANSPORTADORA').AsInteger := iTransportadora;
                       FieldByName('MOV_TABELA_PLANO').AsInteger := iPlano;
                       FieldByName('MOV_OBSERVACAO').AsString  := txtObservacao;
                       FieldByName('MOV_MODALIDADE_PEDIDO').AsInteger   := iModalidade;
                       FieldByName('MOV_OBS1').AsString := txtObs2;
                       FieldByName('MOV_OBS2').AsString := txtObs3;
                       FieldByName('MOV_NRMESA').AsString := iMesa;
                       If (aFLTAXA = 'S') Then
                           FieldByName('MOV_TAXA_SERVICO').AsFloat := fValorTaxa
                           //Dm.CdsConfigCFG_TAXA_SERVICO.AsFloat
                       Else
                           FieldByName('MOV_TAXA_SERVICO').AsFloat := 0;
                       // Grava registro
                       Post;
                       ApplyUpdates(0);
                    End;
                    //
                    Dm.cdsItensVendas.DisableControls;
                    Dm.cdsItensVendas.First;
                    While not (Dm.cdsItensVendas.Eof) do
                    Begin
                      If (Dm.cdsItensVendas.FieldByName('ITE_FLCANC').AsString <> 'C') Then
                      Begin
                       // Tabela movimento produto
                       With dmConsultas.qryIncluir do
                       Begin
                            SQL.Clear;
                            Close;
                            SQL.Add('INSERT INTO PROVENDAS (MOP_PEDIDO, MOP_NRITEM, MOP_PRODUTO, MOP_QUANTIDADE, ');
                            SQL.Add('MOP_UNIDADE, MOP_VALOR, MOP_DESCONTO, MOP_CUSTO, MOP_COMPRA, MOP_CODCOR, MOP_VALIPI, MOP_CDVENDEDOR)');
                            SQL.Add('VALUES (:pPEDIDO, :pNRITEM, :pPRODUTO, :pQUANTIDADE, ');
                            SQL.Add(':pUNIDADE, :pVALOR, :pDESCONTO, :pCUSTO, :pCOMPRA, :pCODCOR, :pVALIPI, :pCDVENDEDOR)');
                            //
                            Params.ParamByName('pPEDIDO').AsInteger  := StrtoInt(W_NRVEND);
                            Params.ParamByName('pNRITEM').AsInteger  := Dm.cdsItensVendas.FieldByName('ITE_NRITEN').AsInteger;
                            Params.ParamByName('pPRODUTO').AsString  := Dm.cdsItensVendas.FieldByName('ITE_CDITEN').AsString;
                            Params.ParamByName('pQUANTIDADE').AsFloat := Dm.cdsItensVendas.FieldByName('ITE_QTITEN').AsFloat;
                            Params.ParamByName('pUNIDADE').AsString   := Dm.cdsItensVendas.FieldByName('ITE_CDUNID').AsString;
                            Params.ParamByName('pVALOR').AsCurrency   := Dm.cdsItensVendas.FieldByName('ITE_VLUNIT').AsCurrency;
                            Params.ParamByName('pDESCONTO').AsCurrency := Dm.cdsItensVendas.FieldByName('ITE_VLDESC').AsFloat;
                            Params.ParamByName('pCUSTO').AsCurrency   := Dm.cdsItensVendas.FieldByName('ITE_VLCOMP').AsCurrency;
                            Params.ParamByName('pCOMPRA').AsCurrency  := Dm.cdsItensVendas.FieldByName('ITE_VLCUST').AsCurrency;
                            Params.ParamByName('pCODCOR').AsInteger   := Dm.cdsItensVendas.FieldByName('ITE_CODCOR').AsInteger;
                            Params.ParamByName('pVALIPI').AsFloat     := Dm.cdsItensVendas.FieldByName('ITE_VALIPI').AsFloat;
                            Params.ParamByName('pCDVENDEDOR').AsInteger := Dm.cdsItensVendas.FieldByName('ITE_VENDEDOR').AsInteger;
                            //
                            ExecSQL();
                       End;
                       //  Tabela de estoque
                       Dm.cdsEstoque.Close;
                       With Dm.dstEstoque do
                       Begin
                            Active := False;
                            CommandText := 'Select * from ESTOQUE Where (EST_CODIGOLOJA = :pCODIGOLOJA) and (PRO_CODIGO = :pCODIGO)';
                            //
                            Params.ParamByName('pCODIGOLOJA').AsInteger := M_CDLOJA;
                            // Alteração nova
                            If uFuncoes.Empty(Dm.cdsItensVendas.FieldByName('ITE_CDBAIX').AsString) Then
                                Params.ParamByName('pCODIGO').AsString := Dm.cdsItensVendas.FieldByName('ITE_CDITEN').AsString
                            Else
                                Params.ParamByName('pCODIGO').AsString := Dm.cdsItensVendas.FieldByName('ITE_CDBAIX').AsString;
                            Active := True;
                       End;
                       Dm.cdsEstoque.Open;
                       // Tabela de Estoque
                       M_QTANTE := 0;
                       If (Dm.cdsEstoque.IsEmpty) Then  // Se não encontrar
                       begin
                         If not (dmConsultas.GetProduto(Dm.cdsItensVendas.FieldByName('ITE_CDITEN').AsString)) Then
                          begin

                            Dm.cdsEstoque.Append;
                            Dm.cdsEstoque.FieldByName('EST_CODIGOLOJA').AsInteger := M_CDLOJA;
                            // Nova alteração
                            If uFuncoes.Empty(Dm.cdsItensVendas.FieldByName('ITE_CDBAIX').AsString) Then
                                Dm.cdsEstoque.FieldByName('PRO_CODIGO').AsString := Dm.cdsItensVendas.FieldByName('ITE_CDITEN').AsString
                            Else
                                Dm.cdsEstoque.FieldByName('PRO_CODIGO').AsString := Dm.cdsItensVendas.FieldByName('ITE_CDBAIX').AsString;
                            Dm.cdsEstoque.FieldByName('UNI_CODIGO').AsString := Dm.cdsItensVendas.FieldByName('ITE_CDUNID').AsString;
                            Dm.cdsEstoque.FieldByName('EST_DTSAIDA').AsDateTime := M_DTMOVI;
                            Dm.cdsEstoque.FieldByName('EST_QUANTSAIDA').AsFloat := Dm.cdsItensVendas.FieldByName('ITE_QTITEN').AsFloat;
                            Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat :=
                                 Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat - Dm.cdsItensVendas.FieldByName('ITE_QTITEN').AsFloat;
                            M_QTATUA := Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                            Dm.cdsEstoque.Post;
                            Dm.cdsEstoque.ApplyUpdates(0);
                          End;
                       End
                       Else
                       Begin
                            Dm.cdsEstoque.Edit;
                            //
                            M_QTANTE := Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                            //
                            Dm.cdsEstoque.FieldByName('EST_DTSAIDA').AsDateTime := M_DTMOVI;
                            Dm.cdsEstoque.FieldByName('EST_QUANTSAIDA').AsFloat := Dm.cdsItensVendas.FieldByName('ITE_QTITEN').AsFloat;
                            Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat :=
                                    Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat - Dm.cdsItensVendas.FieldByName('ITE_QTITEN').AsFloat;
                            M_QTATUA := Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                            Dm.cdsEstoque.Post;
                            Dm.cdsEstoque.ApplyUpdates(0);
                       End;
                       // Tabela de historico
                       Dm.cdsHistorico.Close;
                       With Dm.dstHistorico do
                       Begin
                            Active := False;
                            CommandText := 'Select * from HISTORICO Where (HIS_SEQUENCIA = :pSEQUENCIA) '
                                          +' and (HIS_LOJA = :pLOJA) AND (HIS_PRODUTO =  :pPRODUTO) ';
                            Params.ParamByName('pSEQUENCIA').AsInteger := StrtoInt(W_NRSEQU);
                            Params.ParamByName('pLOJA').AsInteger      := M_CDLOJA;
                            Params.ParamByName('pPRODUTO').AsString    := Dm.cdsItensVendas.FieldByName('ITE_CDITEN').AsString;
                            Active := True;
                       End;
                       Dm.cdsHistorico.Open;
                       //
                       With dmConsultas.cdsProdutos2 do
                       Begin
                            Active := False;
                            CommandText := 'Select PRO_CODIGO, PRO_VLCOMPRA, PRO_VLCUSTO, PRO_VLVENDA ';
                            CommandText := CommandText + 'from PRODUTOS Where (PRO_CODIGO = :pCODIGO) ';
                            Params.ParamByName('pCODIGO').AsString := Dm.cdsItensVendas.FieldByName('ITE_CDITEN').AsString;
                            Active := True;
                       End;
                       //
                       If not (dmConsultas.cdsProdutos2.IsEmpty) Then
                       Begin
                            M_VLCOMP     := dmConsultas.cdsProdutos2.FieldByName('PRO_VLCOMPRA').AsCurrency;
                            M_VLCUST     := dmConsultas.cdsProdutos2.FieldByName('PRO_VLCUSTO').AsCurrency;
                            M_VLVENDPRO  := Dm.cdsItensVendas.FieldByName('ITE_VLUNIT').AsCurrency;
                            // dmConsultas.cdsProdutos2.FieldByName('PRO_VLVENDA').AsCurrency;
                       End;
                       //
                       With Dm.cdsHistorico do
                       Begin
                             Append;
                             FieldByName('HIS_SEQUENCIA').AsInteger := StrtoInt(W_NRSEQU);
                             FieldByName('HIS_LOJA').AsInteger      := M_CDLOJA;
                             FieldByName('HIS_PRODUTO').AsString    := Dm.cdsItensVendas.FieldByName('ITE_CDITEN').AsString;
                             FieldByName('HIS_UNIDADE').AsString    := Dm.cdsItensVendas.FieldByName('ITE_CDUNID').AsString;
                             FieldByName('HIS_DATA').AsDateTime     := M_DTMOVI;
                             FieldByName('HIS_HORA').AsString       := M_HOMOVI;
                             FieldByName('HIS_TIPO').AsString       := 'V';
                             FieldByName('HIS_DOCUMENTO').AsInteger := StrtoInt(W_NRVEND);
                             FieldByName('HIS_ANTERIOR').AsFloat    := M_QTANTE;
                             FieldByName('HIS_MOVIMENTO').AsFloat   := Dm.cdsItensVendas.FieldByName('ITE_QTITEN').AsFloat;
                             FieldByName('HIS_VLCUSTO').AsCurrency  := M_VLCUST;
                             FieldByName('HIS_VLCOMPRA').AsCurrency := M_VLCOMP;
                             FieldByName('HIS_VLVENDA').AsCurrency  := M_VLVENDPRO;
                             FieldByName('HIS_ATUAL').AsFloat       := M_QTATUA;
                             FieldByName('HIS_USUARIO').AsInteger   := M_CDCAIX;
                             // nova alteração
                             If not uFuncoes.Empty(Dm.cdsItensVendas.FieldByName('ITE_CDBAIX').AsString) Then
                                 FieldByName('HIS_CODIGOBAIXA').AsString := Dm.cdsItensVendas.FieldByName('ITE_CDBAIX').AsString
                             Else
                                 FieldByName('HIS_CODIGOBAIXA').AsString := Dm.cdsItensVendas.FieldByName('ITE_CDITEN').AsString;
                             // novo 04/01/2008
                             If not Empty(Dm.cdsItensVendas.FieldByName('ITE_VENDEDOR').AsString) Then
                                FieldByName('HIS_VENDEDOR').AsInteger := Dm.cdsItensVendas.FieldByName('ITE_VENDEDOR').AsInteger; 
                             Post;
                             ApplyUpdates(0);
                       End;
                      End;  // se produto não foi cancelado
                      // Lote
                      // nova alteração
                      If uFuncoes.Empty(Dm.cdsItensVendas.FieldByName('ITE_CDBAIX').AsString) Then
                          M_CDPROD := Dm.cdsItensVendas.FieldByName('ITE_CDITEN').AsString
                      Else
                          M_CDPROD := Dm.cdsItensVendas.FieldByName('ITE_CDBAIX').AsString;
                      //
                      If not uFuncoes.Empty(Dm.cdsItensVendas.FieldByName('ITE_NRLOTE').AsString)
                       AND (Dm.cdsItensVendas.FieldByName('ITE_FLCANC').AsString <> 'C') Then
                      begin
                         dm2.cdsLotes.Close;
                         With dm2.dstLotes do
                         begin
                            Active := False;
                            CommandText := 'Select * from LOTES Where (LOT_NRLOTE = :pLOTE) and (LOT_PROCODIGO = :pCODIGO)';
                            Params.ParamByName('pLOTE').AsString   := Dm.cdsItensVendas.FieldByName('ITE_NRLOTE').AsString;
                            Params.ParamByName('pCODIGO').AsString := M_CDPROD;
                            Active := True;
                         End;
                         dm2.cdsLotes.Open;
                         //
                         If not (dm2.cdsLotes.IsEmpty) Then
                         begin
                            With dm2.cdsLotes do
                            Begin
                                 Edit;
                                 FieldByName('LOT_QUANTIDADE').AsFloat  := FieldByName('LOT_QUANTIDADE').AsFloat
                                                      - Dm.cdsItensVendas.FieldByName('ITE_QTITEN').AsFloat;
                                 //
                                 Post;
                                 ApplyUpdates(0);
                            End;
                         End;
                      End;
                       // Proximo
                       Dm.cdsItensVendas.Next;
                   End;
                   Dm.cdsItensVendas.EnableControls;
                   //
                   dmConsultas.cdsModalidade.DisableControls;
                   dmConsultas.cdsModalidade.First;
                   While not (dmConsultas.cdsModalidade.Eof) do
                   begin
                       If (dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency > 0) Then
                       begin
                           M_CDMODA := dmConsultas.cdsModalidade.FieldByName('MOD_CODIGO').AsString;
                           M_NMMODA := dmConsultas.cdsModalidade.FieldByName('MOD_NOME').AsString;
                           M_VLMODA := dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
                           // Grava dados no BD.
                           If (M_VLMODA > 0.0) Then
                           begin
                                dm.cdsMovimentoCaixa.Close;
                                With dm.dstMovimentoCaixa do
                                Begin
                                     Active := False;
                                     CommandText := 'Select * from MOVIMENTO_CAIXA '+
                                                    'Where (MCA_SEQUENCIA = :pSEQUENCIA) and (MCA_MODALIDADE = :pMODALIDADE)';
                                     Params.ParamByName('pSEQUENCIA').AsInteger := StrtoInt(W_NRSEQU);
                                     Params.ParamByName('pMODALIDADE').AsString := M_CDMODA;
                                     Active := True;
                                End;
                                dm.cdsMovimentoCaixa.Open;
                                //  Movimento de Caixa
                                With dm.cdsMovimentoCaixa do
                                Begin
                                     Append;
                                     FieldByName('MCA_SEQUENCIA').AsInteger := StrtoInt(W_NRSEQU);
                                     FieldByName('MCA_LOJA').AsInteger      := M_CDLOJA;
                                     FieldByName('MCA_VENDA').AsInteger     := StrtoInt(W_NRVEND);
                                     FieldByName('MCA_TIPOMOV').AsString    := 'V';
                                     FieldByName('MCA_DTMOVIMENTO').AsDateTime := M_DTMOVI;
                                     FieldByName('MCA_HRMOVIMENTO').AsString   := M_HOMOVI;
                                     FieldByName('MCA_MODALIDADE').AsString := M_CDMODA;
                                     FieldByName('MCA_VLMODALIDADE').AsCurrency := M_VLMODA;
                                     FieldByName('MCA_TOVENDA').AsCurrency  := M_TOVEND;
                                     If (dmConsultas.cdsModalidade.FieldByName('MOD_FLFIXA').AsString = 'D') Then
                                         FieldByName('MCA_VLTROCO').AsCurrency  := M_VLTROC
                                     Else
                                         FieldByName('MCA_VLTROCO').AsCurrency  := 0;
                                     FieldByName('MCA_SITUACAO').AsString   := 'N';
                                     FieldByName('MCA_CAIXA').AsInteger     := M_CDCAIX;
                                     FieldByName('MCA_NATUREZA').AsInteger  := M_CDNATU;
                                     Post;
                                     ApplyUpdates(0);
                                End;
                                //
                                If (dmConsultas.cdsModalidade.FieldByName('MOD_FLFIXA').AsString <> 'D')
                                    and (dmConsultas.cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger > 0) Then
                                begin
                                     dm.parametros;
                                     dm.CdsConfig.Edit;
                                     dm.CdsConfigCFG_CREDITO.AsInteger := dm.CdsConfigCFG_CREDITO.AsInteger + 1;
                                     dm.CdsConfig.Post;
                                     dm.CdsConfig.ApplyUpdates(0);
                                     //
                                     DM2.cdsContasReceber.Close;
                                     With dm2.dstContasReceber do
                                     Begin
                                          Active := False;
                                          CommandText := 'Select * from CONTASRECEBER Where (REC_CREDITO = :pCREDITO)'
                                                 +' and (REC_LOJA = :pLOJA) ';
                                          Params.ParamByName('pCREDITO').AsInteger := dm.CdsConfigCFG_CREDITO.AsInteger;
                                          Params.ParamByName('pLOJA').AsInteger    := M_CDLOJA;
                                          Active := True;
                                     End;
                                     //
                                     DM2.cdsContasReceber.FetchParams;
                                     DM2.cdsContasReceber.Open;
                                     //
                                     If (DM2.cdsContasReceber.IsEmpty) then
                                     Begin
                                       M_QTPARC := 1;
                                       dm2.cdsParcelasVenda.First;
                                       While not (dm2.cdsParcelasVenda.Eof) do
                                       //While M_QTPARC <= cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger do
                                       Begin
                                         //
                                         If (dm2.cdsParcelasVenda.FieldByName('PAR_MODALIDADE').AsInteger =
                                             dmConsultas.cdsModalidade.FieldByName('MOD_CODIGO').AsInteger) Then
                                         begin
                                                  //
                                                  dm.CdsConfig.Edit;
                                                  dm.CdsConfigCFG_SEQRECEBER.Value    := dm.CdsConfigCFG_SEQRECEBER.Value+1;
                                                  M_SEQREC := dm.CdsConfigCFG_SEQRECEBER.AsInteger;
                                                         dm.CdsConfig.ApplyUpdates(0);
                                                  //
                                                  dm2.cdsContasReceber.Append;
                                                  dm2.cdsContasReceber.FieldByName('REC_SEQUENCIA').AsInteger  := M_SEQREC;
                                                  DM2.cdsContasReceber.FieldByName('REC_LOJA').AsInteger       := M_CDLOJA;
                                                  DM2.cdsContasReceber.FieldByName('REC_CREDITO').AsInteger    := dm.CdsConfigCFG_CREDITO.AsInteger;
                                                  dm2.cdsContasReceber.FieldByName('REC_PARCELA').AsInteger    := dm2.cdsParcelasVenda.FieldByName('PAR_NRPARCELA').AsInteger;
                                                  dm2.cdsContasReceber.FieldByName('REC_QTPARCELAS').AsInteger := dmConsultas.cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger;
                                                  DM2.cdsContasReceber.FieldByName('REC_CLIENTE').AsInteger    := M_CDCLIE;
                                                  DM2.cdsContasReceber.FieldByName('REC_NRVENDA').AsInteger    := StrtoInt(W_NRVEND);
                                                  DM2.cdsContasReceber.FieldByName('REC_DESCRICAO').AsString   := 'VENDA A PRESTAÇÃO';
                                                  DM2.cdsContasReceber.FieldByName('REC_VALORPARCELA').AsCurrency := dm2.cdsParcelasVenda.FieldByName('PAR_VALOR').AsCurrency;
                                                  DM2.cdsContasReceber.FieldByName('REC_VALORACRESIMO').AsFloat   := 0;
                                                  DM2.cdsContasReceber.FieldByName('REC_VALORJUROS').AsFloat      := 0;
                                                  DM2.cdsContasReceber.FieldByName('REC_VALORDESCONTO').AsFloat   := 0;
                                                  DM2.cdsContasReceber.FieldByName('REC_DATAEMISSAO').AsDateTime  := Date();
                                                  DM2.cdsContasReceber.FieldByName('REC_DATAVENCIMENTO').AsDateTime := dm2.cdsParcelasVenda.FieldByName('PAR_VENCIMENTO').AsDateTime;
                                                  DM2.cdsContasReceber.FieldByName('REC_BANCO').AsString          := dm2.cdsParcelasVenda.FieldByName('PAR_CDBANCO').AsString;
                                                  DM2.cdsContasReceber.FieldByName('REC_AGENCIA').AsString        := dm2.cdsParcelasVenda.FieldByName('PAR_AGENCIA').AsString;
                                                  DM2.cdsContasReceber.FieldByName('REC_NRCONTA').AsString        := dm2.cdsParcelasVenda.FieldByName('PAR_CONTA').AsString;
                                                  DM2.cdsContasReceber.FieldByName('REC_NRCHEQUE').AsString       := dm2.cdsParcelasVenda.FieldByName('PAR_CHEQUE').AsString;
                                                  DM2.cdsContasReceber.FieldByName('REC_SITUACAO').AsString       := 'A';
                                                  DM2.cdsContasReceber.FieldByName('REC_NATUREZA').AsInteger      := M_CDNATU;
                                                  DM2.cdsContasReceber.FieldByName('REC_USUARIO').AsInteger       := M_CDCAIX;
                                                  //
                                                  DM2.cdsContasReceber.Post;
                                                  M_QTPARC := M_QTPARC + 1;
                                         End;
                                         //Proximo
                                         dm2.cdsParcelasVenda.Next;
                                       End; // Fim_enquanto
                                       //
                                       DM2.cdsContasReceber.ApplyUpdates(0);
                                       //
                                     End;  // se-em-branco
                              End;  // Se-Fim M_FLFIXA
                           End;    // Se modalidade maior que Zero
                       End;          // Fim-do-retorno efetua Pagamento
                       // Próximo registro
                       dmConsultas.cdsModalidade.Next;
                   End;
                  //
                  dmConsultas.cdsModalidade.EnableControls;
                  M_FLVEND := False;
                 //
                 //MessageBox (Application.Handle, pChar('Venda N.º '+W_NRVEND +' concluida com sucesso.'),
                 Application.MessageBox(pChar('Venda realizada com sucesso.'),
                              'ATENÇÃO',MB_ICONINFORMATION+ MB_OK+MB_APPLMODAL);
                 // Grava
                 Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
                 //
                 If (M_IMPRES = 0) AND (dm.CdsConfigCFG_FLCUPOMVENDA.AsString = 'S' ) Then
                   If Application.MessageBox('Deseja imprimir cupom?',
                      'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
                           //NotaFiscalNova('TELA', M_HOVEND, M_JANVEN , M_CDLOJA, StrtoInt(W_NRVEND), M_CDCLIE, M_CDCAIX, M_NMCLIE, M_TOTVEN ,M_VLDESC, M_VLACRE, M_VLTROC);
                           Nota_Venda('TELA', M_HOVEND, M_JANVEN , M_CDLOJA, StrtoInt(W_NRVEND), M_CDCLIE, M_CDCAIX, M_NMCLIE, M_TOTVEN ,M_VLDESC, M_VLACRE, M_VLTROC);
                 //
                 result := true;
       End // Se iRetorno = 1
       Else
       Begin
              Application.MessageBox(PChar('Erro no fechamento da venda!!!'+#13'Verifique a impressora fiscal.')
                , 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              //  Cancelar transação no BD.
              Dm.SqlAdmin.Rollback(TD);
              //   
              Exit;
       End;
 Except
        on Exc:Exception do
        begin
              Application.MessageBox(PChar('Erro no fechamento de Venda N.º '+W_NRVEND+#13
                      + Exc.Message), 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              //  Cancelar transação no BD.
              Dm.SqlAdmin.Rollback(TD);
        End;
 End;
End;

procedure CRIAR_PARCELAS(M_QTPARC : Integer);
Var
    Cont : integer;
    M_TOMODA, M_VLPARC, M_VLDIFE, W_ULTIPC : Real;
begin
     M_VLPARC := 0;
     M_VLDIFE := 0;
     W_ULTIPC := 0;
     //
     If (dm2.cdsParcelas.Active = False) Then
         dm2.cdsParcelas.Open;
     //
     M_TOMODA := dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
     //M_VLPARC := uFuncoes.Arredondar(M_TOMODA/W_TOTAPC,2);
     M_VLPARC := uFuncoes.Arredondar(M_TOMODA/M_QTPARC,2);
     //
     M_VLDIFE := M_TOMODA-(M_VLPARC * M_QTPARC);
     //
     If (M_VLDIFE < M_TOMODA) Then
       W_ULTIPC := M_VLPARC+M_VLDIFE;
     //
     dm2.cdsParcelas.EmptyDataSet;
     //
     dm2.cdsParcelas.DisableControls;
     For Cont := 1 to M_QTPARC do
     Begin
          // Incluir
          dm2.cdsParcelas.Append;
          dm2.cdsParcelas.FieldByName('PAR_NRPARCELA').AsInteger   := Cont;
          dm2.cdsParcelas.FieldByName('PAR_VENCIMENTO').AsDateTime := IncMonth(Date,Cont);
          dm2.cdsParcelas.FieldByName('PAR_VALOR').AsCurrency      := M_VLPARC;
          //If (M_QTPARC <> W_TOTAPC) Then
          If (M_QTPARC <> Cont) Then
              dm2.cdsParcelas.FieldByName('PAR_VALOR').AsCurrency      := M_VLPARC
          Else
              dm2.cdsParcelas.FieldByName('PAR_VALOR').AsCurrency      := W_ULTIPC;
           //
          dm2.cdsParcelas.Post;
     End;
     //
     dm2.cdsParcelas.First;
     dm2.cdsParcelas.EnableControls;
end;

Procedure Nota_Venda(Local, W_HOVEND, W_JANVEN :string; W_CDLOJA, W_NRVEND, W_CDCLIE, M_CDCAIX : Integer; W_NMCLIE : String; M_TOVEND, M_VLDESC, W_VLACRE, M_VLTROC : Double);
var
    // Variável da classe TVDODmPrinter que fará o relatório
    VDOImpressora : TVDODmPrinter;
    Linha : string;
    LinCab1, LinCab2, M_ESPACO : String;
    M_NUMMES, M_QTCARA : Integer;
    M_UNIDAD, M_QUANT, M_NMDESC, M_VLUNIT, M_VALISS : String;
    LINHA1, VALOR : integer;
    //
    Data, W_CDITEN, W_NMDESC, W_MNMODA, W_FLCANC : String;
    W_UNITEN, M_CAMINHO, M_NMFILE, M_CAMINH : String;
    W_VLMODA, W_VLUNIT, W_VLSUBT : Real;
    W_QTITEN, M_SOMSUB : Double;
    M_NRITEM : Integer;
    M_POSINI : Integer;
Begin
    try
            VDOImpressora := TVDODmPrinter.Create(nil);
            VDOImpressora.Title := 'Visualizar Impressão';
            VDOImpressora.ShowPreview       := False;
            VDOImpressora.ShowProgress      := True;
            VDOImpressora.ShowDialog        := False;
            VDOImpressora.Font.Size         := fsCondensed;
            M_QTCARA := 159;
            //
            dm.CdsEmpresas.Close;
            With dm.SdsEmpresas do
               Begin
                         Active := False;
                         CommandText := 'SELECT * FROM EMPRESAS Where (EMP_CODIGO = :pCODIGO)';
                         Params.ParamByName('pCODIGO').AsInteger := W_CDLOJA;
                         Active := true;
               End;
            dm.CdsEmpresas.Open;
            //
            With VDOImpressora do
               Begin
                    BeginDoc;
                    //
                    Font.Size  := fsCondensed;
                    Font.Style := [];
                    NewLine();
                    //
                    M_POSINI := 0;
                    Data := Copy(DatetoStr(Date),1,3)+Copy(DatetoStr(Date),4,3)+Copy(DatetoStr(Date),7,4);
                    { Imprime e alinhado à esquerda dentro de uma área de 52 caracteres}
                    Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*',48 )]), True);
                    { Imprime a string "Cupom ", alinhado à esquerda"-" dentro de uma área de trita caracteres}
                    Print(M_POSINI, Format('%-48s',[uFuncoes.PadC('INFOG2 - CUPOM DE VENDA',48)]), True);
                    { Imprime e alinhado à esquerda dentro de uma área de 52 caracteres}
                    Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*',48 )]), true);
                    { Imprime o nome da Loja}
                    Print(M_POSINI, Format('%-48s',[uFuncoes.PadC('LOJA: '+dm.CdsEmpresas.FieldByName('EMP_FANTASIA').AsString,48)]), true);
                    Print(M_POSINI, Format('%-48s',[uFuncoes.PadC(dm.CdsEmpresas.FieldByName('EMP_ENDERECO').AsString,48)]), true);
                    { Imprime e alinhado à esquerda dentro de uma área de 52 caracteres}
                    Print(M_POSINI, Format('%-30s', [uFuncoes.Replicate('*',48 )]),true);
                    Print(M_POSINI, Format('%-30s', ['Nº. DA VENDA....: '+uFuncoes.StrZero(InttoStr(W_NRVEND),7)]),true);
                    Print(M_POSINI, Format('%-48s', ['CLIENTE.........: '+ W_NMCLIE]),true);
                    //  Writeln (Impressora,Format('%-30s', ['VENDEDOR........: '+M_NMVEND]));
                    Print(M_POSINI, Format('%-30s', ['CAIXA...........: '+uFuncoes.StrZero(InttoStr(M_CDCAIX),3)+ ' - '+UFrmAdmin.M_NMUSUA]),true);
                    { Imprime a Data de Emissão, baseada na data atual e salta para próxima linha}
                    Print(M_POSINI, Format('%-30s', ['DATA/HORA.......: '+Data+uFuncoes.Replicate(' ',10) + W_HOVEND]),true);
                    Print(M_POSINI, Format('%-30s', [uFuncoes.Replicate('*',48 )]),true);
                    Print(M_POSINI, Format('%-30s', ['ITEM CODIGO        DESCRICAO']),true);
                    Print(M_POSINI, Format('%-30s', ['QUANT.    UNIDADE    VALOR UNITARIO   SUB-TOTAL']),true);
                    Print(M_POSINI, Format('%-30s', [uFuncoes.Replicate('-',48 )]),true);
                    //
                    {----- Fase de Emissão dos Itens da Nota -----}
                    { Move o ponteiro para o primeiro registro}
                    If (W_JANVEN = '1') Then
                    begin
                      dm.cdsItensVendas.First;
                      M_NRITEM := 1;
                      M_SOMSUB := 0;
                      While not (dm.cdsItensVendas.Eof) do
                      Begin
                          // carrega os dados
                          W_CDITEN := dm.cdsItensVendas.FieldByName('ITE_CDITEN').AsString;
                          W_NMDESC := Copy(dm.cdsItensVendas.FieldByName('ITE_NMDESC').AsString,1,27);
                          W_QTITEN := dm.cdsItensVendas.FieldByName('ITE_QTITEN').AsCurrency;
                          W_UNITEN := dm.cdsItensVendas.FieldByName('ITE_CDUNID').AsString;
                          W_VLUNIT := dm.cdsItensVendas.FieldByName('ITE_VLUNIT').AsCurrency;
                          W_VLSUBT := dm.cdsItensVendas.FieldByName('ITE_VLSUBT').AsCurrency;
                          W_FLCANC := dm.cdsItensVendas.FieldByName('ITE_FLCANC').AsString;
                          //
                          //Write   (Impressora, Format('%-46s',  [uFuncoes.StrZero(InttoStr(M_NRITEM),3)+ '  ' + W_CDITEN + ' '+W_NMDESC]));
                          Print(M_POSINI, Format('%-46s',  [uFuncoes.StrZero(InttoStr(M_NRITEM),3)+ '  ' + W_CDITEN + ' '+W_NMDESC]) + Format('%2s',    [W_FLCANC]), true);
                          Print(M_POSINI, Format('%-12.3f', [W_QTITEN]) +
                                          Format('%-11s', [W_UNITEN])+
                                          Format('%12s',  [FormatFloat('###,###,##0.#0',W_VLUNIT)])+
                                          Format('%12s',  [FormatFloat('###,###,##0.#0',W_VLSUBT)]),true);
                          M_SOMSUB := M_SOMSUB + W_VLSUBT;
                          //
                          M_NRITEM := M_NRITEM + 1;
                          dm.cdsItensVendas.Next;
                      End;  // fim-do-enquanto
                   End
                   Else
                   begin
                    //
                    dmConsultas.cdsItensVendas.First;
                    M_NRITEM := 1;
                    While not (dmConsultas.cdsItensVendas.Eof) do
                    Begin
                         // carrega os dados
                         W_CDITEN := dmConsultas.cdsItensVendas.FieldByName('ITE_CDITEN').AsString;
                         W_NMDESC := Copy(dmConsultas.cdsItensVendas.FieldByName('ITE_NMDESC').AsString,1,27);
                         W_QTITEN := dmConsultas.cdsItensVendas.FieldByName('ITE_QTITEN').AsCurrency;
                         W_UNITEN := dmConsultas.cdsItensVendas.FieldByName('ITE_CDUNID').AsString;
                         W_VLUNIT := dmConsultas.cdsItensVendas.FieldByName('ITE_VLUNIT').AsCurrency;
                         W_VLSUBT := dmConsultas.cdsItensVendas.FieldByName('ITE_VLSUBT').AsCurrency;
                         W_FLCANC := dmConsultas.cdsItensVendas.FieldByName('ITE_FLCANC').AsString;
                         //
                         Print(M_POSINI, Format('%-46s',  [uFuncoes.StrZero(InttoStr(M_NRITEM),3)+ '  ' + W_CDITEN + ' '+W_NMDESC])+
                                         Format('%2s',    [W_FLCANC]), true);
                         Print(M_POSINI, Format('%-12.3f', [W_QTITEN])+
                                         Format('%-11s', [W_UNITEN])+
                                         Format('%12s',  [FormatFloat('###,###,##0.#0',W_VLUNIT)])+
                                         Format('%12s',  [FormatFloat('###,###,##0.#0',W_VLSUBT)]), true);
                         //
                         M_NRITEM := M_NRITEM + 1;
                         dmConsultas.cdsItensVendas.Next;
                    End;
                   End;
                    //
                    Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('-',48)]), true);
                    //Writeln (Impressora,Format('%-30s', ['TOTAL........:   '])+ Format('%15s',[FormatFloat('###,##0.#0', M_TOVEND )]));
                    Print(M_POSINI, Format('%-30s', ['TOTAL........:   '])+ Format('%15s',[FormatFloat('###,##0.#0', M_SOMSUB)]),true);
                    Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('-',48)]),true);
                    If (M_VLDESC > 0) Then
                        Print(M_POSINI, Format('%-20s',['DESCONTO.......:    '])+Format('%15s',[FormatFloat('###,##0.#0',M_VLDESC)]),true);
                    If (W_VLACRE > 0) Then
                        Print(M_POSINI, Format('%-20s',['ACRESCIMO......:    '])+Format('%15s',[FormatFloat('###,##0.#0',W_VLACRE)]),true);
                    { Imprime Total a Pagar }
                    Print(M_POSINI, Format('%-20s',['TOTAL A PAGAR..:    '])+Format('%15s',[FormatFloat('###,##0.#0', M_TOVEND)]),true);
                    { Salta três linhas}
                    NewLine(3);
                    {Imprime Modalidades}
                    dmConsultas.cdsModalidade.First;
                    While not (dmConsultas.cdsModalidade.Eof) do
                    Begin
                         If (dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency > 0) Then
                         Begin
                           W_MNMODA := dmConsultas.cdsModalidade.FieldByName('MOD_NOME').AsString;
                           W_VLMODA := dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
                           //
                           Print(M_POSINI, Format('%-20s',[ W_MNMODA + ' : '])+
                                           Format('%15s',[FormatFloat('###,###,##0.#0',W_VLMODA)]),true);
                         End;
                         // Proximo
                         dmConsultas.cdsModalidade.Next;
                    End;
                    { Imprime troco}
                    NewLine();
                    Print(M_POSINI, Format('%-20s',['TROCO..........:    '])+Format('%15s',[FormatFloat('###,##0.00',StrtoFloat(AllTrim(FloattoStr(M_VLTROC))))]),true);
                    { Salta três linhas }
                    NewLine(3);
                    //
                    Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate(' ',2)+uFuncoes.Replicate('-',44)]),true);
                    If uFuncoes.Empty(W_NMCLIE) Then
                        Print(M_POSINI, Format('%-48s', [uFuncoes.PadC('ASSINATURA DO CLIENTE',48)]),true)
                    Else
                        Print(M_POSINI, Format('%-48s', [uFuncoes.PadC(W_NMCLIE,48)]),true);
                    { Salta Três linhas }
                    NewLine(3);
                    { Imprime separador}
                    Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*',48 )]),true);
                    Print(M_POSINI, Format('%-48s', [uFuncoes.PadC('OBRIGADO POR SUA PREFERENCIA',48)]),true);
                    Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*',48 )]),true);
                    Print(M_POSINI, Format('%-48s', ['DESENVOLVIDO POR:INFOG2 TECNOLOGIA-(86)3226-4510']),true);
                    { Salta uma linhas }
                    NewLine();
                    //
                    EndDoc;
                    FreeAndNil(VDOImpressora);
               End; // fim- with VDOImpressora
    Finally

    End;
End;

Procedure NotaFiscalNova(Local, W_HOVEND, W_JANVEN :string; W_CDLOJA, W_NRVEND,
W_CDCLIE, M_CDCAIX : Integer; W_NMCLIE : String; M_TOVEND, M_VLDESC, W_VLACRE, M_VLTROC : Double);
Var
  Impressora:TextFile;
  Data, W_CDITEN, W_NMDESC, W_MNMODA, W_FLCANC : String;
  W_UNITEN, M_CAMINHO, M_NMFILE, M_CAMINH : String;
  W_VLMODA, W_VLUNIT, W_VLSUBT : Real;
  W_QTITEN, M_SOMSUB : Double;
  M_NRITEM : Integer;
begin
     M_CAMINH := uFuncoes.PASTA_CUPOM(StrtoInt(UFrmAdmin.M_CDUSUA));
     //
     If (fileexists(M_CAMINH+'\impressora.txt')) then
        M_CAMINH := uFuncoes.percorreArquivoTexto(M_CAMINH+'\impressora.txt')
     Else
     begin
        M_NMFILE := 'CUPOM.TXT';
        //
        If (M_CAMINH = 'C:\') Then
           M_CAMINH := M_CAMINH + M_NMFILE
        Else
           M_CAMINH := M_CAMINH+'\'+M_NMFILE;
     End;

{  M_CAMINH := uFuncoes.PASTA_CUPOM(StrtoInt(UFrmAdmin.M_CDUSUA));
  //
  If (M_CAMINH = 'C:\') Then
      M_CAMINH := M_CAMINH + 'CUPOM.TXT'
  Else
      M_CAMINH := M_CAMINH+'\CUPOM.TXT';}
  //
  dm.CdsEmpresas.Close;
  With dm.SdsEmpresas do
  Begin
       Active := False;
       CommandText := 'SELECT * FROM EMPRESAS Where (EMP_CODIGO = :pCODIGO)';
       Params.ParamByName('pCODIGO').AsInteger := W_CDLOJA;
       Active := true;
  End;
  dm.CdsEmpresas.Open;
  //
  Data:= Copy(DatetoStr(Date),1,3)+Copy(DatetoStr(Date),4,3)+Copy(DatetoStr(Date),7,4);
  {Relaciona a variável impressora com a}
   AssignFile(IMPRESSORA, M_CAMINH);
  {abre a porta da impressão }
  Rewrite(IMPRESSORA);
  {envia caractere de controle para comprimir a impressão}
  Write(IMPRESSORA,#15);
  Writeln(impressora);
  { Imprime e alinhado à esquerda dentro de uma área de 52 caracteres}
  Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('*',48 )]));
  { Imprime a string "Cupom ", alinhado à esquerda"-" dentro de uma área de trita caracteres}
  Writeln(Impressora,Format('%-48s',[uFuncoes.PadC('INFOG2 - CUPOM DE VENDA',48)]));
  { Imprime e alinhado à esquerda dentro de uma área de 52 caracteres}
  Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('*',48 )]));
  { Imprime o nome da Loja}
  Writeln(Impressora,Format('%-48s',[uFuncoes.PadC('LOJA: '+dm.CdsEmpresas.FieldByName('EMP_FANTASIA').AsString,48)]));
  Writeln(Impressora,Format('%-48s',[uFuncoes.PadC(dm.CdsEmpresas.FieldByName('EMP_ENDERECO').AsString,48)]));
  { Imprime e alinhado à esquerda dentro de uma área de 52 caracteres}
  Writeln (Impressora,Format('%-30s', [uFuncoes.Replicate('*',48 )]));
  Writeln (Impressora,Format('%-30s', ['N'+CHR(167)+'. DA VENDA....: '+uFuncoes.StrZero(InttoStr(W_NRVEND),7)]));
  Writeln (Impressora,Format('%-48s', ['CLIENTE.........: '+ W_NMCLIE]));
//  Writeln (Impressora,Format('%-30s', ['VENDEDOR........: '+M_NMVEND]));
  Writeln (Impressora,Format('%-30s', ['CAIXA...........: '+uFuncoes.StrZero(InttoStr(M_CDCAIX),3)+ ' - '+UFrmAdmin.M_NMUSUA]));
  { Imprime a Data de Emissão, baseada na data atual e salta para próxima linha}
  Writeln (Impressora,Format('%-30s', ['DATA/HORA.......: '+Data+uFuncoes.Replicate(' ',10) + W_HOVEND]));
  Writeln (Impressora,Format('%-30s', [uFuncoes.Replicate('*',48 )]));
  Writeln (Impressora,Format('%-30s', ['ITEM CODIGO        DESCRICAO']));
  Writeln (Impressora,Format('%-30s', ['QUANT.    UNIDADE    VALOR UNITARIO   SUB-TOTAL']));
  Writeln (Impressora,Format('%-30s', [uFuncoes.Replicate('-',48 )]));
  //
  {----- Fase de Emissão dos Itens da Nota -----}
  { Move o ponteiro para o primeiro registro}
  If (W_JANVEN = '1') Then
  begin
    dm.cdsItensVendas.First;
    M_NRITEM := 1;
    M_SOMSUB := 0;
    While not (dm.cdsItensVendas.Eof) do
    Begin
        // carrega os dados
        W_CDITEN := dm.cdsItensVendas.FieldByName('ITE_CDITEN').AsString;
        W_NMDESC := Copy(dm.cdsItensVendas.FieldByName('ITE_NMDESC').AsString,1,27);
        W_QTITEN := dm.cdsItensVendas.FieldByName('ITE_QTITEN').AsCurrency;
        W_UNITEN := dm.cdsItensVendas.FieldByName('ITE_CDUNID').AsString;
        W_VLUNIT := dm.cdsItensVendas.FieldByName('ITE_VLUNIT').AsCurrency;
        W_VLSUBT := dm.cdsItensVendas.FieldByName('ITE_VLSUBT').AsCurrency;
        W_FLCANC := dm.cdsItensVendas.FieldByName('ITE_FLCANC').AsString;
        //
        Write   (Impressora, Format('%-46s',  [uFuncoes.StrZero(InttoStr(M_NRITEM),3)+ '  ' + W_CDITEN + ' '+W_NMDESC]));
        Writeln (Impressora, Format('%2s',    [W_FLCANC]));
        Write   (Impressora, Format('%-12.3f', [W_QTITEN]));
        Write   (Impressora, Format('%-11s', [W_UNITEN]));
        Write   (Impressora, Format('%12s',  [FormatFloat('###,###,##0.#0',W_VLUNIT)]));
        Writeln (Impressora, Format('%12s',  [FormatFloat('###,###,##0.#0',W_VLSUBT)]));
        M_SOMSUB := M_SOMSUB + W_VLSUBT;
        //
        M_NRITEM := M_NRITEM + 1;
        dm.cdsItensVendas.Next;
    End;  // fim-do-enquanto
 End
 Else
 begin
  //
  dmConsultas.cdsItensVendas.First;
  M_NRITEM := 1;
  While not (dmConsultas.cdsItensVendas.Eof) do
  Begin
       // carrega os dados
       W_CDITEN := dmConsultas.cdsItensVendas.FieldByName('ITE_CDITEN').AsString;
       W_NMDESC := Copy(dmConsultas.cdsItensVendas.FieldByName('ITE_NMDESC').AsString,1,27);
       W_QTITEN := dmConsultas.cdsItensVendas.FieldByName('ITE_QTITEN').AsCurrency;
       W_UNITEN := dmConsultas.cdsItensVendas.FieldByName('ITE_CDUNID').AsString;
       W_VLUNIT := dmConsultas.cdsItensVendas.FieldByName('ITE_VLUNIT').AsCurrency;
       W_VLSUBT := dmConsultas.cdsItensVendas.FieldByName('ITE_VLSUBT').AsCurrency;
       W_FLCANC := dmConsultas.cdsItensVendas.FieldByName('ITE_FLCANC').AsString;
       //
       Write   (Impressora, Format('%-46s',  [uFuncoes.StrZero(InttoStr(M_NRITEM),3)+ '  ' + W_CDITEN + ' '+W_NMDESC]));
       Writeln (Impressora, Format('%2s',    [W_FLCANC]));
       Write   (Impressora, Format('%-12.3f', [W_QTITEN]));
       Write   (Impressora, Format('%-11s', [W_UNITEN]));
       Write   (Impressora, Format('%12s',  [FormatFloat('###,###,##0.#0',W_VLUNIT)]));
       Writeln (Impressora, Format('%12s',  [FormatFloat('###,###,##0.#0',W_VLSUBT)]));
       //
       M_NRITEM := M_NRITEM + 1;
       dmConsultas.cdsItensVendas.Next;
  End;
 End;
  //
  Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('-',48)]));
  //Writeln (Impressora,Format('%-30s', ['TOTAL........:   '])+ Format('%15s',[FormatFloat('###,##0.#0', M_TOVEND )]));
  Writeln (Impressora,Format('%-30s', ['TOTAL........:   '])+ Format('%15s',[FormatFloat('###,##0.#0', M_SOMSUB)]));
  Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('-',48)]));
  If (M_VLDESC > 0) Then
      Writeln(Impressora,Format('%-20s',['DESCONTO.......:    '])+Format('%15s',[FormatFloat('###,##0.#0',M_VLDESC)]));
  If (W_VLACRE > 0) Then
      Writeln(Impressora,Format('%-20s',['ACRESCIMO......:    '])+Format('%15s',[FormatFloat('###,##0.#0',W_VLACRE)]));
  { Imprime Total a Pagar }
  Writeln(Impressora,Format('%-20s',['TOTAL A PAGAR..:    '])+Format('%15s',[FormatFloat('###,##0.#0', M_TOVEND)]));
  { Salta três linhas}
  Writeln(Impressora);
  {Imprime Modalidades}
  dmConsultas.cdsModalidade.First;
  While not (dmConsultas.cdsModalidade.Eof) do
  Begin
       If (dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency > 0) Then
       Begin
         W_MNMODA := dmConsultas.cdsModalidade.FieldByName('MOD_NOME').AsString;
         W_VLMODA := dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
         //
         Write(Impressora,Format('%-20s',[ W_MNMODA + ' : ']));
         Writeln(Impressora,Format('%15s',[FormatFloat('###,###,##0.#0',W_VLMODA)]));
       End;
       // Proximo
       dmConsultas.cdsModalidade.Next;
  End;
  { Imprime troco}
  Writeln(Impressora);
  Writeln(Impressora,Format('%-20s',['TROCO..........:    '])+Format('%15s',[FormatFloat('###,##0.00',StrtoFloat(AllTrim(FloattoStr(M_VLTROC))))]));
  { Salta três linhas }
  Writeln(Impressora);
  Writeln(Impressora);
  Writeln(Impressora);
  Writeln(Impressora, Format('%-48s', [uFuncoes.Replicate(' ',2)+uFuncoes.Replicate('-',44)]));
  If uFuncoes.Empty(W_NMCLIE) Then
      Writeln(Impressora, Format('%-48s', [uFuncoes.PadC('ASSINATURA DO CLIENTE',48)]))
  Else
      Writeln(Impressora, Format('%-48s', [uFuncoes.PadC(W_NMCLIE,48)]));
  { Salta Três linhas }
  Writeln(Impressora);
  Writeln(Impressora);
  Writeln(Impressora);
  { Imprime separador}
  Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('*',48 )]));
  Writeln (Impressora,Format('%-48s', [uFuncoes.PadC('OBRIGADO POR SUA PREFERENCIA',48)]));
  Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('*',48 )]));
  Writeln (Impressora,Format('%-48s', ['DESENVOLVIDO POR:INFOG2 TECNOLOGIA-(86)3226-4510']));
  { Salta uma linhas }
  Writeln(Impressora);
  { Fecha a porta de impressão}
  System.Close(Impressora);
  // Abri o bloco de notas

  //Winexec(Pchar('NotePad.exe '+M_CAMINH),SW_SHOWNORMAL);
End;


function IMPRESSORA(W_CDCAIX : integer): Integer;
begin
     With dmConsultas.qryImpressoraCaixa do
     Begin
          Close;
          Params.ParamByName('pCODIGO').AsInteger := W_CDCAIX;
          Open;
     End;
     //
     If (dmConsultas.qryImpressoraCaixa.FieldByName('SEN_FLIMPRESSORA').AsString = '1') Then
         result := dmConsultas.qryImpressoraCaixa.FieldByName('SEN_ECF').AsInteger
     Else
         result := 0;
end;

function BUSCA_ALIQUOTA(W_CDPROD: String): String;
begin
     With dmConsultas.qryAliquota do
     Begin
          Close;
          Params.ParamByName('pCODIGO').AsString := W_CDPROD;
          Open;
     End;
     //
     if not (dmConsultas.qryAliquota.IsEmpty)  then
        result := dmConsultas.qryAliquota.FieldByName('TRI_INDICE_ECF').AsString
     else
        result := ufuncoes.Replicate(' ',4);
end;

Procedure MODALIDADES;
begin
     //
     frmFormaPagamento.cdsModalidade.First;
     frmFormaPagamento.cdsModalidade.DisableControls;
     //
     dmConsultas.cdsModalidade.Close;
     dmConsultas.cdsModalidade.Open;
     dmConsultas.cdsModalidade.EmptyDataSet;
     //
     While not (frmFormaPagamento.cdsModalidade.Eof) do
     Begin
          dmConsultas.cdsModalidade.Append;
          dmConsultas.cdsModalidade.FieldByName('MOD_CODIGO').AsInteger :=
             frmFormaPagamento.cdsModalidade.FieldByName('MOD_CODIGO').AsInteger;
          dmConsultas.cdsModalidade.FieldByName('MOD_NOME').AsString      :=
             frmFormaPagamento.cdsModalidade.FieldByName('MOD_NOME').AsString;
          dmConsultas.cdsModalidade.FieldByName('MOD_PECOMISSAO').AsFloat :=
             frmFormaPagamento.cdsModalidade.FieldByName('MOD_PECOMISSAO').AsFloat;
          dmConsultas.cdsModalidade.FieldByName('MOD_ABREVIACAO').AsString :=
             frmFormaPagamento.cdsModalidade.FieldByName('MOD_ABREVIACAO').AsString;
          dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency :=
             frmFormaPagamento.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
          dmConsultas.cdsModalidade.FieldByName('MOD_FLFIXA').AsString  :=
             frmFormaPagamento.cdsModalidade.FieldByName('MOD_FLFIXA').AsString;
          dmConsultas.cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger :=
             frmFormaPagamento.cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger;
          dmConsultas.cdsModalidade.Post;
          // Proximo
          frmFormaPagamento.cdsModalidade.Next;
     End;
     //
     dmConsultas.cdsModalidade.First;
     frmFormaPagamento.cdsModalidade.EnableControls;
end;

Procedure GERAR_ARQUIVO_EMAIL(M_NRVEND, M_CDLOJA : Integer);
Var
  Impressora:TextFile;
  M_NMEMPR, Data, W_CDITEN, W_NMDESC, W_MNMODA, W_FLCANC : String;
  W_UNITEN : String;
  W_VLMODA, W_VLUNIT, W_VLSUBT, W_TOVEND, W_VLDESC, W_VLVEND, M_VLTROC, W_QTITEN : Real;
  W_VALIPI, W_VLSUBTOTAL : Double;
  //
  M_CDCLIE, M_CAMINH, M_NMCLIE, M_NMVEND, M_FLSITU, M_NMFILE : String;
  M_CDCAIX, M_FLIMPR, M_NRITEM, QUANT, M_CDTABE, iCodForn  : Integer;
  M_RAZAO, M_ENDERE, BAIRRO, CEP, CIDADE, UF, FONE, FAX, CNJP, INSCESTAD, W_NOMCOR : String;
  W_IPIPRO, W_PRODES, iTotalItens, fVlDesconto : Double;
begin
     //
     udm.aArquivoAnexo := '';
     M_NMFILE := 'PC'+StrZero(InttoStr(M_NRVEND),6)+'.TXT';
     M_CAMINH := Dm.cdsconfigCFG_ARQUIVO_PEDIDO.AsString+'\'+M_NMFILE;
     //ExtractFilePath( Application.ExeName )+'\'+M_NMFILE;
     //
     If (fileexists(M_CAMINH)) then
        DeleteFile(StrToPChar(M_CAMINH));
  //
  M_CDCLIE := StrZero(dmConsultas.cdsVendas.FieldByName('MOV_CLIENTE').AsString,7);
  W_VLDESC := dmConsultas.cdsVendas.FieldByName('MOV_DESCONTO').AsCurrency;
  M_FLSITU := dmConsultas.cdsVendas.FieldByName('MOV_SITUACAO').AsString;
  M_CDTABE := dmConsultas.cdsVendas.FieldByName('MOV_TABELA').AsInteger;
  QUANT := 80;
  //125;
  // Caixa
  With dmConsultas.qryMovCaixa do
  Begin
       Close;
       Params.ParamByName('pLOJA').AsInteger  := M_CDLOJA;
       Params.ParamByName('pVENDA').AsInteger := M_NRVEND;
       Open;
  End;
  //
  M_CDCAIX := dmConsultas.qryMovCaixa.FieldByName('MCA_CAIXA').AsInteger;
  // Vendedor
  With dmConsultas.qryVendedor do
  Begin
       Close;
       Params.ParamByName('pCODIGO').AsInteger  := dmConsultas.cdsVendas.FieldByName('MOV_VENDEDOR').AsInteger;
       Open;
  End;
  //
  M_NMVEND := dmConsultas.qryVendedor.FieldByName('FUN_NOME').AsString;
  //
  If (W_VLDESC > 0) Then
      W_TOVEND := dmConsultas.cdsVendas.FieldByName('MOV_VALOR').AsCurrency + W_VLDESC
  Else
      W_TOVEND := dmConsultas.cdsVendas.FieldByName('MOV_VALOR').AsCurrency;
  //
  W_VLVEND := dmConsultas.cdsVendas.FieldByName('MOV_VALOR').AsCurrency;
  // Cliente
  dm.FilterCDS(dm.CdsClientes, fsInteger, dmConsultas.cdsVendas.FieldByName('MOV_CLIENTE').AsString);
  //
  With dm.CdsClientes do
    begin
         {lose;
         dm.SdsClientes.ParamByName('PCODIGO').AsInteger :=
              dmConsultas.cdsVendas.FieldByName('MOV_CLIENTE').AsInteger;
         Open;}
         //
         M_NMCLIE := dm.CdsClientes.FieldByName('CLI_FANTASIA').AsString;
         M_RAZAO  := dm.CdsClientes.FieldByName('CLI_RAZAO').AsString;
         M_ENDERE := dm.CdsClientes.FieldByName('CLI_ENDERECO').AsString;
         BAIRRO   := dm.CdsClientes.FieldByName('BAI_CODIGO').AsString;
         CEP      := FormataCep(dm.CdsClientes.FieldByName('CLI_CEP').AsString);
         CIDADE   := GetCidade(dm.CdsClientes.FieldByName('CID_CODIGO').AsInteger);
         UF       := dm.CdsClientes.FieldByName('CLI_UFCLIENTE').AsString;
         FONE     := FormataFONE(dm.CdsClientes.FieldByName('CLI_FONE1').AsString);
         FAX      := FormataFONE(dm.CdsClientes.FieldByName('CLI_FAX').AsString);
         CNJP     := FormataCNPJ(dm.CdsClientes.FieldByName('CLI_CGC').AsString);
         INSCESTAD := dm.CdsClientes.FieldByName('CLI_INSCESTADUAL').AsString;
    End;
  //
  dm.CdsEmpresas.Close;
  With dm.SdsEmpresas do
  Begin
       Active := False;
       CommandText := 'SELECT * FROM EMPRESAS Where (EMP_CODIGO = :pCODIGO)';
       Params.ParamByName('pCODIGO').AsInteger := M_CDLOJA;
       Active := true;
  End;
  dm.CdsEmpresas.Open;
  //
  M_NMEMPR := Dm.CdsEmpresasEMP_FANTASIA.AsString;
  //
  Data:= Copy(DatetoStr(Date),1,3)+Copy(DatetoStr(Date),4,3)+Copy(DatetoStr(Date),7,4);
  {Relaciona a variável impressora com a}
   AssignFile(IMPRESSORA, M_CAMINH);
  {abre a porta da impressão }
  Rewrite(IMPRESSORA);
  {envia caractere de controle para comprimir a impressão}
  //Write(IMPRESSORA,#15);
  { salta duas linhas}
  Writeln(impressora);
  { Imprime e alinhado à esquerda dentro de uma área de 52 caracteres}
  Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('-',QUANT )]));
  { Imprime a string "Cupom ", alinhado à esquerda"-" dentro de uma área de trita caracteres}
  Writeln(Impressora,Format('%-48s',[M_NMEMPR]));
  Writeln(Impressora,Format('%-48s',['PEDIDO DE VENDA']));
  { Imprime e alinhado à esquerda dentro de uma área de 111 caracteres}
  Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('-',QUANT )]));
  Writeln (Impressora);
  { Imprime o nome da Loja}
  Writeln(Impressora,Format('%-48s',['LOJA......: '+dm.CdsEmpresas.FieldByName('EMP_FANTASIA').AsString]));
  Writeln(Impressora,Format('%-48s',['CNPJ:'+ FormataCNPJ(dm.CdsEmpresas.FieldByName('EMP_CNPJ').AsString) + uFuncoes.Replicate(' ', 5) +'INSCRICAO ESTADUAL:'+ dm.CdsEmpresas.FieldByName('EMP_INSCRICAOESTADUAL').AsString]));
  Writeln(Impressora,Format('%-52s',['ENDEREÇO..: '+dm.CdsEmpresas.FieldByName('EMP_ENDERECO').AsString+
                                     uFuncoes.Replicate(' ', 5)+'CEP:'+FormataCep(dm.CdsEmpresas.FieldByName('EMP_NRCEP').AsString)+
                                     uFuncoes.Replicate(' ', 5)+ GetCidade(dm.CdsEmpresas.FieldByName('CID_CODIGO').AsInteger)+'-'+dm.CdsEmpresas.FieldByName('EMP_UF').AsString]));
  Writeln(Impressora,Format('%-52s',['FONE....: ' + FormataFONE(dm.CdsEmpresas.FieldByName('EMP_NRFONE').AsString)+
         uFuncoes.Replicate(' ', 5) +'FAX:'+ FormataFONE(dm.CdsEmpresas.FieldByName('EMP_NRFAX').AsString)+
         uFuncoes.Replicate(' ', 5) +'EMAIL:'+ dm.CdsConfig.FieldByName('CFG_EMAIL').AsString]));
  { Salta uma linhas}
  //Writeln(Impressora);
  { ---- Impressão dos Cabeçalho-----}
  { Imprime e alinhado à esquerda dentro de uma área de 48 caracteres}
  Writeln (Impressora,Format('%-30s', [uFuncoes.Replicate('-',QUANT )]));
  Writeln (Impressora,Format('%-30s', ['Nº. DO PEDIDO...: '+uFuncoes.StrZero(InttoStr(M_NRVEND),7)]));
  Writeln (Impressora,Format('%-48s', ['[ DADOS DO CLIENTE ]']));
  Writeln (Impressora,Format('%-52s', ['CLIENTE.........: '+ Copy(M_NMCLIE,1,25)]));
  Writeln (Impressora,Format('%-52s', ['RAZÃO SOCIAL....: '+ Copy(M_RAZAO,1,25)]));
  Writeln (Impressora,Format('%-52s', ['ENDEREÇO/BAIRRO.: '+ M_ENDERE + ' '+BAIRRO]));
  Writeln (Impressora,Format('%-52s', ['CEP/CIDADE/UF...: '+ CEP + ' ' + CIDADE + ' - '+UF]));
  Writeln (Impressora,Format('%-52s', ['FONE/FAX........: '+ FONE + '/'+ FAX]));
  Writeln (Impressora,Format('%-52s', ['CNPJ/INSC.EST...: '+ CNJP ]));
  Writeln (Impressora,Format('%-52s', ['INSC.ESTADUAL...: '+ INSCESTAD ]));
  { Imprime e alinhado à esquerda dentro de uma área de 111 caracteres}
  {Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('-',QUANT )]));
  Writeln (Impressora);
  Writeln (Impressora,Format('%-52s', ['FONE REPRESENTA.: '+ dm.CdsEmpresas.FieldByName('')  ]));
  Writeln (Impressora,Format('%-52s', ['REPRESENTANTE...: '+ M_NMEMPR]));}
  { Imprime e alinhado à esquerda dentro de uma área de 111 caracteres}
  Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('-',QUANT )]));
  Writeln (Impressora);
  { Imprime a Data de Emissão, baseada na data atual e salta para próxima linha}
  {Write   (Impressora,Format('%-12s', ['DATA/HORA.......: '+ DatetoStr(Date())+' / ' ]));
  Writeln (Impressora,Format('%-12s', [TimetoStr(Date)]));}
  Writeln (Impressora,Format('%-30s', ['DATA/HORA.......: '+dmConsultas.cdsVendas.FieldByName('MOV_DATAVENDA').AsString+ ' - '
     +dmConsultas.cdsVendas.FieldByName('MOV_HORAVENDA').AsString]));
  //
  With dmConsultas.cdsProdVenda do
  Begin
       Active := False;
       Params.ParamByName('pPEDIDO').AsInteger := M_NRVEND;
       Active := True;
  End;
  //
  W_VALIPI := 0;
  W_VLSUBTOTAL := 0;
  //
  dmConsultas.cdsProdVenda.First;
  // novo
  iCodForn := GetCodForn(dmConsultas.cdsProdVenda.FieldByName('MOP_PRODUTO').AsString);
  //
  Writeln (Impressora,Format('%-30s', [uFuncoes.Replicate('-',QUANT )]));
  Writeln (Impressora,Format('%-48s', ['[ DADOS DO FORNECEDOR ]']));
  If (iCodForn > 0) Then
    begin
         dm.FilterCDS(Dm.cdsFornecedor, fsInteger, InttoStr(iCodForn));
         Writeln (Impressora,Format('%-48s', [FormataCNPJ(Dm.cdsFornecedorFOR_CNPJ.AsString)+
            '  '+ Dm.cdsFornecedorFOR_FANTASIA.AsString]));
    End
    Else
        Writeln (Impressora );
  Writeln (Impressora,Format('%-30s', [uFuncoes.Replicate('-',QUANT )]));
  //
  Writeln (Impressora,Format('%-30s', [uFuncoes.Replicate('-',QUANT )]));
  Writeln (Impressora,Format('%-48s', ['[ TRANSPORTADORA ]']));
  //
  If (dmConsultas.cdsVendas.FieldByName('MOV_TIPO_FRETE').AsString  = 'F') Then
  Begin
       Writeln (Impressora,Format('%-48s', ['(X) CIF   TRANSPORTADORA: '+ dmConsultas.GetNomeTransportadora(dmConsultas.cdsVendas.FieldByName('MOV_IDTRANSPORTADORA').AsInteger )]));
       If (dmConsultas.cdsVendas.FieldByName('MOV_PERC_FRETE').AsFloat > 0) Then
          Writeln (Impressora,Format('%-48s', ['( ) FOB    %=VALOR FRETE: '+ FormatFloat('##0.#0',dmConsultas.cdsVendas.FieldByName('MOV_PERC_FRETE').AsFloat) +'%  = '+ FormatFloat('###,##0.#0',
            Gerapercentual(dmConsultas.cdsVendas.FieldByName('MOV_VALOR').AsFloat,
            dmConsultas.cdsVendas.FieldByName('MOV_PERC_FRETE').AsFloat) )]))
       Else
          Writeln (Impressora,Format('%-48s', ['( ) FOB    %=VALOR FRETE: '+ FormatFloat('##0.#0',dmConsultas.cdsVendas.FieldByName('MOV_PERC_FRETE').AsFloat) +'%']));
  End;
  //
  If (dmConsultas.cdsVendas.FieldByName('MOV_TIPO_FRETE').AsString  = 'C') Then
  Begin
       Writeln (Impressora,Format('%-48s', ['( ) CIF   TRANSPORTADORA: '+ dmConsultas.GetNomeTransportadora(dmConsultas.cdsVendas.FieldByName('MOV_IDTRANSPORTADORA').AsInteger)]));
       Writeln (Impressora,Format('%-48s', ['(X) FOB    %=VALOR FRETE: '+ FormatFloat('##0.#0',dmConsultas.cdsVendas.FieldByName('MOV_PERC_FRETE').AsFloat) +'%']));
  End;
  //
  If (M_FLSITU = 'C') Then
  begin
       Writeln (Impressora,Format('%-30s', [uFuncoes.Replicate('-',QUANT )]));
       Writeln (Impressora,Format('%-48s', [uFuncoes.PadC('*** VENDA CANCELADA ***',QUANT)]));
  End;
  //
  Writeln (Impressora,Format('%-30s', [uFuncoes.Replicate('-',QUANT )]));
  Writeln (Impressora,Format('%-30s', ['[ ITENS DO PEDIDO ]']));
  Writeln (Impressora,Format('%-30s', [uFuncoes.Replicate('-',QUANT )]));
  //Writeln (Impressora,Format('%-30s', ['ITEM CODIGO        DESCRICAO                                   QUANT.    UNIDADE    VALOR UNITARIO   SUB-TOTAL']));
  //Writeln (Impressora,Format('%-30s', ['ITEM CODIGO        DESCRICAO                                      QUANT.  VALOR UNITARIO   SUB-TOTAL']));
  //  Writeln (Impressora,Format('%-60s', ['ITEM CODIGO        DESCRICAO                       COR            QUANT.  VALOR UNITARIO         IPI     DESCONTO  SUB-TOTAL']));
       //Write   (Impressora, Format('%-5s',  ['ITEM'+ '  ']));
       Write   (Impressora, Format('%-11s', ['REFERENCIA' + ' ']));
       Write   (Impressora, Format('%-35s', ['DESCRIÇÃO DO PRODUTO' + ' ']));
       Write   (Impressora, Format('%-8s',  ['COR' + ' ']));
       Writeln   (Impressora, Format('%2s',   ['  ']));
       //
       Write   (Impressora, Format('%10s',  ['QTDE']));
       Write   (Impressora, Format('%10s',  ['UNITARIO']));
       Write   (Impressora, Format('%10s',  ['IPI']));
       Write   (Impressora, Format('%10s',  ['DESC'+' ']));
       Writeln (Impressora, Format('%10s',  ['VL.TOTAL']));

  Writeln (Impressora,Format('%-30s', [uFuncoes.Replicate('-',QUANT )]));
  //
  {----- Fase de Emissão dos Itens da Nota -----}
  { Move o ponteiro para o primeiro registro}
{  With dmConsultas.cdsProdVenda do
  Begin
       Active := False;
       Params.ParamByName('pPEDIDO').AsInteger := M_NRVEND;
       Active := True;
  End;
  //
  W_VALIPI := 0;
  W_VLSUBTOTAL := 0;
  //
  dmConsultas.cdsProdVenda.First;}
  M_NRITEM := 1;
  iTotalItens := 0;
  fVlDesconto := 0;
  //
  While not (dmConsultas.cdsProdVenda.Eof) do
  Begin
      {carrega os dados}
       //W_CDITEN := dmConsultas.cdsProdVenda.FieldByName('MOP_PRODUTO').AsString;
       W_CDITEN := dmConsultas.GetCodReferencia(dmConsultas.cdsProdVenda.FieldByName('MOP_PRODUTO').AsString);
       W_NMDESC := Copy(dmConsultas.cdsProdVenda.FieldByName('MOP_NMPRODUTO').AsString,1,27);
       W_IPIPRO := getIPIProduto(dmConsultas.cdsProdVenda.FieldByName('MOP_PRODUTO').AsString);
       W_PRODES := dmConsultas.cdsProdVenda.FieldByName('MOP_DESCONTO').AsFloat;

       W_QTITEN := dmConsultas.cdsProdVenda.FieldByName('MOP_QUANTIDADE').AsFloat;
       W_UNITEN := dmConsultas.cdsProdVenda.FieldByName('MOP_UNIDADE').AsString;
       W_VLUNIT := dmConsultas.cdsProdVenda.FieldByName('MOP_VALOR').AsCurrency;
       W_NOMCOR := getcor(dmConsultas.cdsProdVenda.FieldByName('MOP_CODCOR').AsInteger);
       W_VLSUBT := (dmConsultas.cdsProdVenda.FieldByName('MOP_VALOR').AsCurrency*
                   dmConsultas.cdsProdVenda.FieldByName('MOP_QUANTIDADE').AsCurrency);
       fVlDesconto := fVlDesconto + Gerapercentual(W_VLSUBT ,W_PRODES);
                   //- Gerapercentual(W_VLUNIT,W_PRODES) ;
       W_VALIPI := W_VALIPI + Gerapercentual(W_VLSUBT , getIPIProduto(dmConsultas.cdsProdVenda.FieldByName('MOP_PRODUTO').AsString));
       W_VLSUBTOTAL := W_VLSUBTOTAL + W_VLSUBT;
       //
       //W_VALIPI := W_VALIPI + uFuncoes.Arredondar(uFuncoes.Gerapercentual(W_VLSUBT, cdsItensVendasITE_VALIPI.AsFloat),2);
       //Write   (Impressora, Format('%-5s',  [uFuncoes.StrZero(InttoStr(M_NRITEM),3)+ '  ' + W_CDITEN + ' '+W_NMDESC]));
       //Write   (Impressora, Format('%-5s',  [uFuncoes.StrZero(InttoStr(M_NRITEM),3)+ '  ']));
       {       Write   (Impressora, Format('%-14s', [W_CDITEN + ' ']));
       Write   (Impressora, Format('%-32s', [W_NMDESC + ' ']));
       Write   (Impressora, Format('%-10s', [W_NOMCOR + ' ']));
       Write   (Impressora, Format('%2s',   [W_FLCANC]));
       //
       Write   (Impressora, Format('%8.2f', [W_QTITEN]));
       //Write   (Impressora, Format('%-11s', [W_UNITEN]));
       Writeln   (Impressora, Format('%17s',  [FormatFloat('###,###,##0.#0',W_VLUNIT)]));
       Write   (Impressora, Format('%12s',  [FormatFloat('###,###,##0.#0',W_IPIPRO)]));
       Write   (Impressora, Format('%12s',  [FormatFloat('###,###,##0.#0',W_PRODES)]));
       Writeln (Impressora, Format('%12s',  [FormatFloat('###,###,##0.#0',W_VLSUBT)]));}
       Write   (Impressora, Format('%-11s', [W_CDITEN + ' ']));
       Write   (Impressora, Format('%-35s', [W_NMDESC + ' ']));
       Write   (Impressora, Format('%-8s', [W_NOMCOR + ' ']));
       Writeln   (Impressora, Format('%2s',   [W_FLCANC]));
       //
       Write   (Impressora, Format('%10.2f', [W_QTITEN]));
       //Write   (Impressora, Format('%-11s', [W_UNITEN]));
       Write   (Impressora, Format('%10s',  [FormatFloat('###,###,##0.#0',W_VLUNIT)]));
       Write   (Impressora, Format('%10s',  [FormatFloat('###,###,##0.#0',W_IPIPRO)]));
       Write   (Impressora, Format('%10s',  [FormatFloat('###,###,##0.#0',W_PRODES)]));
       Writeln (Impressora, Format('%10s',  [FormatFloat('###,###,##0.#0',W_VLSUBT)]));
       //
       iTotalItens := iTotalItens + W_QTITEN;
       M_NRITEM := M_NRITEM + 1;
       //
       dmConsultas.cdsProdVenda.Next;
  End;
  //
  Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('-',QUANT)]));
  Writeln (Impressora,Format('%-48s', ['QUANT. ITENS :' + InttoStr(M_NRITEM - 1) + '     TOTAL DE ITENS:' + FloattoStr(iTotalItens)]));
  W_TOVEND := W_VLSUBTOTAL + W_VALIPI - fVlDesconto;
  Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('-',QUANT)]));
  Writeln (Impressora,Format('%-30s', ['SUB-TOTAL....:   '])+ uFuncoes.Replicate(' ', 2)+Format('%18s', [FormatFloat('###,##0.#0',W_VLSUBTOTAL)]));
  Writeln (Impressora,Format('%-30s', ['DESCONTOS.(-):   '])+ uFuncoes.Replicate(' ', 2)+Format('%18s', [FormatFloat('###,##0.#0',fVlDesconto)]));
  Writeln (Impressora,Format('%-30s', ['IPI.......(+):   '])+ uFuncoes.Replicate(' ', 2)+Format('%18s', [FormatFloat('###,##0.#0',W_VALIPI)]));
  Writeln (Impressora,Format('%-30s', ['TOTAL.....(=):   '])+ uFuncoes.Replicate(' ', 2)+Format('%18s', [FormatFloat('###,##0.#0',W_TOVEND)]));
  Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('-',QUANT)]));
  {If (W_VLDESC > 0) Then
      Writeln(Impressora,Format('%-20s',['DESCONTO.......:    '])+Format('%15s',[FormatFloat('###,##0.#0',W_VLDESC)]))
  Else
      Writeln(Impressora,Format('%-20s',['DESCONTO.......:      0.00']));}
  { Imprime Total a Pagar }
  Writeln(Impressora,Format('%-20s',['TOTAL A PAGAR..:    '])+ uFuncoes.Replicate(' ', 15)+Format('%15s',[FormatFloat('###,##0.#0',W_TOVEND)]));
  { Salta três linhas}
  Writeln(Impressora);
  {Imprime Modalidades}
  dm.cdsMovimentoCaixa.Close;
  With dm.dstMovimentoCaixa do
  Begin
       Active := False;
       Commandtext := 'Select * from MOVIMENTO_CAIXA '+
                      'Where (MCA_LOJA = :pLOJA) and (MCA_VENDA = :pVENDA)';
       Params.ParamByName('pLOJA').AsInteger  := M_CDLOJA;
       Params.ParamByName('pVENDA').AsInteger := M_NRVEND;
       Active := True;
  End;
  dm.cdsMovimentoCaixa.Open;
  //
  dm.cdsMovimentoCaixa.First;
  Writeln(Impressora,Format('%-25s',['CODIÇÕES DE PAGAMENTO']));
  While not (dm.cdsMovimentoCaixa.Eof) do
  Begin
       W_MNMODA := dm.cdsMovimentoCaixa.FieldByName('MCA_NOMEMODA').AsString;
       W_VLMODA := dm.cdsMovimentoCaixa.FieldByName('MCA_VLMODALIDADE').AsCurrency;
       M_VLTROC := M_VLTROC + dm.cdsMovimentoCaixa.FieldByName('MCA_VLTROCO').AsCurrency;
       //
       If (W_VLMODA > 0) Then
       begin
           Write(Impressora,Format('%-20s',[ W_MNMODA + ' : ']));
           //Writeln(Impressora,Format('%15s',[FormatFloat('###,###,##0.#0',W_VLMODA)]));
           Writeln(Impressora,Format('%15s',[FormatFloat('###,###,##0.#0',W_TOVEND)]));
       End;
       // Proximo
       dm.cdsMovimentoCaixa.Next;
  End;
  { Imprime }
  Writeln(Impressora);
  Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('-',QUANT )]));
  Writeln (Impressora,Format('%-48s', ['PLANO DE PAGAMENTO:'+
           GetNomePlano(dmConsultas.cdsVendas.FieldByName('MOV_TABELA_PLANO').AsInteger)]));
           // ' EM '+GetFormaPagamento(GetModaPedido(dmConsultas.cdsVendas.FieldByName('MOV_PEDIDO').AsInteger))
  Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('-',QUANT )]));
  Writeln(Impressora);
  //
  With dm2.cdsTabPreco do
  Begin
       Close;
       Params.ParamByName('pCODIGO').AsInteger := M_CDTABE;
       Open;
       //
       If not (IsEmpty) Then
        begin
              Writeln(Impressora,Format('%-12s',['DESCONTOS:']));
              Write (Impressora,Format('%12s', ['DESCONTO1'+ uFuncoes.Replicate(' ', 2)]));
              Write (Impressora,Format('%12s', ['DESCONTO2'+ uFuncoes.Replicate(' ', 2)]));
              Write (Impressora,Format('%12s', ['DESCONTO3'+ uFuncoes.Replicate(' ', 2)]));
              Write (Impressora,Format('%12s', ['DESCONTO4'+ uFuncoes.Replicate(' ', 2)]));
              Write (Impressora,Format('%12s', ['DESCONTO5'+ uFuncoes.Replicate(' ', 2)]));
              Writeln(Impressora,Format('%12s',['DESCONTO6'+ uFuncoes.Replicate(' ', 2)]));
              //
              Write (Impressora,Format('%12s', [FormatFloat('#,##0.00',FieldByName('PRC_DESC1').AsFloat)+ uFuncoes.Replicate(' ', 2)]));
              Write (Impressora,Format('%12s', [FormatFloat('#,##0.00',FieldByName('PRC_DESC2').AsFloat)+ uFuncoes.Replicate(' ', 2)]));
              Write (Impressora,Format('%12s', [FormatFloat('#,##0.00',FieldByName('PRC_DESC3').AsFloat)+ uFuncoes.Replicate(' ', 2)]));
              Write (Impressora,Format('%12s', [FormatFloat('#,##0.00',FieldByName('PRC_DESC4').AsFloat)+ uFuncoes.Replicate(' ', 2)]));
              Write (Impressora,Format('%12s', [FormatFloat('#,##0.00',FieldByName('PRC_DESC5').AsFloat)+ uFuncoes.Replicate(' ', 2)]));
              Writeln(Impressora,Format('%12s',[FormatFloat('#,##0.00',FieldByName('PRC_DESC6').AsFloat)+ uFuncoes.Replicate(' ', 2)]));
              //
              Writeln(Impressora);
              Writeln(Impressora,Format('%-12s',['ACRESCIMOS:']));
              Write (Impressora,Format('%12s', ['ACRESCIMO1'+ uFuncoes.Replicate(' ', 2)]));
              Writeln(Impressora,Format('%12s',['ACRESCIMO2'+ uFuncoes.Replicate(' ', 2)]));
              Write (Impressora,Format('%12s', [FormatFloat('#,##0.00',FieldByName('PRC_ACRE1').AsFloat)+ uFuncoes.Replicate(' ', 2)]));
              Writeln(Impressora,Format('%12s',[FormatFloat('#,##0.00',FieldByName('PRC_ACRE2').AsFloat)+ uFuncoes.Replicate(' ', 2)]));
        End;

  End;
  Writeln(Impressora);
  Writeln(Impressora);
  Writeln(Impressora);
  Writeln(Impressora, Format('%-80s',[uFuncoes.Replicate('_',38)+'  '+uFuncoes.Replicate('_',38)]));
  Write  (Impressora, Format('%-40s',[PadC('CLIENTE',40)]));
  Writeln(Impressora, Format('%-40s',[PadC('REPRESENTANTE',40)]));
  { Salta cinco linhas }
  Writeln(Impressora);
  Writeln(Impressora);
  Writeln(Impressora, Format('%-80s',[dm.CdsConfigCFG_MENS_RODAPE_PEDIDO.AsString]));
  Writeln(Impressora);
  Writeln(Impressora);
  Writeln(Impressora);
  { Imprime separador}
  Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('-',QUANT )]));
  Writeln (Impressora,Format('%-48s', [uFuncoes.PadC('OBRIGADO POR SUA PREFERÊNCIA',QUANT)]));
  Writeln (Impressora,Format('%-48s', [uFuncoes.Replicate('-',QUANT )]));
  Writeln (Impressora,Format('%-60s', [uFuncoes.PadC('DESENVOLVIDO POR : INFOG2 TECNOLOGIA - (86)3226-4510',QUANT)]));
  { Salta uma linhas }
  Writeln(Impressora);
  { Fecha a porta de impressão}
  System.Close(Impressora);
  //
  udm.aArquivoAnexo := M_CAMINH;
End;

Procedure GERAR_ARQUIVO_WORD(M_NRVEND, M_CDLOJA : Integer);
Var
  Impressora:TextFile;
  M_NMEMPR, Data, W_CDITEN, W_NMDESC, W_MNMODA, W_FLCANC : String;
  W_UNITEN : String;
  W_VLMODA, W_VLUNIT, W_VLSUBT, W_TOVEND, W_VLDESC, W_VLVEND, M_VLTROC, W_QTITEN : Real;
  //
  M_CDCLIE, M_CAMINH, M_NMCLIE, M_NMVEND, M_FLSITU, M_NMFILE, M_QUEBRA : String;
  M_CDCAIX, M_FLIMPR, M_NRITEM, QUANT, M_LINHA, M_COLUNA, M_TAMFON : Integer;
  //
  Word: Variant;
  M_NMFONT : String;
begin
  //
  M_CDCLIE := StrZero(dmConsultas.cdsVendas.FieldByName('MOV_CLIENTE').AsString,7);
  M_NMCLIE := dmConsultas.cdsVendas.FieldByName('MOV_NOMECLIENTE').AsString;
  W_VLDESC := dmConsultas.cdsVendas.FieldByName('MOV_DESCONTO').AsCurrency;
  M_FLSITU := dmConsultas.cdsVendas.FieldByName('MOV_SITUACAO').AsString;
  QUANT := 80;
  M_QUEBRA := #13;
  M_NMFONT := 'Courier New';
  M_TAMFON := 10;
  M_LINHA  := 2;
  M_COLUNA := 7;
  //
  If FileExists(ExtractFilePath( Application.ExeName )+'VENDA.DOC') Then
    DeleteFile(StrToPChar(ExtractFilePath( Application.ExeName )+'VENDA.DOC'));
  // Caixa
  With dmConsultas.qryMovCaixa do
  Begin
       Close;
       Params.ParamByName('pLOJA').AsInteger  := M_CDLOJA;
       Params.ParamByName('pVENDA').AsInteger := M_NRVEND;
       Open;
  End;
  //
  M_CDCAIX := dmConsultas.qryMovCaixa.FieldByName('MCA_CAIXA').AsInteger;
  // Vendedor
  With dmConsultas.qryVendedor do
  Begin
       Close;
       Params.ParamByName('pCODIGO').AsInteger  := dmConsultas.cdsVendas.FieldByName('MOV_VENDEDOR').AsInteger;
       Open;
  End;
  //
  M_NMVEND := dmConsultas.qryVendedor.FieldByName('FUN_NOME').AsString;
  //
  If (W_VLDESC > 0) Then
      W_TOVEND := dmConsultas.cdsVendas.FieldByName('MOV_VALOR').AsCurrency + W_VLDESC
  Else
      W_TOVEND := dmConsultas.cdsVendas.FieldByName('MOV_VALOR').AsCurrency;
  //
  W_VLVEND := dmConsultas.cdsVendas.FieldByName('MOV_VALOR').AsCurrency;
  //
  dm.CdsEmpresas.Close;
  With dm.SdsEmpresas do
  Begin
       Active := False;
       CommandText := 'SELECT * FROM EMPRESAS Where (EMP_CODIGO = :pCODIGO)';
       Params.ParamByName('pCODIGO').AsInteger := M_CDLOJA;
       Active := true;
  End;
  dm.CdsEmpresas.Open;
  //
  M_NMEMPR := Dm.CdsEmpresasEMP_FANTASIA.AsString;
  //
  Data:= Copy(DatetoStr(Date),1,3)+Copy(DatetoStr(Date),4,3)+Copy(DatetoStr(Date),7,4);
  //
  { Abre o Word }
  Word := CreateOleObject('Word.Basic'); // 'Word.Application
  try
     { Novo documento }
     Word.FileNew;
     //
     try
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(' '+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(' '+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.CenterPara;
           Word.bold;//coloca negrito
           //
           Word.insert(M_NMEMPR + M_QUEBRA);
           //
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.bold;//coloca negrito
           //
           Word.insert('PEDIDO DE VENDA'+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.CenterPara;
           //
           Word.bold(false);//retira o bold
           Word.insert(' '+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert('LOJA: ' + dm.CdsEmpresas.FieldByName('EMP_FANTASIA').AsString+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(dm.CdsEmpresas.FieldByName('EMP_ENDERECO').AsString+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(' '+ M_QUEBRA);
           Word.LeftPara;
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(' '+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert('Nº. DA VENDA....: '+ uFuncoes.StrZero(InttoStr(M_NRVEND),7)+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert('CLIENTE.........: '+ M_NMCLIE+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert('CAIXA...........: '+ uFuncoes.StrZero(InttoStr(M_CDCAIX),3)+ ' - ' + NOME_CAIXA(M_CDCAIX)+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert('DATA/HORA.......: '+ dmConsultas.cdsVendas.FieldByName('MOV_DATAVENDA').AsString+uFuncoes.Replicate(' ',10)
                 +dmConsultas.cdsVendas.FieldByName('MOV_HORAVENDA').AsString+ M_QUEBRA);
           //
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(uFuncoes.Replicate('-', 70 )+ M_QUEBRA);
           // itens da venda
           {----- Fase de Emissão dos Itens da Nota -----}
           { Move o ponteiro para o primeiro registro}
           With dmConsultas.cdsProdVenda do
           Begin
                Active := False;
                Params.ParamByName('pPEDIDO').AsInteger := M_NRVEND;
                Active := True;
           End;
           dmConsultas.cdsProdVenda.First;
           M_NRITEM := 1;
           M_LINHA  := M_LINHA + dmConsultas.cdsProdVenda.RecordCount;
           //
           // Adiciona tabela
           {Word.ActiveDocument.Tables.Add(
                  Range := Word.Selection.Range, NumRows := M_LINHA , NumColumns := M_COLUNA);}

           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.bold;//coloca negrito
           Word.insert('ITEM CODIGO        DESCRICAO                                   QUANT.    UNIDADE    VALOR UNITARIO   SUB-TOTAL'+M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(uFuncoes.Replicate('-', 70 )+ M_QUEBRA);
           //
           While not (dmConsultas.cdsProdVenda.Eof) do
           Begin
                //  carrega os dados
                W_CDITEN := dmConsultas.cdsProdVenda.FieldByName('MOP_PRODUTO').AsString;
                W_NMDESC := Copy(dmConsultas.cdsProdVenda.FieldByName('MOP_NMPRODUTO').AsString,1,27);
                W_QTITEN := dmConsultas.cdsProdVenda.FieldByName('MOP_QUANTIDADE').AsFloat;
                W_UNITEN := dmConsultas.cdsProdVenda.FieldByName('MOP_UNIDADE').AsString;
                W_VLUNIT := dmConsultas.cdsProdVenda.FieldByName('MOP_VALOR').AsCurrency;
                W_VLSUBT := dmConsultas.cdsProdVenda.FieldByName('MOP_VALOR').AsCurrency*
                            dmConsultas.cdsProdVenda.FieldByName('MOP_QUANTIDADE').AsCurrency;
                //
                Word.Font(M_NMFONT);
                Word.FontSize(M_TAMFON);//muda o tamanho da fonte
                Word.insert(Format('%-5s',  [uFuncoes.StrZero(InttoStr(M_NRITEM),3)+ '  ']));
                Word.Font(M_NMFONT);
                Word.FontSize(M_TAMFON);//muda o tamanho da fonte
                Word.insert( Format('%-14s', [W_CDITEN + ' ']));
                Word.Font(M_NMFONT);
                Word.FontSize(M_TAMFON);//muda o tamanho da fonte
                Word.insert( Format('%-42s', [W_NMDESC + ' ']));
                Word.Font(M_NMFONT);
                Word.FontSize(M_TAMFON);//muda o tamanho da fonte
                Word.insert( Format('%2s',   [W_FLCANC]));
                //
                Word.Font(M_NMFONT);
                Word.FontSize(M_TAMFON);//muda o tamanho da fonte
                Word.insert( Format('%-12.3f', [W_QTITEN]));
                Word.Font(M_NMFONT);
                Word.FontSize(M_TAMFON);//muda o tamanho da fonte
                If not uFuncoes.Empty(W_UNITEN) Then
                     Word.insert( Format('%-11s', [W_UNITEN]))
                Else
                     Word.insert( Format('%-11s', ['..']));
                Word.Font(M_NMFONT);
                Word.FontSize(M_TAMFON);//muda o tamanho da fonte
                Word.insert( Format('%12s',  [FormatFloat('###,###,##0.#0',W_VLUNIT)]));
                Word.Font(M_NMFONT);
                Word.FontSize(M_TAMFON);//muda o tamanho da fonte
                Word.insert( Format('%12s',  [FormatFloat('###,###,##0.#0',W_VLSUBT)])+M_QUEBRA);
                //
                M_NRITEM := M_NRITEM + 1;
                //
                dmConsultas.cdsProdVenda.Next;
           End;
           //
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(uFuncoes.Replicate('-', 70 )+ M_QUEBRA);
           //
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(' '+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(' '+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(' '+ M_QUEBRA);
           //
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(' '+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.bold;//coloca negrito
           Word.insert('TOTAL..........:    '+Format('%15s', [FormatFloat('###,##0.#0',W_TOVEND)])+ M_QUEBRA);
           //Word.insert('TOTAL A PAGAR..:    '+Format('%15s', [FormatFloat('###,##0.#0',W_VLVEND)])+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(' '+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           If (W_VLDESC > 0) Then
               Word.insert('DESCONTO.......:    '+Format('%15s',[FormatFloat('###,##0.#0',W_VLDESC)])+ M_QUEBRA);
           //   Imprime Total a Pagar
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.bold;//coloca negrito
           Word.insert('TOTAL A PAGAR..:    '+Format('%15s',[FormatFloat('###,##0.#0',W_VLVEND)])+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(' '+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(' '+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(' '+ M_QUEBRA);
           //  Imprime Modalidades
           dm.cdsMovimentoCaixa.Close;
           With dm.dstMovimentoCaixa do
           Begin
                Active := False;
                Commandtext := 'Select * from MOVIMENTO_CAIXA '+
                       'Where (MCA_LOJA = :pLOJA) and (MCA_VENDA = :pVENDA)';
                Params.ParamByName('pLOJA').AsInteger  := M_CDLOJA;
                Params.ParamByName('pVENDA').AsInteger := M_NRVEND;
                Active := True;
           End;
           dm.cdsMovimentoCaixa.Open;
           //
           dm.cdsMovimentoCaixa.First;
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert('FORMA DE PAGAMENTO'+ M_QUEBRA);
           While not (dm.cdsMovimentoCaixa.Eof) do
           Begin
                W_MNMODA := dm.cdsMovimentoCaixa.FieldByName('MCA_NOMEMODA').AsString;
                W_VLMODA := dm.cdsMovimentoCaixa.FieldByName('MCA_VLMODALIDADE').AsCurrency;
                M_VLTROC := M_VLTROC + dm.cdsMovimentoCaixa.FieldByName('MCA_VLTROCO').AsCurrency;
                //
                Word.Font(M_NMFONT);
                Word.FontSize(M_TAMFON);//muda o tamanho da fonte
                Word.insert(Format('%-20s',[ W_MNMODA + '  :  ']));
                Word.Font(M_NMFONT);
                Word.FontSize(M_TAMFON);//muda o tamanho da fonte
                Word.insert(Format('%15s',[FormatFloat('###,###,##0.#0',W_VLMODA)])+ M_QUEBRA);
                // Proximo
                dm.cdsMovimentoCaixa.Next;
           End;
           // Imprime troco
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(' '+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           //Writeln(Impressora,Format('%-20s',['TROCO..........:    '])+Format('%15s',[FormatFloat('###,##0.00',StrtoFloat(AllTrim(FloattoStr(M_VLTROC))))]));
           { Salta três linhas }
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(' '+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(' '+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(' '+ M_QUEBRA);
           //
           Word.CenterPara;
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(uFuncoes.Replicate('-',50)+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           If (M_NMCLIE <> 'VENDA AO CONSUMIDOR') Then
               Word.insert(M_NMCLIE+ M_QUEBRA)
           Else
               Word.insert('ASSINATURA DO CLIENTE'+ M_QUEBRA);
           { Salta Três linhas }
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(' '+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(' '+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(' '+ M_QUEBRA);
           { Imprime separador}
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(''+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert('OBRIGADO POR SUA PREFERENCIA'+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(uFuncoes.Replicate('-', 70 )+ M_QUEBRA);
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert('DESENVOLVIDO POR : INFOG2 TECNOLOGIA - (86)3226-4510'+ M_QUEBRA);
           { Salta uma linhas }
           Word.Font(M_NMFONT);
           Word.FontSize(M_TAMFON);//muda o tamanho da fonte
           Word.insert(' '+ M_QUEBRA);
           //Word.ActiveDocument.SaveAs(FileName := 'c:\venda.doc');
           Word.FileSaveAs(ExtractFilePath( Application.ExeName )+'VENDA.DOC', 1); //Salva o arquivo
     finally
            { Fecha documento }
            //Word.ActiveDocument.Close(SaveChanges := 0);
     end;
  finally
       { Fecha o Word }
       //Word.Quit;
       PostMessage(FindWindow(nil, 'venda - Microsoft Word'), WM_CLOSE,0,0);
  end;
  //
End;

Procedure VIA_PEDIDO(M_NRPEDI, M_FMPAGA : Integer; M_FLSEGV,M_NMFORN : String);
begin
     udm.aFluxoCalc := 'S';
     With dmRelatorios.cdsvendas do
      begin
           Close;
           Params.ParamByName('pPEDIDO').AsInteger := M_NRPEDI;
           Open;
           //
      End;
      //
      If not (dmRelatorios.cdsvendas.IsEmpty) Then
      begin
           With dmRelatorios do
            begin
                  //Dm.FilterCDS(Dm.CdsEmpresas, fsString, '1');
                  dm.CdsEmpresas.Close;
                  With dm.SdsEmpresas do
                  Begin
                       Active := False;
                       CommandText := 'SELECT * FROM EMPRESAS Where (EMP_CODIGO = :pCODIGO)';
                       Params.ParamByName('pCODIGO').AsInteger := 1;
                       Active := true;
                  End;
                  dm.CdsEmpresas.Open;
                  //
                  udm.fPeFrete := dmRelatorios.cdsVendasMOV_PERC_FRETE.AsFloat;
                  //
                  TOTAIS;
                  with ppRepVendas do
                  Begin
                       txtPedido.Caption         := 'Nº.: ' + StrZero(InttoStr(M_NRPEDI),7);
                       txtFormaPagamento.Caption := GetCondicaoPagamento(dmRelatorios.cdsVendasMOV_TABELA_PLANO.AsInteger) + ' - '+
                         GetFormaPagamento(GetModaPedido(M_NRPEDI));
                       txtNmRepresentanta.Caption   := Dm.CdsEmpresasEMP_RAZAO.AsString;
                       txtFoneRepresentante.Caption := FormataFone(Dm.CdsEmpresasEMP_NRFONE.AsString);
                       //
                       If not Empty(M_NMFORN) Then
                          txtFornecedor.Caption     := M_NMFORN
                       Else
                          txtFornecedor.Caption     := getFornecedor(M_NRPEDI);
                       //
                       txtCDCLIE.Caption         := StrZero(dmRelatorios.cdsvendas.FieldByName('MOV_CLIENTE').AsString,7);
                       txtFone2.Caption          := FormataFONE(dmRelatorios.cdsVendasCLI_FONE1.AsString);
                       txtFax2.Caption           := FormataFONE(dmRelatorios.cdsVendasCLI_FAX.AsString);
                       //If FileExists('TEXTO.TXT') Then
                       lbl_Rodape.Caption     := Dm.CdsConfigCFG_MENS_RODAPE.AsString;
                       //getRodape('TEXTO.TXT');
                       //
                       If (dmRelatorios.cdsVendasMOV_TIPO_FRETE.AsString = 'F') Then
                       begin
                           cbkFOB.Checked := True;
                           cbkCIF.Checked := False;
                       End;
                       //
                       If (dmRelatorios.cdsVendasMOV_TIPO_FRETE.AsString = 'C') Then
                       begin
                           cbkFOB.Checked := False;
                           cbkCIF.Checked := True;
                       End;
                       //
                       If (dmRelatorios.cdsVendasMOV_PERC_FRETE.AsFloat > 0) Then
                       begin
                           txtPercFrete.Caption := FormatFloat('##0.#0',dmRelatorios.cdsVendasMOV_PERC_FRETE.AsFloat)+'%';
                           //
                           txtValorFrete.Caption := FormatFloat('###,##0.#0',M_VLFRET);
                       End
                       else
                       begin
                            txtPercFrete.Caption  := '';
                            txtValorFrete.Caption := '';
                       End;
                       // novo observação
                       txtObservacao.Text := dmRelatorios.cdsVendasMOV_OBSERVACAO.AsString;
                       txtPercIPI.Text    := FormatFloat('##0.#0',dmConsultas.cdsItensVendasITE_VALIPI.AsFloat)+' %';
                       //
                       PrintReport;
                  End;
            End;    // With - dmRelatorios
      End;
End;


Procedure VIA_ORCAMENTO(M_NRORCA, M_FMPAGA : Integer; M_FLSEGV, M_NMFORN, M_NMFORM : String);
Var
  M_NOME, M_ENDERE, BAIRRO, CEP, CIDADE, UF, FONE, FAX, CNJP, INSCESTAD : String;
begin
      //
     With dmConsultas.qryConsulta  do
      begin
           Close;
           SQL.Clear;
           SQL.Add('Select * from ORCAMENTOS Where (ORC_PEDIDO = :pPEDIDO)');
           Params.ParamByName('pPEDIDO').AsInteger := M_NRORCA;
           Open;
           //
      End;
      If not (dmConsultas.qryConsulta.IsEmpty) Then
      begin
       With dm.CdsClientes do
        begin
           //dm.SdsClientes.ParamByName('PCODIGO').AsInteger :=
           Dm.FilterCDS(dm.CdsClientes, fsInteger, dmConsultas.qryConsulta.FieldBYName('ORC_CLIENTE').AsString);
           //
           If Not (dm.CdsClientes.IsEmpty) Then
           begin
             //M_NOME   := dm.CdsClientes.FieldByName('CLI_FANTASIA').AsString;
             M_NOME   := dm.CdsClientes.FieldByName('CLI_RAZAO').AsString;
             M_ENDERE := dm.CdsClientes.FieldByName('CLI_ENDERECO').AsString;
             BAIRRO   := DM.CdsClientesBAI_NOME.AsString;
             CEP      := dm.CdsClientes.FieldByName('CLI_CEP').AsString;
             CIDADE   := GetCidade(dm.CdsClientes.FieldByName('CID_CODIGO').AsInteger);
             UF       := dm.CdsClientes.FieldByName('CLI_UFCLIENTE').AsString;
             FONE     := FormataFONE(dm.CdsClientes.FieldByName('CLI_FONE1').AsString);
             FAX      := FormataFONE(dm.CdsClientes.FieldByName('CLI_FAX').AsString);
             CNJP     := FormataCNPJ(dm.CdsClientes.FieldByName('CLI_CGC').AsString);
             INSCESTAD := dm.CdsClientes.FieldByName('CLI_INSCESTADUAL').AsString;
           End
           Else
               ShowMessage('Cliente não encontrado');
        End;
        //
           With dmRelatorios do
            begin
                  TOTAIS;
                  with ppRepOrcamento do
                  Begin
                       //
                       txtFornecedor2.Caption := M_NMFORN;
                       txtOrcamento.Caption := 'Nº. '+ StrZero(InttoStr(M_NRORCA),7);
                       txtRazao.Caption    := M_NOME;
                       txtEndereco.Caption := M_ENDERE+ ', '+dm.CdsClientes.FieldBYName('CLI_NUMERO').AsString;
                       txtEndereco2.Caption := txtEndereco.Caption;
                       txtCodigo.Caption   := StrZero(dm.CdsClientes.FieldByName('CLI_CODIGO').AsString,7);
                       txtCep.Caption      := CEP;
                       txtCidade2.Caption  := CIDADE;
                       txtUF.Caption       := UF;
                       txtFone.Caption     := FONE;
                       txtFax.Caption      := Fax;
                       txtBairro.Caption   := BAIRRO;
                       txtCNPJ.Caption     := CNJP;
                       txtInscricao.Caption := INSCESTAD;
                       //
                       txtCondPaga.Caption       := M_NMFORM; 
                       //GetFormaPagamento(GetModaPedido(M_NRORCA));
                       //'';M_FMPAGA;
                       //
                       PrintReport;
                  End;
            End;    // With - dmRelatorios
      End;
End;

Procedure CARREGAR_ITENS(M_NRPEDI : Integer);
Var
    M_NRITEM : Integer;
Begin
     dmConsultas.cdsItensVendas.Close;
     dmConsultas.cdsItensVendas.Open;
     dmConsultas.cdsItensVendas.EmptyDataSet;
     //
     dm2.cdsConsulta.Close;
     With dm2.dstConsulta do
      begin
           Active := False;
           CommandText := 'Select MP.MOP_PEDIDO, MP.MOP_PRODUTO, MP.MOP_QUANTIDADE, MP.MOP_UNIDADE, MOP_CODCOR, ' +
                          ' MP.MOP_VALOR, MP.MOP_DESCONTO, MP.MOP_VALIPI, P.PRO_DESCRICAO, P.PRO_IPI, P.PRO_REFERENCIA,' +
                          ' (Select C.COR_DESCRICAO From CORES C Where (P.PRO_COR = C.COR_CODIGO)) AS COR ' +
                          ' from PROVENDAS MP ' +
                          ' INNER join PRODUTOS P ON MP.MOP_PRODUTO = P.PRO_CODIGO ' +
                          ' Where (MP.MOP_PEDIDO = :pPEDIDO)';
           Params.ParamByName('pPEDIDO').AsInteger := M_NRPEDI;
           Active := True;
      End;
     dm2.cdsConsulta.FetchParams;
     dm2.cdsConsulta.Open;
     //
     If not (dm2.cdsConsulta.IsEmpty) Then
     begin
       with dm2.cdsConsulta do
        begin
           DisableControls;
           First;
           M_NRITEM := 1;
           While not (EoF) do
            begin
                 dmConsultas.cdsItensVendas.Append;
                 //
                 dmConsultas.cdsItensVendas.FieldByName('ITE_NRITEN').AsString := StrZero(InttoStr(M_NRITEM),3);
                 dmConsultas.cdsItensVendas.FieldByName('ITE_CDITEN').AsString := FieldByName('MOP_PRODUTO').AsString;
                 dmConsultas.cdsItensVendas.FieldByName('ITE_NMDESC').AsString := FieldByName('PRO_DESCRICAO').AsString;
                 dmConsultas.cdsItensVendas.FieldByName('ITE_QTITEN').AsFloat  := FieldByName('MOP_QUANTIDADE').AsFloat;
                 dmConsultas.cdsItensVendas.FieldByName('ITE_CDUNID').AsString := FieldByName('MOP_UNIDADE').AsString;
                 dmConsultas.cdsItensVendas.FieldByName('ITE_VLUNIT').AsCurrency := FieldByName('MOP_VALOR').AsCurrency;
                 dmConsultas.cdsItensVendas.FieldByName('ITE_VLDESC').AsFloat  := FieldByName('MOP_DESCONTO').AsFloat;
                 dmConsultas.cdsItensVendas.FieldByName('ITE_REFERE').AsString := FieldByName('PRO_REFERENCIA').AsString;
                 dmConsultas.cdsItensVendas.FieldByName('ITE_CODCOR').AsInteger := FieldByName('MOP_CODCOR').AsInteger;
                 dmConsultas.cdsItensVendas.FieldByName('ITE_NOMCOR').AsString := uFuncoes.GetCor(FieldByName('MOP_CODCOR').AsInteger);
                 dmConsultas.cdsItensVendas.FieldByName('ITE_VALIPI').AsFloat :=  FieldByName('MOP_VALIPI').AsFloat;
                 //
                 dmConsultas.cdsItensVendas.Post;
                 //
                 M_NRITEM := M_NRITEM + 1;
                 Next;
            End;
           EnableControls;
       End;
     End;
End;

Procedure CARREGAR_ITENS_ORCAMENTO(M_NRORCA : Integer);
Var
    M_NRITEM : Integer;
Begin
     dmConsultas.cdsItensVendas.Close;
     dmConsultas.cdsItensVendas.Open;
     dmConsultas.cdsItensVendas.EmptyDataSet;
     //
     dm2.cdsConsulta.Close;
     With dm2.dstConsulta do
      begin
           Active := False;
           CommandText := 'Select MP.ITO_PEDIDO, MP.ITO_PRODUTO, MP.ITO_QUANTIDADE, MP.ITO_UNIDADE, ' +
                          ' MP.ITO_VALOR, MP.ITO_DESCONTO, P.PRO_DESCRICAO, P.PRO_IPI, ' +
                          ' (Select C.COR_DESCRICAO From CORES C Where (P.PRO_COR = C.COR_CODIGO)) AS COR ' +
                          ' from ITENS_ORCAMENTO MP ' +
                          ' INNER join PRODUTOS P ON MP.ITO_PRODUTO = P.PRO_CODIGO ' +
                          ' Where (MP.ITO_PEDIDO = :pPEDIDO)';
           Params.ParamByName('pPEDIDO').AsInteger := M_NRORCA;
           Active := True;
      End;
     dm2.cdsConsulta.FetchParams;
     dm2.cdsConsulta.Open;
     //
     If not (dm2.cdsConsulta.IsEmpty) Then
     begin
       with dm2.cdsConsulta do
        begin
           DisableControls;
           First;
           M_NRITEM := 1;
           While not (EoF) do
            begin
                 dmConsultas.cdsItensVendas.Append;
                 //
                 dmConsultas.cdsItensVendas.FieldByName('ITE_NRITEN').AsString := StrZero(InttoStr(M_NRITEM),3);
                 dmConsultas.cdsItensVendas.FieldByName('ITE_CDITEN').AsString := FieldByName('ITO_PRODUTO').AsString;
                 dmConsultas.cdsItensVendas.FieldByName('ITE_NMDESC').AsString := FieldByName('PRO_DESCRICAO').AsString;
                 dmConsultas.cdsItensVendas.FieldByName('ITE_QTITEN').AsFloat  := FieldByName('ITO_QUANTIDADE').AsFloat;
                 dmConsultas.cdsItensVendas.FieldByName('ITE_CDUNID').AsString := FieldByName('ITO_UNIDADE').AsString;
                 dmConsultas.cdsItensVendas.FieldByName('ITE_VLUNIT').AsCurrency := FieldByName('ITO_VALOR').AsCurrency;
                 dmConsultas.cdsItensVendas.FieldByName('ITE_VLDESC').AsFloat  := FieldByName('ITO_DESCONTO').AsFloat;
                 dmConsultas.cdsItensVendas.FieldByName('ITE_VALIPI').AsFloat  := FieldByName('PRO_IPI').AsFloat;
                 //
                 dmConsultas.cdsItensVendas.Post;
                 //
                 M_NRITEM := M_NRITEM + 1;
                 Next;
            End;
           EnableControls;
       End;
     End;
End;

Procedure TOTAIS;
Var
    M_SUBTOT, M_TOTAL, M_VALIPI, M_TODESC, fTotalItens : Double;
Begin
      M_SUBTOT := 0;
      M_TOTAL  := 0;
      M_VALIPI := 0;
      M_TODESC := 0;
      aValor_Frete := 0;
      fTotalItens := 0;
      //
      With dmConsultas.cdsItensVendas do
      begin
           First;
           While not (EOF) do
            begin
                 M_SUBTOT :=  M_SUBTOT + (FieldByName('ITE_VLUNIT').AsCurrency*FieldByName('ITE_QTITEN').AsFloat);
                 M_TOTAL  := M_TOTAL  + FieldByName('ITE_VLSUBT').AsFloat;
                 IF (FieldByName('ITE_VLDESC').AsFloat > 0 ) Then
                    M_TODESC :=  M_TODESC + (Gerapercentual(Arredondar(FieldByName('ITE_VLUNIT').AsCurrency*FieldByName('ITE_QTITEN').AsFloat,2), FieldByName('ITE_VLDESC').AsFloat));
                 //M_VALIPI := M_VALIPI + (FieldByName('ITE_VLSUBT').AsCurrency - FieldByName('ITE_VLUNIT').AsCurrency);
                 M_VALIPI :=  M_VALIPI + (Gerapercentual(Arredondar(FieldByName('ITE_VLUNIT').AsCurrency*FieldByName('ITE_QTITEN').AsFloat,2), FieldByName('ITE_VALIPI').AsFloat));
                 //M_SUBTOT :=  M_SUBTOT +
                 fTotalItens := fTotalItens + FieldByName('ITE_QTITEN').AsFloat;
                 //
                 next;
            End;
      End;

      //+ M_VALIPI - M_TODESC;
      //
      if (udm.fPeFrete > 0 ) Then
         M_VLFRET := Gerapercentual(M_SUBTOT, udm.fPeFrete)
         //CalcularFrete(M_SUBTOT, fPeFrete)
      Else
         M_VLFRET := 0;
      //
      uDm.aValor_Frete := M_VLFRET;
      //
      With dmRelatorios do
      begin
           txtSubTotal.Caption := FormatFloat('##,###,##0.00',M_SUBTOT);
           txtDesconto.Caption := FormatFloat('##,###,##0.00',M_TODESC);
           txtIPI.Caption      := FormatFloat('###,##0.00',M_VALIPI);
           txtTOTAL.Caption    := FormatFloat('##,###,##0.00',M_TOTAL);
      End;
      //
      With dmRelatorios.rvPedido do
        begin
             // Totais
             SetParam('pSUBTOTAL',FormatFloat('##,###,##0.00',M_SUBTOT));
             SetParam('pDESCONTO',FormatFloat('##,###,##0.00',M_TODESC));
             SetParam('pIPI',FormatFloat('###,##0.00',M_VALIPI));
             SetParam('pTOTAL',FormatFloat('##,###,##0.00',M_TOTAL));
             SetParam('pTOTAL_ITENS','QUANT.ITENS: '+inttoStr(dmConsultas.cdsItensVendas.RecordCount)
                         +   '      TOTAL DE ITENS: '+FloattoStr(fTotalItens));
        End;
      //
      With dmRelatorios do
      begin
           txtSubTotal2.Caption := FormatFloat('##,###,##0.00',M_SUBTOT);
           //txtDesconto.Caption := FormatFloat('##,###,##0.00',M_TODESC);
           txtIPI2.Caption      := FormatFloat('###,##0.00',M_VALIPI);
           txtTOTAL2.Caption    := FormatFloat('##,###,##0.00',M_TOTAL);
      End;
End;

Function GetTabela(M_NMTABE: string): Integer;
begin
     With dmConsultas.qryConsulta do
     Begin
          SQL.Clear;
          Close;
          Sql.Add('Select PRC_CODIGO, PRC_DESCRICAO from TAB_PRECOS');
          Sql.Add('Where (PRC_DESCRICAO = :pNOME)');
          Params.ParamByName('pNOME').AsString := M_NMTABE;
          Open;
     End;
     //
     If not (dmConsultas.qryConsulta.IsEmpty) Then
       result := dmConsultas.qryConsulta.FieldByname('PRC_CODIGO').AsInteger;
End;

Function GetNomeTabela( M_CDTABE : Integer) : string;
begin
     With dmConsultas.qryConsulta do
     Begin
          SQL.Clear;
          Close;
          Sql.Add('Select PRC_CODIGO, PRC_DESCRICAO from TAB_PRECOS');
          Sql.Add('Where (PRC_CODIGO = :pCODIGO)');
          Params.ParamByName('pCODIGO').AsInteger := M_CDTABE;
          Open;
     End;
     //
     If not (dmConsultas.qryConsulta.IsEmpty) Then
       result := dmConsultas.qryConsulta.FieldByname('PRC_DESCRICAO').AsString;
End;

Function ORCAMENTO
(M_TOTVEN, M_VLDESC : Double ; M_CDLOJA, M_CDCAIX, M_IMPRES, M_CDCLIE, M_CDTABE, W_CDMODA : Integer;
M_DTVEND : TDate; M_NMCLIE, M_HOVEND, M_JANVEN, M_ENDCLI, M_BAICLI, M_CIDCLI, M_NUMCLI : String) : Boolean;
Var
   W_NRVEND, M_CAMINH, M_NMVEND : String;
   M_VLDIGI, M_TOENTR, M_TOVEND : Real;
   M_CDVEND : Integer;
   M_FLSUPE : Boolean;
   M_VLREAL, M_VLPERC  : Double;
   M_FLIMPR, W_TOTAPC : Integer;
   //
   M_TPACDE, W_NRSEQU : String;
   M_FLTROC, M_FLOTEF : Boolean;
   M_FMPGTO ,M_OPTEF, M_CDMODA, M_NMMODA, M_HOMOVI :String;
   M_VLMODA, M_VLVEND : Real;
   M_DTMOVI : TDate;
   M_VLCOMP, M_VLCUST, M_VLVENDPRO : Real;
   M_CDNATU, M_QTPARC : Integer;
   M_QTANTE, M_QTATUA, M_VLTROC : Double;
   M_TPMOVI, M_MSCUPO, W_FLVEND, M_CDPROD : String;
   M_SEQREC, iRetorno : Integer;
   TD : TTransactionDesc;
   M_FLVEND : boolean;
   M_NRITEM : INTEGER;
begin
       result := false;
       dm.parametros;
       M_MSCUPO := dm.CdsConfig.FieldByName('CFG_MENSAGEM_CUPOM').AsString;
       M_FLTROC := False;
       M_FLOTEF := False;
       //
       M_TPMOVI := 'V';
       M_VLTROC := 0;
       M_VLVEND := M_TOTVEN;
       M_TOVEND := M_VLVEND;
       //
       M_VLMODA := 0.0;
       M_TOENTR := 0.0;
       W_FLVEND := 'N';
       // testa se os valores das modalidades são maiores que zero
           dmConsultas.cdsModalidade.open;
           dmConsultas.cdsModalidade.First;
           dmConsultas.cdsModalidade.DisableControls;
           //
           While not (dmConsultas.cdsModalidade.Eof) do
           begin
                dmConsultas.cdsModalidade.Edit;
                M_TOENTR := M_TOENTR+dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
                // proximo
                dmConsultas.cdsModalidade.Next;
           End;
           //
           dmConsultas.cdsModalidade.EnableControls;
           //                        M_VLVEND
           If (Arredondar(M_TOENTR,2) < Arredondar(M_TOVEND,2)) Then
           begin
                Application.MessageBox('O valor de entrada menor que'+#13
                                  +'o valor Total da Venda.','ATENÇÃO', MB_OK+MB_ICONSTOP);
                dmConsultas.cdsModalidade.First;
                exit;                     // sair da procedure.
           end;
       // testa se modalidades é parcelada
       dmConsultas.cdsModalidade.First;
       dmConsultas.cdsModalidade.DisableControls;
       //
       While not (dmConsultas.cdsModalidade.Eof) do
       begin
            dmConsultas.cdsModalidade.Edit;
            If (dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency > 0)
              AND (dmConsultas.cdsModalidade.FieldByName('MOD_FLFIXA').AsString <> 'D')
              and (dmConsultas.cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger > 0) Then
            begin
                 W_TOTAPC := dmConsultas.cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger;
                 //
                 criar_parcelas(W_TOTAPC);
                 Application.CreateForm(TfrmParcelas, frmParcelas);
                 with frmParcelas do
                    try
                         ufrmParcelas.M_CDMODA := dmConsultas.cdsModalidade.FieldByName('MOD_CODIGO').AsInteger;
                         ufrmParcelas.M_TOMODA := dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
                         ufrmParcelas.M_TPMODA := dmConsultas.cdsModalidade.FieldByName('MOD_FLFIXA').AsString;
                         lbl_NMMODA.Caption    := dmConsultas.cdsModalidade.FieldByName('MOD_NOME').AsString;
                         lbl_VLTOTAL.Caption   := FormatFloat('###,###,##0.#0',dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency);
                         showmodal;
                    finally
                         free;
                    end;
            End;
            // proximo
            dmConsultas.cdsModalidade.Next;
       End;
       //
       dmConsultas.cdsModalidade.EnableControls;
       //                        M_VLVEND
       If (Arredondar(M_TOENTR,2) < Arredondar(M_TOVEND,2)) Then
       begin
            Application.MessageBox('O valor de entrada menor que'+#13
                                  +'o valor Total da Venda.','ATENÇÃO', MB_OK+MB_ICONSTOP);
            dmConsultas.cdsModalidade.First;
            exit;                     // sair da procedure.
       end;
       // Inicia um transação no BD
       TD.TransactionID  := M_CDCAIX;
       TD.IsolationLevel := xilREADCOMMITTED;
       Dm.SqlAdmin.StartTransaction(TD);
       //
       Try
           // Inicia o fechamento do cupom com o uso das formas de pagamento.
           M_DTMOVI := M_DTVEND;
           M_HOMOVI := M_HOVEND;
           // Fechamento do orçamento
           dmConsultas.cdsModalidade.DisableControls;
           dmConsultas.cdsModalidade.First;
           While not (dmConsultas.cdsModalidade.Eof) do
                 begin
                        If (dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency > 0) Then
                           begin
                                M_CDMODA := dmConsultas.cdsModalidade.FieldByName('MOD_CODIGO').AsString;
                                M_NMMODA := dmConsultas.cdsModalidade.FieldByName('MOD_NOME').AsString;
                                M_VLMODA := dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
                                //  Formas de Pagamento
                           End;
                         //
                        dmConsultas.cdsModalidade.Next;
                 End;
            //
            {With dmConsultas.cdsCaixa2 do
                  Begin
                       Close;
                       Params.ParamByName('pCAIXA').AsInteger   := M_CDCAIX;
                       Params.ParamByName('pSITUACAO').AsString := 'A';
                       Open;
                  End;
            //
            If not (dmConsultas.cdsCaixa2.IsEmpty) Then}
            M_CDLOJA := Dm.GetLojaCaixaAberto(M_CDCAIX);
            //dmConsultas.cdsCaixa.FieldByname('CAI_LOJA').AsInteger;
            //
            dm.parametros;
            //
                  {While (W_FLVEND = 'N') do
                  Begin
                    Dm.CdsConfig.edit;
                    Dm.CdsConfig.FieldByName('CFG_VENDA').AsFloat     :=
                         Dm.CdsConfig.FieldByName('CFG_VENDA').AsFloat + 1;
                    Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat :=
                         Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat+1;
                    M_CDNATU := Dm.CdsConfig.FieldByName('CFG_NATUREZAVENDA').AsInteger;
                    W_NRVEND := uFuncoes.StrZero(FloattoStr(Dm.CdsConfig.FieldByName('CFG_VENDA').AsFloat),7);
                    W_NRSEQU := uFuncoes.StrZero(FloattoStr(Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat),10);
                    Dm.CdsConfig.Post;
                    Dm.CdsConfig.ApplyUpdates(0);
                    //
                    //M_TOVEND := StrtoFloat(txtTOVEND.Caption);
                    M_VLTROC := M_TOENTR-M_TOVEND;
                    // Tabela Vendas
                    Dm.cdsmovimento.Close;
                    With Dm.dstMovimento do
                    Begin
                       Active := False;
                       CommandText := 'Select * from VENDAS Where (MOV_PEDIDO = :pPEDIDO)';
                       Params.ParamByName('pPEDIDO').AsInteger := StrtoInt(W_NRVEND);
                       Active := True;
                    End;
                    Dm.cdsmovimento.Open;
                     // Novo registro de Venda
                    If (Dm.cdsMovimento.IsEmpty) Then
                         W_FLVEND := 'S'
                    Else
                         W_FLVEND := 'N';
                    //
                  End;  // fim-do-enquanto}
            //
            Dm.CdsConfig.edit;
            Dm.CdsConfig.FieldByName('CFG_ORCAMENTO').AsFloat     :=
                         Dm.CdsConfig.FieldByName('CFG_ORCAMENTO').AsFloat + 1;
            M_CDNATU := Dm.CdsConfig.FieldByName('CFG_NATUREZAVENDA').AsInteger;
            W_NRVEND := uFuncoes.StrZero(FloattoStr(Dm.CdsConfig.FieldByName('CFG_ORCAMENTO').AsFloat),7);
            //W_NRSEQU := uFuncoes.StrZero(FloattoStr(Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat),10);
            Dm.CdsConfig.Post;
            Dm.CdsConfig.ApplyUpdates(0);
            //
            M_VLTROC := M_TOENTR-M_TOVEND;
            // Tabela Orcamentos
            With Dm2.cdsOrcamentos do
                Begin
                         Close;
                         //CommandText := 'Select * from VENDAS Where (MOV_PEDIDO = :pPEDIDO)';
                         Params.ParamByName('pPEDIDO').AsInteger := StrtoInt(W_NRVEND);
                         Open;
                End;
            // Novo registro de orçamento
            // Aqui
            With Dm2.cdsOrcamentos do
                    Begin
                       Append;
                       FieldByName('ORC_PEDIDO').AsInteger     := StrtoInt(W_NRVEND);
                       FieldByName('ORC_LOJA').AsInteger       := M_CDLOJA;
                       //FieldByName('MOV_SEQUENCIA').AsInteger  := StrtoInt(W_NRSEQU);
                       FieldByName('ORC_DATAVENDA').AsDateTime := M_DTMOVI;
                       FieldByName('ORC_HORAVENDA').AsString   := M_HOMOVI;
                       FieldByName('ORC_VALOR').AsCurrency     := M_TOVEND;
                       FieldByName('ORC_TROCO').AsCurrency     := M_VLTROC;
                       FieldByName('ORC_SITUACAO').AsString    := 'F';
                       FieldByName('ORC_VENDEDOR').AsInteger   := M_CDVEND;
                       FieldByName('ORC_DESCONTO').AsCurrency  := M_VLDESC;
                       FieldByName('ORC_CLIENTE').AsInteger    := M_CDCLIE;
                       FieldByName('ORC_NOMECLIENTE').AsString := M_NMCLIE;
                       FieldByName('ORC_TABELA').AsInteger     := M_CDTABE;
                       FieldByName('DOM_ENDERECO').AsString    := M_ENDCLI;
                       FieldByName('DOM_NUMERO').AsString      := M_NUMCLI;
                       FieldByName('DOM_BAIRRO').AsString      := M_BAICLI;
                       FieldByName('DOM_CIDADE').AsString      := M_CIDCLI;
                       FieldByName('ORC_MODALIDADE').AsInteger := W_CDMODA;
                       // Grava registro
                       Post;
                       ApplyUpdates(0);
            End;
            //
            Dm.cdsItensVendas.DisableControls;
            Dm.cdsItensVendas.First;
            M_NRITEM := 1;
            While not (Dm.cdsItensVendas.Eof) do
                 Begin
                      If (Dm.cdsItensVendas.FieldByName('ITE_FLCANC').AsString <> 'C') Then
                      Begin
                       // Tabela movimento produto
                       With dmConsultas.qryIncluir do
                       Begin
                            SQL.Clear;
                            Close;
                            SQL.Add('INSERT INTO ITENS_ORCAMENTO (ITO_PEDIDO, ITO_NRITEM,  ITO_PRODUTO, ITO_QUANTIDADE, ');
                            SQL.Add('ITO_UNIDADE, ITO_VALOR, ITO_DESCONTO, ITO_CUSTO, ITO_COMPRA)');
                            SQL.Add('VALUES (:pPEDIDO, :pNRITEM, :pPRODUTO, :pQUANTIDADE, ');
                            SQL.Add(':pUNIDADE, :pVALOR, :pDESCONTO, :pCUSTO, :pCOMPRA)');
                            //
                            Params.ParamByName('pPEDIDO').AsInteger  := StrtoInt(W_NRVEND);
                            Params.ParamByName('pNRITEM').AsInteger  := M_NRITEM;
                            Params.ParamByName('pPRODUTO').AsString  := Dm.cdsItensVendas.FieldByName('ITE_CDITEN').AsString;
                            Params.ParamByName('pQUANTIDADE').AsFloat := Dm.cdsItensVendas.FieldByName('ITE_QTITEN').AsFloat;
                            Params.ParamByName('pUNIDADE').AsString   := Dm.cdsItensVendas.FieldByName('ITE_CDUNID').AsString;
                            Params.ParamByName('pVALOR').AsCurrency   := Dm.cdsItensVendas.FieldByName('ITE_VLUNIT').AsCurrency;
                            Params.ParamByName('pDESCONTO').AsCurrency := Dm.cdsItensVendas.FieldByName('ITE_VLDESC').AsFloat;
                            Params.ParamByName('pCUSTO').AsCurrency   := Dm.cdsItensVendas.FieldByName('ITE_VLCOMP').AsCurrency;
                            Params.ParamByName('pCOMPRA').AsCurrency  := Dm.cdsItensVendas.FieldByName('ITE_VLCUST').AsCurrency;
                            //
                            ExecSQL;
                       End;  // fim-with
                     End;  //sim-se
                     //
                     M_NRITEM := M_NRITEM + 1; 
                     Dm.cdsItensVendas.Next; 
                 End; // fim-enquanto
                 //
                 M_FLVEND := False;
                 //
                 Application.MessageBox(pChar('Orçamento realizado com sucesso.'),
                              'ATENÇÃO',MB_ICONINFORMATION+ MB_OK+MB_APPLMODAL);
                 // Grava
                 Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
                 //
                 result := true;
       Except
            on Exc:Exception do
            begin
                  Application.MessageBox(PChar('Erro no fechamento do orçamento N.º '+W_NRVEND+#13
                        + Exc.Message), 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                  //  Cancelar transação no BD.
                  Dm.SqlAdmin.Rollback(TD);
            End;
       End;
End;

Function GetFormaPagamento(M_FMPAGA : Integer) : String;
Begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select MOD_CODIGO, MOD_NOME from MODALIDADE ');
           SQL.Add('Where (MOD_CODIGO = :pCODIGO)');
           Params.ParamByName('pCODIGO').AsInteger := M_FMPAGA;
           Open;
           //
           If not (IsEmpty) Then
               result := FieldByName('MOD_NOME').AsString
           Else
               result := 'NÃO ENCONTRADA';
           //
           Close;
      End;
End;

Function GetCondicaoPagamento(M_CDPAGA : Integer) : String;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select * from PLANO_PAGAMENTO Where (PLA_CODIGO = :pCODIGO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger := M_CDPAGA;
      open;
      If not (IsEmpty) Then
         result := FieldByName('PLA_DESCRICAO').AsString;
    finally
      free;
    end;
End;

Function GetModaPedido(M_NRPEDI : Integer) : INTEGER;
Begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select MCA_VENDA, MCA_MODALIDADE from MOVIMENTO_CAIXA ');
           SQL.Add('Where (MCA_VENDA = :pCODIGO)');
           Params.ParamByName('pCODIGO').AsInteger := M_NRPEDI;
           Open;
           //
           If not (IsEmpty) Then
               result := StrtoInt(Alltrim(FieldByName('MCA_MODALIDADE').AsString));
           //
           Close;
      End;
End;

function GetCor(M_CODCOR : integer) : String;
begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select COR_CODIGO, COR_DESCRICAO from CORES ');
           SQL.Add('Where (COR_CODIGO = :pCODIGO)');
           Params.ParamByName('pCODIGO').AsInteger := M_CODCOR;
           Open;
           //
           If not (IsEmpty) Then
               result := FieldByName('COR_DESCRICAO').AsString;
           //
           Close;
      End;
End;

function GetTipoCliente(M_NMTIPO : String) : integer;
Begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select TPC_CODIGO, TPC_DESCRICAO from TIPOCLIENTE ');
           SQL.Add('Where (TPC_DESCRICAO = :pDESCRICAO)');
           Params.ParamByName('pDESCRICAO').AsString := M_NMTIPO;
           Open;
           //
           If not (IsEmpty) Then
               result := FieldByName('TPC_CODIGO').AsInteger;
           //
           Close;
      End;
End;

function GetRegiao(M_NMREGI : String) : integer;
Begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select REG_CODIGO, REG_DESCRICAO from REGIAO ');
           SQL.Add('Where (REG_DESCRICAO = :pDESCRICAO)');
           Params.ParamByName('pDESCRICAO').AsString := M_NMREGI;
           Open;
           //
           If not (IsEmpty) Then
               result := FieldByName('REG_CODIGO').AsInteger;
           //
           Close;
      End;
End;

function GetCidade(M_CDCIDA : integer) : String;
Begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select CID_CODIGO, CID_NOME from CIDADES ');
           SQL.Add('Where (CID_CODIGO = :pCODIGO)');
           Params.ParamByName('pCODIGO').AsInteger := M_CDCIDA;
           Open;
           //
           If not (IsEmpty) Then
               result := FieldByName('CID_NOME').AsString;
           //
           Close;
      End;
End;

function GetBairro(M_CDCIDA, M_CDBAIR : integer) : String;
Begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select * from BAIRROS ');
           SQL.Add('Where (CID_CODIGO = :pCODIGO) AND (BAI_CODIGO = :pBAIRRO) ');
           Params.ParamByName('pCODIGO').AsInteger := M_CDCIDA;
           Params.ParamByName('pBAIRRO').AsInteger := M_CDBAIR;
           Open;
           //
           If not (IsEmpty) Then
               result := FieldByName('BAI_NOME').AsString;
           //
           Close;
      End;
End;

procedure Seleciona_Cliente(M_CDCLIE : Integer);
begin
     With dm.CdsClientes do
      Begin
           Close;
           dm.SdsClientes.ParamByName('PCODIGO').AsInteger := M_CDCLIE;
           Open;
       End;
End;

Function getFornecedor(M_NRPEDI : Integer) : String;
begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select H.HIS_DOCUMENTO , F.FOR_FANTASIA FROM HISTORICO H ');
           SQL.Add('INNER join PRODUTOS P ON H.HIS_PRODUTO = P.PRO_CODIGO ');
           SQL.Add('INNER join FORNECEDORES F ON P.FOR_CODIGO = F.FOR_CODIGO ');
           SQL.Add('Where (H.HIS_DOCUMENTO = :pDOCUMENTO) ');
           SQL.Add('Group by H.HIS_DOCUMENTO , F.FOR_FANTASIA ');
           Params.ParamByName('pDOCUMENTO').AsInteger := M_NRPEDI;
           Open;
           //
           If not (IsEmpty) Then
               result := FieldByName('FOR_FANTASIA').AsString
           Else
               result := 'FORNECEDOR NÃO ENCONTRADO';
           //
           Close;
      End;
End;

Function getFornecedorOrcamento(M_NRORCA : Integer) : String;
begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select I.ITO_PEDIDO,  F.FOR_FANTASIA FROM ITENS_ORCAMENTO I ');
           SQL.Add('INNER join PRODUTOS P ON I.ITO_PRODUTO = P.PRO_CODIGO ');
           SQL.Add('INNER join FORNECEDORES F ON P.FOR_CODIGO = F.FOR_CODIGO ');
           SQL.Add('Where (I.ITO_PEDIDO = :pDOCUMENTO) ');
           SQL.Add('Group by I.ITO_PEDIDO, F.FOR_FANTASIA');
           Params.ParamByName('pDOCUMENTO').AsInteger := M_NRORCA;
           Open;
           //
           If not (IsEmpty) Then
               result := FieldByName('FOR_FANTASIA').AsString
           Else
               result := 'FORNECEDOR NÃO ENCONTRADO';
           //
           Close;
      End;
End;      

Function getIPIProduto(M_CDPROD : String) : Double;
begin
     result := 0;
     //
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select PRO_IPI from PRODUTOS ');
           SQL.Add('Where (PRO_CODIGO = :pCODIGO)');
           Params.ParamByName('pCODIGO').AsString := M_CDPROD;
           Open;
           //
           If not (IsEmpty) Then
               result := FieldByName('PRO_IPI').AsFloat;
           //
           Close;
      End;
End;

Function getRodape(M_NMARQU : String): String;
Begin
      Result := percorreArquivoTexto(M_NMARQU);
End;

Function getModalidade(M_NMMODA : String) : Integer;
begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select MOD_CODIGO from MODALIDADE ');
           SQL.Add('Where (MOD_NOME = :pNOME)');
           Params.ParamByName('pNOME').ASString := M_NMMODA;
           Open;
           //
           If not (IsEmpty) Then
               result := FieldByName('MOD_CODIGO').AsInteger;
           //
           Close;
      End;
End;

function setCod_Barras(objCode : TCJVQRBarCode; M_CDBARR : String) : String;
Var
   M_VALOR : String;
begin
     //M_VALOR := RetZero(IDTransation,6);
     //objCode.Texto := M_VALOR + StrZero(M_CDBARR,7);
     objCode.Texto := StrZero(M_CDBARR,13);
     Result := objCode.Texto;
End;

function IDTransation : String;
Var
  i : integer;
Const
  srt = '0123456789';
begin
     for i := 1 to 2 do
      begin
           Randomize;
           Result := Result + srt[Random(Length(srt))+1];
      End;
End;

function RetZero(ZEROS:string;QUANT:integer):String;
var
I,Tamanho:integer;
aux: string;
begin
  aux:=zeros;
  Tamanho:=length(ZEROS);
  ZEROS:='';
  for I:=1 to quant-tamanho do
  ZEROS:=ZEROS+'0';
  aux:=aux+zeros;
  RetZero:=aux;
end;

// Gerae código de barras padrão EAN13

procedure GeraBarrasEAN13(CodBarras: string; Imagem: TCanvas);
const
  TabelaA: array[0..9] of string[7] = ('0001101', '0011001', '0010011', '0111101', '0100011', '0110001', '0101111', '0111011', '0110111', '0001011');
  TabelaB: array[0..9] of string[7] = ('0100111', '0110011', '0011011', '0011011', '0011101', '0111001', '0000101', '0010001', '0001001', '0010111');
  TabelaC: array[0..9] of string[7] = ('1110010', '1100110', '1101100', '1000010', '1011100', '1001110', '1010000', '1000100', '1001000', '1110100');
  TabAux: array[0..9] of string[6] = ('AAAAAA', 'AABABB', 'AABBAB', 'AABBBA', 'ABAABB', 'ABBAAB', 'ABBBAA', 'ABABAB', 'ABABBA', 'ABBABA');
var
  Codigo: string;
  Formato: string;
  PegaDaTabela: string;
  DecimoTerceiroDig: Byte;
  Cont: Byte;
begin
  Formato := '';
  Codigo := CodBarras;
  DecimoTerceiroDig := StrToIntDef(CodBarras[1], 0);
  {----------------------------------------------------------------------------}
  { Tendo o 13º dígito definido, posso definir o padrão de impressão das barras}
  { no primeiro conjunto de 6 dígitos baseado na tabela Auxiliar. }
  {----------------------------------------------------------------------------}
  PegaDaTabela := TabAux[DecimoTerceiroDig] + 'CCCCCC';
  Formato := Formato + '101'; //--> Barra Auxiliar de Guarda 'Esquerda'
  for Cont := 1 to Length(PegaDaTabela) do
  begin

    case PegaDaTabela[Cont] of
      'A': Formato := Formato + TabelaA[StrToInt(Codigo[Cont + 1])];
      'B': Formato := Formato + TabelaB[StrToInt(Codigo[Cont + 1])];
      'C': Formato := Formato + TabelaC[StrToInt(Codigo[Cont + 1])];
    end;

    if Cont = 6 then
      Formato := Formato + '01010'; //--> Barra Auxiliar de Guarda 'Central'

  end;
  Formato := Formato + '101'; //--> Barra Auxiliar de Guarda 'Direita'

  //------ Desenha o código alfa-numérico na imagem
  Imagem.Font.Size := 10;
  Imagem.Brush.Color := ClWhite;
  Imagem.Pen.Color := ClBlack;
  Imagem.TextOut(02, 51, Copy(CodBarras, 01, 01));
  Imagem.TextOut(13, 51, Copy(CodBarras, 02, 06));
  Imagem.TextOut(60, 51, Copy(CodBarras, 08, 06));
  //------ Desenha as barras na imagem
  DesenhaBarras(Formato, Imagem);
end;

procedure DesenhaBarras(SequenciaHexa: string; Imagem: TCanvas);
var
  X, Y, H: LongInt;
  A, B, C, D: TPoint;
  I: Boolean;
begin

  Imagem.Brush.Color := ClWhite;
  Imagem.Pen.Color := ClBlack;
  x := 10;
  i := True;
  for y := 1 to Length(SequenciaHexa) do
  begin
    if SequenciaHexa[y] = '0' then
      Imagem.Pen.Color := ClWhite
    else
      Imagem.Pen.Color := ClBlack;
    h := 1;
    a.x := x;
    a.y := 0;
    b.x := x;
    b.y := 50;
    c.x := x + h - 1;
    c.y := 50;
    d.x := x + h - 1;
    d.y := 0;
    case Y of
      1..3, 46..50, 93..95:
        begin
          b.y := 55;
          c.y := 55;
        end;
    end;
    Imagem.Polygon([A, B, C, D]);
    i := not (i);
    x := x + h;
  end;

end;

function SetAvista(aValor, aTotal : Double) : Double;
begin
     result := Gerapercentual(aTotal,Arredondar((aValor/aTotal) * 100,2));
End;

function SetValorDesc(aVenda : integer; aDesconto: Double) : Double;
Var
   W_QTITEM : Integer;
begin
     // pegar a quantidade de itens do produto na venda
     W_QTITEM := getQuantItemVenda(aVenda);
     //
     Result := Arredondar(aDesconto / W_QTITEM,2);
End;

function SetValorAcre(aVenda : integer; aAcrescimo: Double) : Double;
Var
   W_QTITEM : Integer;
begin
     // pegar a quantidade de itens do produto na venda
     W_QTITEM := getQuantItemVenda(aVenda);
     //
     Result := Arredondar(aAcrescimo / W_QTITEM,2);
End;

function GetQuantItemVenda(aVenda : integer) : integer;
begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select H.his_documento, SUM(H.HIS_MOVIMENTO) as QUANT from HISTORICO H ');
           SQL.Add('Where (H.his_documento = :pVENDA)');
           SQL.Add('group by H.his_documento');
           Params.ParamByName('pVENDA').AsInteger := aVenda;
           Open;
           //
           If not (IsEmpty) Then
               result := FieldByName('QUANT').AsInteger;
           //
           Close;
      End;
End;

procedure Loja_Combo(aCombo : TComboBox);
begin
     With dmConsultas.qryLoja do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select EMP_CODIGO, EMP_FANTASIA from EMPRESAS');
          SQL.Add('order by EMP_FANTASIA');
          Open;
          First;
     End;
     //
     aCombo.Clear;
     While not (dmConsultas.qryLoja.Eof) do
     Begin
          aCombo.Items.Add(dmConsultas.qryLoja.FieldByName('EMP_FANTASIA').AsString);
          //
          dmConsultas.qryLoja.Next;
     End;
End;

function RetirarCarecterAtalho(const texto : string) : string;
Var
  i, tamanho : integer;
begin
     tamanho := Length(texto);
     for i := 1 to tamanho do
      if texto[i] <> '&' then
        Result := Result + texto[i];
End;

function retornaProximoCodigoMenu : integer;
begin
     with FrmAdmin.dataSetAux do
      begin
           close;
           commandtext :=
            'Select Max(MEN_CODIGO) AS MAIOR FROM MENUS';
           Open;
           Result := Fields[0].AsInteger + 1;
      End;
End;

function retornarCodMenu(const textoMenu : String) : Integer;
begin
     with FrmAdmin.dataSetAux do
      begin
           Close;
           CommandText := 'Select MEN_CODIGO FROM MENUS WHERE MEN_NOME ='+
           QuotedStr(Trim(textoMenu));
           Open;
           //
           If not IsEmpty then
              Result := Fields[0].AsInteger
           Else
              Result := -1;
      End;
End;

function FormataData(sData : string) : String;
begin
     // 99 / 99 / 9999
     result := Copy(sData,7,2)+'/'+Copy(sData,5,2)+'/'+Copy(sData,1,4);
End;

Function CalcularFrete(fValor, fPercentual : Double) : Double;
Begin
    Result := Gerapercentual(fValor, fPercentual );
End;

function GetNomePlano(iCodigo : integer) : String;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select PLA_DESCRICAO from PLANO_PAGAMENTO Where (PLA_CODIGO = :pCODIGO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger := iCodigo;
      open;
      If not (IsEmpty) Then
         result := FieldByName('PLA_DESCRICAO').AsString;
    finally
      free;
    end;
End;

Function GetCodForn(iCodProduto : String) : integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select PRO_CODIGO, FOR_CODIGO from PRODUTOS Where (PRO_CODIGO = :pCODIGO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsString := iCodProduto;
      open;
      If not (IsEmpty) Then
         result := FieldByName('FOR_CODIGO').AsInteger;
    finally
      free;
    end;
End;

Function GetCodPlano(aNomePlano : String) : integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select * from PLANO_PAGAMENTO Where (PLA_DESCRICAO = :pNOME)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pNOME').AsString := aNomePlano;
      open;
      If not (IsEmpty) Then
         result := FieldByName('PLA_CODIGO').AsInteger;
    finally
      free;
    end;
End;

Function GetReferencia(aDesc : String) : Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select PRO_CODIGO, PRO_REFERENCIA from PRODUTOS Where (PRO_REFERENCIA = :pDESC)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pDESC').AsString := aDesc;
      open;
      If not (IsEmpty) Then
         result := true;
    finally
      free;
    end;
End;

Function GetEmailFornecedor(iCodigo : Integer) : String;
var qraux : TSQLquery;
    texto : string;
begin
  result := '';
  texto := 'Select FOR_CODIGO, FOR_EMAIL from FORNECEDORES Where (FOR_CODIGO = :pCODIGO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger := iCodigo;
      open;
      If not (IsEmpty) Then
         result := fieldByName('FOR_EMAIL').AsString;
    finally
      free;
    end;
End;

Function GetIpiFornecedor(iCodigo : Integer) : Double;
var qraux : TSQLquery;
    texto : string;
begin
  result := 0;
  texto := 'Select FOR_CODIGO, FOR_PERCENTUAL_IPI from FORNECEDORES Where (FOR_CODIGO = :pCODIGO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger := iCodigo;
      open;
      If not (IsEmpty) Then
         result := fieldByName('FOR_PERCENTUAL_IPI').AsFloat;
    finally
      free;
    end;
End;

Function GetVerificaCNPJ(aCNPJ : String) : Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select CLI_CODIGO, CLI_CGC from CLIENTES Where (CLI_CGC = :pCNPJ)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCNPJ').AsString := aCNPJ;
      open;
      If not (IsEmpty) Then
         result := True;
    finally
      free;
    end;
End;

Function ExcluirPedido(iPedido : Integer) : Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Delete from VENDAS Where (MOV_PEDIDO = :pPEDIDO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      Dm.Start;
      try
          sql.Add(texto);
          Params.ParamByName('pPEDIDO').AsInteger := iPedido;
          ExecSQL();
          //
          texto := 'Delete from PROVENDAS Where (MOP_PEDIDO = :pPEDIDO)';
          sql.Clear;
          sql.Add(texto);
          Params.ParamByName('pPEDIDO').AsInteger := iPedido;
          ExecSQL();
          //
          Dm.Comit(Dm.Transc);
          result := True;
       Except
             Dm.Rollback;
       End;
    finally
      free;
    end;
End;

function Verificar_Razao(aNome : String) : Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select CLI_CODIGO, CLI_RAZAO from CLIENTES Where (CLI_RAZAO = :pRAZAO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pRAZAO').AsString := aNome;
      open;
      If not (IsEmpty) Then
         result := True;
    finally
      free;
    end;
End;

function Criptografia(mStr, mChave: string): string;
var
  i, TamanhoString, pos, PosLetra, TamanhoChave: Integer;
begin
  Result := mStr;
  TamanhoString := Length(mStr);
  TamanhoChave := Length(mChave);
  for i := 1 to TamanhoString do
  begin
      pos := (i mod TamanhoChave);
      if pos = 0 then
        pos := TamanhoChave;
      posLetra := ord(Result[i]) xor ord(mChave[pos]);
      if posLetra = 0 then
        posLetra := ord(Result[i]);
      Result[i] := chr(posLetra);
  end;
end;

Function GetCliente(iCodigo : Integer; aRazao, aCGC : String) : Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select CLI_CODIGO, CLI_RAZAO, CLI_CGC from CLIENTES ';
  texto := texto + 'Where (CLI_CODIGO = :pCODIGO) and (CLI_RAZAO = :pRAZAO) and (CLI_CGC = :pCLI_CGC)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger := iCodigo;
      Params.ParamByName('pRAZAO').AsString   := aRazao;
      Params.ParamByName('pCLI_CGC').AsString := aCGC;
      open;
      //
      If not (IsEmpty) Then
         result := True;
    finally
      free;
    end;
End;

Function GetValidarBairro(iCodigo, iCdCidade : Integer; aNome : String) : Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select BAI_CODIGO, BAI_NOME, CID_CODIGO from BAIRROS ';
  texto := texto + 'Where (BAI_CODIGO = :pCODIGO) and (BAI_NOME = :pNOME) and (CID_CODIGO = :pCIDADE)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger := iCodigo;
      Params.ParamByName('pNOME').AsString    := aNome;
      Params.ParamByName('pCIDADE').AsInteger := iCdCidade;
      open;
      //
      If not (IsEmpty) Then
         result := True;
    finally
      free;
    end;
End;

Function GetValidarCidade(iCdCidade : Integer; aNome, aUF : String) : Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select CID_CODIGO, CID_NOME, CID_UF from CIDADES ';
  texto := texto + 'Where (CID_CODIGO = :pCODIGO) and (CID_NOME = :pNOME) and (CID_UF = :pUF)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger := iCdCidade;
      Params.ParamByName('pNOME').AsString    := aNome;
      Params.ParamByName('pUF').AsString      := aUF;
      open;
      //
      If not (IsEmpty) Then
         result := True;
    finally
      free;
    end;
End;

Function GetValidarFornecedor(iCodigo : Integer; aRazao : String) : Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select FOR_CODIGO, FOR_RAZAO from FORNECEDORES ';
  texto := texto + 'Where (FOR_CODIGO = :pCODIGO) and (FOR_RAZAO = :pRAZAO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger := iCodigo;
      Params.ParamByName('pRAZAO').AsString   := aRazao;
      open;
      //
      If not (IsEmpty) Then
         result := True;
    finally
      free;
    end;
End;

Function GetValidarPlanoPagamento(iCodigo : Integer; aDescricao : String) : Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select PLA_CODIGO, PLA_DESCRICAO from PLANO_PAGAMENTO ';
  texto := texto + 'Where (PLA_CODIGO = :pCODIGO) and (PLA_DESCRICAO = :pDESCRICAO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger    := iCodigo;
      Params.ParamByName('pDESCRICAO').AsString  := aDescricao;
      open;
      //
      If not (IsEmpty) Then
         result := True;
    finally
      free;
    end;
End;

Function GetValidarProduto(iCodigo, aDescricao : String) : Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select PRO_CODIGO, PRO_BARRAS, PRO_DESCRICAO from PRODUTOS ';
  texto := texto + 'Where (PRO_CODIGO = :pCODIGO) and (PRO_DESCRICAO = :pDESCRICAO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsString     := iCodigo;
      Params.ParamByName('pDESCRICAO').AsString  := aDescricao;
      open;
      //
      If not (IsEmpty) Then
         result := True;
    finally
      free;
    end;
End;

Function GetValidarProdutoPedido(iPedido : Integer; aProduto : String) : Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select MOP_PEDIDO, MOP_PRODUTO from PROVENDAS ';
  texto := texto + 'Where (MOP_PEDIDO = :pCODIGO) and (MOP_PRODUTO  = :pPRODUTO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger  := iPedido;
      Params.ParamByName('pPRODUTO').AsString  := aProduto;
      open;
      //
      If not (IsEmpty) Then
         result := True;
    finally
      free;
    end;
End;

Function GetValidarPedido(iPedido, iCliente : Integer) : Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select MOV_PEDIDO, MOV_LOJA, MOV_CLIENTE, MOV_DATAVENDA  from VENDAS ';
  texto := texto + 'Where (MOV_PEDIDO = :pCODIGO) and (MOV_CLIENTE  = :pCLIENTE) ';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger  := iPedido;
      Params.ParamByName('pCLIENTE').AsInteger := iCliente;
      open;
      //
      If not (IsEmpty) Then
         result := True;
    finally
      free;
    end;
End;

function mvpedidoitem(iPedido : integer; campo,tabela:string):integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select max('+campo+') from '+tabela + ' where (PVI_PEDIDO = :pPEDIDO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pPEDIDO').AsInteger := iPedido;
      open;
      result := fields[0].AsInteger;
    finally
      free;
    end;
End;

Procedure CupomPedido(iPedido, iQuantidade : Integer; fTaxa : Double; aCDS : TClientDataSet; aTipo : String);
Var
    // Variável da classe TVDODmPrinter que fará o relatório
    VDOImpressora : TVDODmPrinter;
    Linha : string;
    LinCab1, LinCab2, M_ESPACO : String;
    M_NUMMES, M_QTCARA : Integer;
    LINHA1, VALOR, M_POSINI : integer;
    //
    Data, W_CDITEN, W_NMDESC, W_MNMODA, W_FLCANC : String;
    W_UNITEN : String;
    W_VLMODA, W_VLUNIT, W_VLSUBT, W_TOVEND, W_VLDESC, W_VLACRE, W_VLVEND, M_VLTROC, W_QTITEN : Real;
    //
    M_CDCLIE, M_CAMINH, M_NMCLIE, M_NMVEND, M_FLSITU, M_NMFILE : String;
    M_CDCAIX, M_FLIMPR, M_NRITEM : Integer;
    M_TXSERV : Double;
begin
     //
     M_CAMINH := uFuncoes.PASTA_CUPOM(StrtoInt(UFrmAdmin.M_CDUSUA));
     M_TXSERV := 0;
     //
     M_CDCLIE := StrZero(dmDados.cdsPreVenda.FieldByName('PRV_CLIENTE').AsString,7);
     If not Empty(M_CDCLIE) Then
         M_NMCLIE := NOME_CLIENTE(StrtoInt(M_CDCLIE))
     Else
         M_NMCLIE := dmDados.cdsPreVenda.FieldByName('PRV_NOMECLIENTE').AsString;
     if Empty(M_NMCLIE) Then
       M_NMCLIE := 'VENDA AO CONSUMIDO';
     W_VLDESC := 0;
     W_VLACRE := 0;
     M_FLSITU := dmDados.cdsPreVenda.FieldByName('PRV_SITUACAO').AsString;
  // Caixa
  With dmConsultas.qryMovCaixa do
  Begin
       Close;
       Params.ParamByName('pLOJA').AsInteger  := 1;
       Params.ParamByName('pVENDA').AsInteger := iPedido;
       Open;
  End;
  //
  M_CDCAIX := StrtoInt(UFrmAdmin.W_CDCAIX);
  //dmConsultas.qryMovCaixa.FieldByName('MCA_CAIXA').AsInteger;
  // Vendedor
  W_VLVEND := dmDados.cdsPreVenda.FieldByName('PRV_VALOR').AsCurrency;
  //
  dm.CdsEmpresas.Close;
  With dm.SdsEmpresas do
  Begin
       Active := False;
       CommandText := 'SELECT * FROM EMPRESAS Where (EMP_CODIGO = :pCODIGO)';
       Params.ParamByName('pCODIGO').AsInteger := 1;
       Active := true;
  End;
  dm.CdsEmpresas.Open;
  //
  Data:= Copy(DatetoStr(Date),1,3)+Copy(DatetoStr(Date),4,3)+Copy(DatetoStr(Date),7,4);
  //
 try
     VDOImpressora := TVDODmPrinter.Create(nil);
     VDOImpressora.Title := 'Visualizar Impressão';
     VDOImpressora.ShowPreview       := True;
     VDOImpressora.ShowProgress      := True;
     VDOImpressora.ShowDialog        := False;
     //
     VDOImpressora.Font.Size         := fsCondensed;
     M_QTCARA := 159;
     //
     With VDOImpressora do
     Begin
          BeginDoc;
          //
          Font.Size  := fsCondensed;
          Font.Style := [];
          { salta duas linhas}
          NewLine(2);
          M_POSINI := 0;
          { Imprime e alinhado à esquerda dentro de uma área de 52 caracteres}
          Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*',48 )]), True);
          { Imprime a string "Cupom ", alinhado à esquerda"-" dentro de uma área de trita caracteres}
          Print(M_POSINI, Format('%-48s', [uFuncoes.PadC('CUPOM DE PEDIDO',48)]), True);
          { Imprime e alinhado à esquerda dentro de uma área de 48 caracteres}
          Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*',48 )]), True);
          { Imprime o nome da Loja}
          Print(M_POSINI, Format('%-48s', [uFuncoes.PadC('LOJA: '+dm.CdsEmpresas.FieldByName('EMP_FANTASIA').AsString,48)]), True);
          Print(M_POSINI, Format('%-48s', [uFuncoes.PadC(dm.CdsEmpresas.FieldByName('EMP_ENDERECO').AsString,52)]), True);
          { ---- Impressão dos Cabeçalho-----}
          { Imprime e alinhado à esquerda dentro de uma área de 48 caracteres}
          Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*',48 )]),TRUE);
          Print(M_POSINI, Format('%-48s', ['Nº. DO PEDIDO...: '+uFuncoes.StrZero(InttoStr(iPedido),7)]), True);
          If (M_NMCLIE = 'VENDA AO CONSUMIDO') Then
              Print(M_POSINI, Format('%-48s', ['CLIENTE.........: '+ M_CDCLIE + ' - '+M_NMCLIE]), True)
          Else
          begin
               Print(M_POSINI, Format('%-48s', ['CLIENTE.........: '+ M_NMCLIE]), True);
               Print(M_POSINI, Format('%-48s', ['TELEFONE........: '+ FormataFONE(dmDados.cdsPreVendaDOM_NRFONE.AsString)]), True);
               Print(M_POSINI, Format('%-48s', ['ENDEREÇO........: '+ dmDados.cdsPreVendaDOM_ENDERECO.AsString]), True);
               Print(M_POSINI, Format('%-48s', ['NUMERO..........: '+ dmDados.cdsPreVendaDOM_NUMERO.AsString]), True);
               Print(M_POSINI, Format('%-48s', ['COMPLEMENTO.....: '+ dmDados.cdsPreVendaDOM_COMPLEMENTO.AsString]), True);
               Print(M_POSINI, Format('%-48s', ['BAIRRO..........: '+ dmDados.cdsPreVendaDOM_BAIRRO.AsString]), True);
               Print(M_POSINI, Format('%-48s', ['CIDADE/UF.......: '+ dmDados.cdsPreVendaDOM_CIDADE.AsString]), True);
               Print(M_POSINI, Format('%-48s', ['REFERÊNCIA......: '+ dmDados.cdsPreVendaDOM_REFERE.AsString]), True);
          End;
          //Print(M_POSINI, Format('%-48s', ['VENDEDOR........: '+M_NMVEND]), True);
          Print(M_POSINI, Format('%-48s', ['CAIXA...........: '+uFuncoes.StrZero(InttoStr(M_CDCAIX),3)+ ' - ' + NOME_CAIXA(M_CDCAIX)]), True);
          { Imprime a Data de Emissão, baseada na data atual e salta para próxima linha}
          Print(M_POSINI, Format('%-48s', ['DATA/HORA.......: '+dmDados.cdsPreVenda.FieldByName('PRV_DATAVENDA').AsString+uFuncoes.Replicate(' ',10)
               +dmDados.cdsPreVenda.FieldByName('PRV_HORAVENDA').AsString]), True);
          //
          If (M_FLSITU = 'C') Then
           Begin
                Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*',48 )]),true);
                Print(M_POSINI, Format('%-48s', [uFuncoes.PadC('*** VENDA CANCELADA ***',48)]),true);
           End;
           //
           Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*',48 )]), true);
           Print(M_POSINI, Format('%-24s', ['DESCRICAO']));
           Print(M_POSINI, Format('%-9s',  [' QUANT']));
           Print(M_POSINI, Format('%5s',   ['VL UNI ']));
           Print(M_POSINI, Format('%8s',   [' SUB-TOT']),true);
           Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('-',48 )]), true);
           //
           {----- Fase de Emissão dos Itens da Nota -----}
           { Move o ponteiro para o primeiro registro}
            //
            dmDados.cdsItensVenda.DisableControls;
            dmDados.cdsItensVenda.First;
            //
            M_NRITEM := 1;
            While not (dmDados.cdsItensVenda.Eof) do
            Begin
                {carrega os dados}
                 W_CDITEN := dmDados.cdsItensVenda.FieldByName('PVI_PRODUTO').AsString;
                 W_NMDESC := Copy(NOME_PRODUTO(dmDados.cdsItensVenda.FieldByName('PVI_PRODUTO').AsString),1,27);
                 W_QTITEN := dmDados.cdsItensVenda.FieldByName('PVI_QUANTIDADE').AsFloat;
                 W_UNITEN := dmDados.cdsItensVenda.FieldByName('PVI_UNIDADE').AsString;
                 W_VLUNIT := dmDados.cdsItensVenda.FieldByName('PVI_VALOR').AsCurrency;
                 W_VLSUBT := dmDados.cdsItensVenda.FieldByName('PVI_SUBTOTAL').AsCurrency;
                 //
                 Print(M_POSINI, Format('%-26s',  [COPY(W_NMDESC,1, 23)]));
                 Print(M_POSINI, Format('%-6.2f', [W_QTITEN]));
                 Print(M_POSINI, Format('%7s',  [FormatFloat('#,##0.#0',W_VLUNIT)]));
                 Print(M_POSINI, Format('%9s',  [FormatFloat('#,##0.#0',W_VLSUBT)]),true);
                 //
                 M_NRITEM := M_NRITEM + 1;
                 //
                 dmDados.cdsItensVenda.Next;
            End;
            dmDados.cdsItensVenda.EnableControls;
            //
            Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('-',48)]),true);
            Print(M_POSINI, Format('%-30s',     ['TOTAL............: '])+ Format('%18s',[FormatFloat('###,##0.#0', dmDados.cdsPreVendaPRV_VALOR.AsFloat)]),true);
            if (fTaxa > 0) Then
            begin
                If (aTipo = '%') Then
                    M_TXSERV := uFuncoes.Arredondar(uFuncoes.Gerapercentual(dmDados.cdsPreVendaPRV_VALOR.AsFloat, fTaxa),2)
                Else
                    M_TXSERV := fTaxa;
                //    
                Print(M_POSINI, Format('%-30s', ['TAXA DE SERVIÇO..: '])+ Format('%18s',[FormatFloat('##0.#0', M_TXSERV)]),true);
                NewLine();
                Print(M_POSINI, Format('%-30s', ['TOTAL DO PEDIDO..: '])+ Format('%18s',[FormatFloat('###,##0.#0', dmDados.cdsPreVendaPRV_VALOR.AsFloat + M_TXSERV)]),true);
            End;
            //
            NewLine(2);
            If (iQuantidade > 0) Then
               Print(M_POSINI, Format('%-30s', ['VALOR POR PESSOA.:'])+Format('%18s',[FormatFloat('###,##0.#0', Arredondar((dmDados.cdsPreVendaPRV_VALOR.AsFloat + M_TXSERV)/iQuantidade,2) )]) ,true);
            Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('-',48)]),true);
            { Salta seis linhas}
            NewLine(3);
            { Imprime separador}
            Print(M_POSINI,Format('%-48s', [uFuncoes.Replicate('*',48 )]),true);
            Print(M_POSINI,Format('%-48s', [uFuncoes.PadC(Dm.CdsConfigCFG_MENS_RODAPE.AsString,48)]),true);
            Print(M_POSINI,Format('%-48s', [uFuncoes.Replicate('*',48 )]),true);
            Print(M_POSINI,Format('%-48s', ['DESENVOLVIDO POR:INFOG2 TECNOLOGIA-(86)3226-4510']),true);
            { Salta uma linhas }
            NewLine(Dm.CdsConfigCFG_LINHA_RODAPE_CUPOM.AsInteger);
            //
            EndDoc;
            FreeAndNil(VDOImpressora);
    End;   // fim-with VDOImpressora
 Finally

 End;
End;

Procedure CupomPedido2Via(iPedido : Integer);
Var
    // Variável da classe TVDODmPrinter que fará o relatório
    VDOImpressora : TVDODmPrinter;
    Linha : string;
    LinCab1, LinCab2, M_ESPACO : String;
    M_NUMMES, M_QTCARA : Integer;
    LINHA1, M_POSINI : integer;
    M_VALOR : Double;
    //
    Data, W_CDITEN, W_NMDESC, W_MNMODA, W_FLCANC : String;
    W_UNITEN : String;
    W_VLMODA, W_VLUNIT, W_VLSUBT, W_TOVEND, W_VLDESC, W_VLACRE, W_VLVEND, M_VLTROC, W_QTITEN : Real;
    //
    M_CDCLIE, M_CAMINH, M_NMCLIE, M_NMVEND, M_FLSITU, M_NMFILE : String;
    M_CDCAIX, M_FLIMPR, M_NRITEM : Integer;
    M_TXSERV : Double;
begin
     //
     M_CAMINH := uFuncoes.PASTA_CUPOM(StrtoInt(UFrmAdmin.M_CDUSUA));
     M_TXSERV := 0;
     //
     Dm.cdsmovimento.Close;
     With Dm.dstMovimento do
     Begin
          Active := False;
          CommandText := 'Select * from VENDAS Where (MOV_PEDIDO = :pPEDIDO)';
          Params.ParamByName('pPEDIDO').AsInteger := iPedido;
          Active := True;
     End;
     Dm.cdsmovimento.Open;
     //
     M_CDCLIE := StrZero(dm.cdsMovimento.FieldByName('MOV_CLIENTE').AsString,7);
     If not Empty(M_CDCLIE) Then
         M_NMCLIE := NOME_CLIENTE(StrtoInt(M_CDCLIE))
     Else
         M_NMCLIE := dm.cdsMovimento.FieldByName('MOV_NOMECLIENTE').AsString;
     if Empty(M_NMCLIE) Then
       M_NMCLIE := 'VENDA AO CONSUMIDO';
     W_VLDESC := 0;
     W_VLACRE := 0;
     M_FLSITU := dm.cdsMovimento.FieldByName('MOV_SITUACAO').AsString;
  // Caixa
  With dmConsultas.qryMovCaixa do
  Begin
       Close;
       Params.ParamByName('pLOJA').AsInteger  := 1;
       Params.ParamByName('pVENDA').AsInteger := iPedido;
       Open;
  End;
  //
  M_CDCAIX := StrtoInt(UFrmAdmin.W_CDCAIX);
  //dmConsultas.qryMovCaixa.FieldByName('MCA_CAIXA').AsInteger;
  // Vendedor
  W_VLVEND := dm.cdsMovimento.FieldByName('MOV_VALOR').AsCurrency;
  //
  dm.CdsEmpresas.Close;
  With dm.SdsEmpresas do
  Begin
       Active := False;
       CommandText := 'SELECT * FROM EMPRESAS Where (EMP_CODIGO = :pCODIGO)';
       Params.ParamByName('pCODIGO').AsInteger := 1;
       Active := true;
  End;
  dm.CdsEmpresas.Open;
  //
  Data:= Copy(DatetoStr(Date),1,3)+Copy(DatetoStr(Date),4,3)+Copy(DatetoStr(Date),7,4);
  //
 try
     VDOImpressora := TVDODmPrinter.Create(nil);
     VDOImpressora.Title := 'Visualizar Impressão';
     VDOImpressora.ShowPreview       := True;
     VDOImpressora.ShowProgress      := True;
     VDOImpressora.ShowDialog        := False;
     //
     VDOImpressora.Font.Size         := fsCondensed;
     M_QTCARA := 159;
     //
     With VDOImpressora do
     Begin
          BeginDoc;
          //
          Font.Size  := fsCondensed;
          Font.Style := [];
          { salta duas linhas}
          NewLine(2);
          M_POSINI := 0;
          { Imprime e alinhado à esquerda dentro de uma área de 52 caracteres}
          Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*',48 )]), True);
          { Imprime a string "Cupom ", alinhado à esquerda"-" dentro de uma área de trita caracteres}
          Print(M_POSINI, Format('%-48s', [uFuncoes.PadC('CUPOM DE PEDIDO - 2ª VIA',48)]), True);
          { Imprime e alinhado à esquerda dentro de uma área de 48 caracteres}
          Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*',48 )]), True);
          { Imprime o nome da Loja}
          Print(M_POSINI, Format('%-48s', [uFuncoes.PadC('LOJA: '+dm.CdsEmpresas.FieldByName('EMP_FANTASIA').AsString,48)]), True);
          Print(M_POSINI, Format('%-48s', [uFuncoes.PadC(dm.CdsEmpresas.FieldByName('EMP_ENDERECO').AsString,52)]), True);
          { ---- Impressão dos Cabeçalho-----}
          { Imprime e alinhado à esquerda dentro de uma área de 48 caracteres}
          Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*',48 )]),TRUE);
          Print(M_POSINI, Format('%-48s', ['Nº. DO PEDIDO...: '+uFuncoes.StrZero(InttoStr(iPedido),7)]), True);
          Print(M_POSINI, Format('%-48s', ['Nº. DA MESA.....: '+ dm.cdsMovimento.FieldByName('MOV_NRMESA').AsString]), True);
          If (M_NMCLIE = 'VENDA AO CONSUMIDO') Then
              Print(M_POSINI, Format('%-48s', ['CLIENTE.........: '+ M_CDCLIE + ' - '+M_NMCLIE]), True)
          Else
          begin
               dm.FilterCDS(Dm.CdsClientes, fsInteger, dm.cdsMovimentoMOV_CLIENTE.AsString);
               Print(M_POSINI, Format('%-48s', ['CLIENTE.........: '+ M_NMCLIE]), True);
               Print(M_POSINI, Format('%-48s', ['TELEFONE........: '+ FormataFONE(dm.CdsClientesCLI_FONE1.AsString)]), True);
               Print(M_POSINI, Format('%-48s', ['ENDEREÇO........: '+ dm.CdsClientesCLI_ENDERECO.AsString]), True);
               Print(M_POSINI, Format('%-48s', ['NUMERO..........: '+ dm.CdsClientesCLI_NUMERO.AsString]), True);
               Print(M_POSINI, Format('%-48s', ['BAIRRO..........: '+ dm.CdsClientesBAI_NOME.AsString]), True);
               Print(M_POSINI, Format('%-48s', ['CIDADE/UF.......: '+ GetCidade(dm.CdsClientesCID_CODIGO.AsInteger) + '/'+dm.CdsClientesCLI_UFCLIENTE.AsString]), True);
               //Print(M_POSINI, Format('%-48s', ['REFERÊNCIA......: '+ dm.CdsClientesCLI_PONTO_REFERENCIA.AsString]), True);
          End;
          //Print(M_POSINI, Format('%-48s', ['VENDEDOR........: '+M_NMVEND]), True);
          Print(M_POSINI, Format('%-48s', ['CAIXA...........: '+uFuncoes.StrZero(InttoStr(M_CDCAIX),3)+ ' - ' + NOME_CAIXA(M_CDCAIX)]), True);
          { Imprime a Data de Emissão, baseada na data atual e salta para próxima linha}
          Print(M_POSINI, Format('%-48s', ['DATA/HORA.......: '+dm.cdsMovimento.FieldByName('MOV_DATAVENDA').AsString+uFuncoes.Replicate(' ',10)
               +dm.cdsMovimento.FieldByName('MOV_HORAVENDA').AsString]), True);
          //
          If (M_FLSITU = 'C') Then
           Begin
                Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*',48 )]),true);
                Print(M_POSINI, Format('%-48s', [uFuncoes.PadC('*** VENDA CANCELADA ***',48)]),true);
           End;
           //
           Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*',48 )]), true);
           Print(M_POSINI, Format('%-24s', ['DESCRICAO']));
           Print(M_POSINI, Format('%-9s',  [' QUANT']));
           Print(M_POSINI, Format('%5s',   ['VL UNI ']));
           Print(M_POSINI, Format('%8s',   [' SUB-TOT']),true);
           Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('-',48 )]), true);
           //
           CARREGAR_ITENS(iPedido);
           {----- Fase de Emissão dos Itens da Nota -----}
           { Move o ponteiro para o primeiro registro}
            //
            dmConsultas.cdsItensVendas.DisableControls;
            dmConsultas.cdsItensVendas.First;
            //
            M_NRITEM := 1;
            M_VALOR  := 0;
            While not (dmConsultas.cdsItensVendas.Eof) do
            Begin
                {carrega os dados}
                 W_CDITEN := dmConsultas.cdsItensVendas.FieldByName('ITE_CDITEN').AsString;
                 W_NMDESC := Copy(NOME_PRODUTO(dmConsultas.cdsItensVendas.FieldByName('ITE_CDITEN').AsString),1,27);
                 W_QTITEN := dmConsultas.cdsItensVendas.FieldByName('ITE_QTITEN').AsFloat;
                 W_UNITEN := dmConsultas.cdsItensVendas.FieldByName('ITE_CDUNID').AsString;
                 W_VLUNIT := dmConsultas.cdsItensVendas.FieldByName('ITE_VLUNIT').AsCurrency;
                 W_VLSUBT := dmConsultas.cdsItensVendas.FieldByName('ITE_VLSUBT').AsCurrency;
                 //
                 Print(M_POSINI, Format('%-26s',  [COPY(W_NMDESC,1, 23)]));
                 Print(M_POSINI, Format('%-6.2f', [W_QTITEN]));
                 Print(M_POSINI, Format('%7s',  [FormatFloat('#,##0.#0',W_VLUNIT)]));
                 Print(M_POSINI, Format('%9s',  [FormatFloat('#,##0.#0',W_VLSUBT)]),true);
                 //
                 M_NRITEM := M_NRITEM + 1;
                 M_VALOR  := M_VALOR + W_VLSUBT;
                 //
                 dmConsultas.cdsItensVendas.Next;
            End;
            dmConsultas.cdsItensVendas.EnableControls;
            //
            Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('-',48)]),true);
            //Print(M_POSINI, Format('%-30s',     ['TOTAL............: '])+ Format('%18s',[FormatFloat('###,##0.#0', dm.cdsMovimentoMOV_VALOR.AsFloat)]),true);
            Print(M_POSINI, Format('%-30s',     ['TOTAL............: '])+ Format('%18s',[FormatFloat('###,##0.#0', M_VALOR)]),true);
            if (dm.cdsMovimentoMOV_TAXA_SERVICO.AsFloat > 0) Then
            begin
                //M_TXSERV := uFuncoes.Arredondar(uFuncoes.Gerapercentual(M_VALOR, dm.cdsMovimentoMOV_TAXA_SERVICO.AsFloat),2);
                M_TXSERV := dm.cdsMovimentoMOV_TAXA_SERVICO.AsFloat;
                Print(M_POSINI, Format('%-30s', ['TAXA DE SERVIÇO..: '])+ Format('%18s',[FormatFloat('##0.#0', M_TXSERV)]),true);
                NewLine();
                Print(M_POSINI, Format('%-30s', ['TOTAL DO PEDIDO..: '])+ Format('%18s',[FormatFloat('###,##0.#0', M_VALOR + M_TXSERV)]),true);
            End;
            //
            { Salta seis linhas}
            NewLine(3);
            { Imprime separador}
            Print(M_POSINI,Format('%-48s', [uFuncoes.Replicate('*',48 )]),true);
            Print(M_POSINI,Format('%-48s', [uFuncoes.PadC(Dm.CdsConfigCFG_MENS_RODAPE.AsString,48)]),true);
            Print(M_POSINI,Format('%-48s', [uFuncoes.Replicate('*',48 )]),true);
            Print(M_POSINI,Format('%-48s', ['DESENVOLVIDO POR:INFOG2 TECNOLOGIA-(86)3226-4510']),true);
            { Salta uma linhas }
            NewLine(2);
            //
            EndDoc;
            FreeAndNil(VDOImpressora);
    End;   // fim-with VDOImpressora
 Finally

 End;
End;


function StrIsFloat(const S: string): boolean;
begin
  try
  StrToFloat(S);
  Result := true;
  except
  Result := false;
  end;
end;


Function GetAtendenteVenda(iVenda : integer) : Integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select PV.MOP_PEDIDO, PV.MOP_NRITEM, PV.MOP_CDVENDEDOR from PROVENDAS PV ';
  texto := texto + ' where (PV.MOP_PEDIDO = :pPEDIDO) AND (PV.MOP_NRITEM = :pNRITEM)';

  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pPEDIDO').AsInteger := iVenda;
      Params.ParamByName('pNRITEM').AsInteger := 1;
      open;
      //
      If not (IsEmpty) Then
         result := fieldbyName('MOP_CDVENDEDOR').AsInteger;
    finally
      free;
    end;
End;

Function CupomFechamentoCaixa(iNumCaixa, iLoja, iCaixa : Integer) : Boolean;
Var
    // Variável da classe TVDODmPrinter que fará o relatório
    VDOImpressora : TVDODmPrinter;
    Linha : string;
    LinCab1, LinCab2, M_ESPACO : String;
    M_NUMMES, M_QTCARA : Integer;
    LINHA1, M_POSINI, iInicial, iFinal : integer;
    M_VALOR : Double;
    //
    Data  : String;
    W_UNITEN : String;
    W_VLMODA, W_QTITEN : Real;
    //
    M_TXSERV, M_TOSAID, M_MODASA, M_TOGERA, M_VLINIC, M_VLDIGI, W_TOVEND : Double;
begin
     //
     M_CAMINH := uFuncoes.PASTA_CUPOM(iCaixa);
     M_TXSERV := 0;
     M_VLINIC := 0;
     W_TOVEND := 0;
     // Caixa
     dm.CdsEmpresas.Close;
     With dm.SdsEmpresas do
     Begin
          Active := False;
          CommandText := 'SELECT * FROM EMPRESAS Where (EMP_CODIGO = :pCODIGO)';
          Params.ParamByName('pCODIGO').AsInteger := 1;
          Active := true;
     End;
     dm.CdsEmpresas.Open;
     //
     With Dm.cdsCaixa do
      begin
           Active := False;
           CommandText := 'Select * from CAIXA Where (CAI_LOJA = :pLOJA) and (CAI_NUMERO = :pNUMERO)';
           Params.ParamByName('pNUMERO').AsInteger := iNumCaixa;
           Params.ParamByName('pLOJA').AsInteger   := iLoja;
           Active := True;
           //
           If not (IsEmpty) Then
            begin
                iInicial := Dm.cdsCaixaCAI_RGINICIAL.AsInteger;
                iFinal   := Dm.cdsCaixaCAI_RGFINAL.AsInteger;
                M_VLINIC := GetValorInicialCaixa(iNumCaixa, iCaixa);
                //
            End;
      End;
     //
     Data:= Copy(DatetoStr(Date),1,3)+Copy(DatetoStr(Date),4,3)+Copy(DatetoStr(Date),7,4);
     //
    try
        VDOImpressora := TVDODmPrinter.Create(nil);
        VDOImpressora.Title := 'Visualizar Impressão';
        VDOImpressora.ShowPreview       := True;
        VDOImpressora.ShowProgress      := True;
        VDOImpressora.ShowDialog        := False;
        //
        VDOImpressora.Font.Size         := fsCondensed;
        M_QTCARA := 48;
        //
        With VDOImpressora do
        Begin
             BeginDoc;
             //
             Font.Size  := fsCondensed;
             Font.Style := [];
             { salta duas linhas}
             NewLine(2);
             M_POSINI := 0;
             { Imprime e alinhado à esquerda dentro de uma área de 52 caracteres}
             Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*', M_QTCARA )]), True);
             { Imprime a string "Cupom ", alinhado à esquerda"-" dentro de uma área de trita caracteres}
             Print(M_POSINI, Format('%-48s', [uFuncoes.PadC('FECHAMENTO DE CAIXA', M_QTCARA)]), True);
             { Imprime e alinhado à esquerda dentro de uma área de 48 caracteres}
             Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*', M_QTCARA )]), True);
             { Imprime o nome da Loja}
             Print(M_POSINI, Format('%-48s', [uFuncoes.PadC('LOJA: '+dm.CdsEmpresas.FieldByName('EMP_FANTASIA').AsString,M_QTCARA)]), True);
             Print(M_POSINI, Format('%-48s', [uFuncoes.PadC(dm.CdsEmpresas.FieldByName('EMP_ENDERECO').AsString,M_QTCARA)]), True);
             Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*', M_QTCARA )]), True);
             { ---- Impressão dos Cabeçalho-----}
             //
             Print(M_POSINI, Format('%-48s', ['REGISTRO INICIAL: '+ StrZero(InttoStr(iInicial),10)]),True);
             Print(M_POSINI, Format('%-48s', ['REGISTRO FINAL..: '+ StrZero(InttoStr(iFinal),10)]),True);
             Print(M_POSINI, Format('%-48s', ['CAIXA...........: '+uFuncoes.StrZero(InttoStr(iCaixa),3)+ ' - ' + NOME_CAIXA(iCaixa)]), True);
             { Imprime a Data de Emissão, baseada na data atual e salta para próxima linha}
             Print(M_POSINI, Format('%-48s', ['DATA ABERTURA...: '+Dm.cdsCaixaCAI_DTABERTURA.AsString +uFuncoes.Replicate(' ',5)+
                            Dm.cdsCaixaCAI_HOABERTURA.AsString]), True);
             Print(M_POSINI, Format('%-48s', ['DATA FECHAMENTO.: '+Dm.cdsCaixaCAI_DTFECHAMENTO.AsString +uFuncoes.Replicate(' ',5)+
                            Dm.cdsCaixaCAI_HOFECHAMENTO.AsString]), True);
             Print(M_POSINI,Format('%-48s', [uFuncoes.Replicate('=',M_QTCARA )]),true);
             //
             Print(M_POSINI, Format('%-38s', ['>> VALOR INICIAL..............:']),false);
             Print(M_POSINI, Format('%10s',  [FormatFloat('##0.#0', M_VLINIC)]),true);
             // Entradas
             if (dmRelatorios.GetDetalhesMovCaixa(iCaixa, iInicial, iFinal, 'E')) Then
              begin
                  NewLine();
                  Print(M_POSINI,Format('%-48s', ['>> ENTRADAS']));
                  //
                  With dmRelatorios.cdsDetalheMovCaixa do
                  begin
                      First;
                      While not (Eof) do
                      begin
                           Print  (M_POSINI, Format('%-38s', [FieldByName('NAT_NOME').AsString +' : ']), false);
                           Print(M_POSINI, Format('%10s', [FormatFloat('###,##0.#0', dmRelatorios.cdsDetalheMovCaixaVALOR.AsFloat)]));
                           M_TOENTR := M_TOENTR + dmRelatorios.cdsDetalheMovCaixaVALOR.AsFloat;
                           next;
                      End;
                  End;
             End;
             // Saidas
             if (dmRelatorios.GetDetalhesMovCaixa(iCaixa, iInicial, iFinal, 'S')) Then
              begin
                  With dmRelatorios.cdsDetalheMovCaixa do
                  begin
                      NewLine();
                      //
                      Print(M_POSINI, Format('%-48s', ['>> SAIDAS']),false);
                      //
                      First;
                      While not (Eof) do
                      begin
                           Print (M_POSINI, Format('%-38s', [FieldByName('NAT_NOME').AsString +' : ']),false);
                           Print(M_POSINI,  Format('%10s', [FormatFloat('###,##0.#0',dmRelatorios.cdsDetalheMovCaixaVALOR.AsFloat)]),true);
                           M_TOSAID  := M_TOSAID + dmRelatorios.cdsDetalheMovCaixaVALOR.AsFloat;
                           //
                           next;
                      End;
                  End;
              End;
              //
              NewLine();
              Print(M_POSINI, Format('%-48s', ['(+) >> ENTRADAS <<']),true);
              //
              Print  (M_POSINI, Format('%-38s', ['TOTAL ENTRADAS ==> ']),false);
              Print(M_POSINI, Format('%10s',  [FormatFloat('###,##0.#0',M_TOENTR)]),true);
              NewLine();
              //
              Print(M_POSINI, Format('%-48s', ['(-) >> SAIDAS <<']),true);
              Print (M_POSINI, Format('%-38s', ['TOTAL SAIDAS   ==> ']),false);
              Print(M_POSINI, Format('%10s',  [FormatFloat('###,##0.#0',M_TOSAID)]),true);
              NewLine();
              //
              Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('=', M_QTCARA )]),true);
              Print(M_POSINI, Format('%-48s', ['>> VENDAS <<']),true);
              Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('=', M_QTCARA )]),true);
              Print(M_POSINI, Format('%-20s', ['TOTAL ==> ']),false);
              W_TOVEND := GetTotalVendidoCaixa(iCaixa, iInicial, iFinal);
              Print(M_POSINI, Format('%28s', [FormatFloat('###,##0.#0',W_TOVEND)]),True);
              NewLine();
              //
              Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('=', M_QTCARA )]),true);
              Print(M_POSINI, Format('%-48s', ['>> RESUMO MODALIDADE <<']),true);
              Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('=', M_QTCARA )]),true);

              // novo
              Dm.RefreshCDS(dmRelatorios.cdsModalidades);
              //
              With dmRelatorios.cdsModalidades do   // cdsModalidades
              begin
                First;
                M_TOGERA := 0;
                While not Eof  do
                 begin
                      M_TOMODA := 0;
                      M_VLDIGI := 0;
                      M_TOMODA := dmRelatorios.GetMovCaixaModalidades2(iCaixa, FieldByName('MOD_CODIGO').AsInteger,
                            iInicial, iFinal, 'V', 'E', 'E');
                      //
                      If (M_TOMODA > 0) Then
                        begin
                            M_VLDIGI := GetValorDigitadoFechamentoCaixa(iNumCaixa , FieldByName('MOD_CODIGO').AsInteger);
                            Print(M_POSINI, Format('%-20s', [FieldByName('MOD_NOME').AsString+' : ']),false);
                            Print(M_POSINI, Format('%-14s',  ['INFORMADO']),false);
                            Print(M_POSINI, Format('%-14s',  ['DIFERENCA']),True);
                            Print(M_POSINI, Format('%-20s',  [FormatFloat('###,##0.#0', M_TOMODA)]),False);
                            Print(M_POSINI, Format('%-14s',  [FormatFloat('###,##0.#0', M_VLDIGI)]),False);                            //
                            Print(M_POSINI, Format('%-14s',  [FormatFloat('###,##0.#0', M_VLDIGI - M_TOMODA)]),true);
                            //
                            M_TOGERA := M_TOGERA + M_TOMODA;
                        End;
                      //
                      Next;
                 End;
              End;   // cdsModalidades
              //
              Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('=',48 )]),true);
              Print(M_POSINI, Format('%-38s', ['TOTAL ==> ']),false);
              Print(M_POSINI, Format('%10s',  [FormatFloat('###,##0.#0', M_TOGERA)]),true);
              Newline();
              //
             { Imprime e alinhado à esquerda dentro de uma área de 48 caracteres}
             Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('=',M_QTCARA )]),true);
             NewLine(2);
             Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('=',M_QTCARA )]),true);
             Print(M_POSINI, Format('%-28s', ['ATENDENTES']),false);
             Print(M_POSINI, Format('%10s',  ['SUB-TOTAL']),false);
             Print(M_POSINI, Format('%10s',  ['COMISSÃO']),true);
             Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('-',M_QTCARA )]),true);
             //
             dmRelatorios.Comissoes(iInicial, iFinal);
             //
             If not (dmRelatorios.cdscomissoes.IsEmpty) Then
              begin
                   //
                   dmRelatorios.cdscomissoes.First;
                   //
                   While not (dmRelatorios.cdscomissoes.Eof) do
                    begin
                         Print(M_POSINI, Format('%-28s', [Copy(dmRelatorios.cdsComissoesFUN_NOME.AsString,1,27)]),false);
                         Print(M_POSINI, Format('%10s',  [FormatFloat('###,##0.#0',dmRelatorios.cdsComissoesTOTAL.AsCurrency)]),false);
                         Print(M_POSINI, Format('%10s',  [FormatFloat('##,##0.#0',dmRelatorios.cdsComissoesTAXA.AsCurrency)]),true);
                         //
                         dmRelatorios.cdscomissoes.Next;
                    End;
              End;
              //
              NewLine(2);
              dmRelatorios.TeleEntregas(iInicial, iFinal);
              //
              If not (dmRelatorios.cdsTeleEntrega.IsEmpty) Then
                begin
                     Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('=',M_QTCARA )]),true);
                     Print(M_POSINI, Format('%-48s', ['VENDAS TELE-ENTREGAS']),True);
                     Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('-',M_QTCARA )]),true);
                     //
                     If (dmRelatorios.cdsTeleEntregaTOTAL_VENDA.AsFloat > 0) Then
                          Print(M_POSINI, Format('%48s', [FormatFloat('###,##0.#0', (dmRelatorios.cdsTeleEntregaTOTAL_VENDA.AsFloat * 100) / M_TOGERA) + '%']),True)
                     Else
                          Print(M_POSINI, Format('%-48s', [' ']),True);
                      // dmRelatorios.cdsTeleEntregaTOTAL_VENDA.AsFloat
                      {txtTotalServico.Caption  := FormatFloat('###,##0.#0',dmRelatorios.cdsTeleEntregaTOTAL_SERVICO.AsFloat);
                      txtTotalServicos.Caption := FormatFloat('###,##0.#0',dmRelatorios.cdsTeleEntregaTOTAL_VENDA.AsFloat + dmRelatorios.cdsTeleEntregaTOTAL_SERVICO.AsFloat);}
                End;

             //
             NewLine(2);
             { Imprime separador}
             Print(M_POSINI,Format('%-48s', [uFuncoes.Replicate('*',M_QTCARA )]),true);
             Print(M_POSINI,Format('%-48s', [uFuncoes.PadC(Dm.CdsConfigCFG_MENS_RODAPE.AsString,M_QTCARA)]),true);
             Print(M_POSINI,Format('%-48s', [uFuncoes.Replicate('*',M_QTCARA )]),true);
             Print(M_POSINI,Format('%-48s', ['DESENVOLVIDO POR:INFOG2 TECNOLOGIA-(86)3226-4510']),true);
             { Salta uma linhas }
             NewLine(2);
             //
             EndDoc;
    End;   // fim-with VDOM_POSINI
 Finally
      FreeAndNil(VDOImpressora);
 End;
End;

Function CaixaRGInicial(iNumCaixa : Integer) : Integer;
var
    qraux : TSQLquery;
    texto : string;
begin
    texto := 'Select CAI_NUMERO, CAI_LOJA, CAI_RGINICIAL from CAIXA where (CAI_NUMERO = :pNUMERO) ';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
           SQLConnection := dm.SQLAdmin;
           sql.Add(texto);
           Params.ParamByName('pNUMERO').AsInteger := iNumCaixa;
           Open;
           //
           If not (IsEmpty) Then
              Result := FieldByname('CAI_RGINICIAL').AsInteger;
     finally
         free;
     end;
End;

Function CaixaRGFinal(iNumCaixa : Integer) : Integer;
var
    qraux : TSQLquery;
    texto : string;
begin
    texto := 'Select CAI_NUMERO, CAI_LOJA, CAI_RGFINAL from CAIXA where (CAI_NUMERO = :pNUMERO) ';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
           SQLConnection := dm.SQLAdmin;
           sql.Add(texto);
           Params.ParamByName('pNUMERO').AsInteger := iNumCaixa;
           Open;
           //
           If not (IsEmpty) Then
              Result := FieldByname('CAI_RGFINAL').AsInteger;
     finally
         free;
     end;
End;

Function GetValorInicialCaixa(iSequencia, iCaixa : Integer) : Double;
var
    qraux : TSQLquery;
    texto : string;
begin
    Result := 0;
    texto := 'Select MCA_CAIXA, MCA_VLMODALIDADE, MCA_CAIXA, MCA_TIPOMOV from MOVIMENTO_CAIXA ';
    texto := texto + ' Where (MCA_SEQUENCIA = :pSEQUENCIA) AND (MCA_CAIXA = :pCAIXA) AND (MCA_TIPOMOV = :pTIPOMOV) ';
    //
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
           SQLConnection := dm.SQLAdmin;
           sql.Add(texto);
           Params.ParamByName('pSEQUENCIA').AsInteger := iSequencia;
           Params.ParamByName('pCAIXA').AsInteger     := iCaixa;
           Params.ParamByName('pTIPOMOV').AsString    := 'A';
           Open;
           //
           If not (IsEmpty) Then
              Result := FieldByname('MCA_VLMODALIDADE').AsFloat;
     finally
         free;
     end;
End;

Function GetValorDigitadoFechamentoCaixa(iNumCaixa, iModalidade : Integer) : Double;
var
    qraux : TSQLquery;
    texto : string;
begin
    Result := 0;
    texto := 'Select CXF_NUMERO, MOD_MODALIDADE, CXF_VALOR from CAIXA_FECHAR ';
    texto := texto + ' Where (CXF_NUMERO = :pNUMERO) AND (MOD_MODALIDADE = :pMODALIDADE) ';
    //
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
           SQLConnection := dm.SQLAdmin;
           sql.Add(texto);
           Params.ParamByName('pNUMERO').AsInteger     := iNumCaixa;
           Params.ParamByName('pMODALIDADE').AsInteger := iModalidade;
           Open;
           //
           If not (IsEmpty) Then
              Result := FieldByname('CXF_VALOR').AsFloat;
     finally
         free;
     end;
End;

Function GetTotalVendidoCaixa(iCaixa, iRegInicial, iRegFinal : Integer) : Double;
var
    qraux : TSQLquery;
    texto : string;
begin
    Result := 0;
    texto := 'Select M.mov_vendedor, SUM(M.mov_valor) as TOTAL from VENDAS M ';
    texto := texto + ' WHERE (M.mov_sequencia >= :pINICIO) AND (M.mov_sequencia <= :pFIM) ';
    texto := texto + ' AND (M.mov_vendedor = :pCDCAIXA) AND (M.mov_situacao = '+QuotedStr('F')+') GROUP BY M.mov_vendedor ';
    //
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
           SQLConnection := dm.SQLAdmin;
           sql.Add(texto);
           Params.ParamByName('pINICIO').AsInteger   := iRegInicial;
           Params.ParamByName('pFIM').AsInteger      := iRegFinal;
           Params.ParamByName('pCDCAIXA').AsInteger  := iCaixa;
           Open;
           //
           If not (IsEmpty) Then
              Result := FieldByname('TOTAL').AsFloat;
     finally
         free;
     end;
End;

function Potencia(Base, Expoente : Extended) : Extended;
begin
      Potencia := Exp(Expoente * Ln(Base));
end;


function Data_Juliana (Data_Atual: TDateTime): String;
var
    Ano, Mes, Dia: Word;
    Data_Final, Data_Inicial: String;
    Resultado: Real;
begin
    //DecodeDate (Date, Ano, Mes, Dia);
    DecodeDate (Data_Atual, Ano, Mes, Dia);
    Data_Final := DateToStr (Data_Atual);
    Data_Inicial := '31/12/' + IntToStr (Ano - 1);
    Resultado := StrToDate (Data_Final) - StrToDate (Data_Inicial);
    Result := FloatToStr (Resultado);
end;

Function CopiarArquivo(aOrigem, aDestino : String) : boolean;
var
  SR: TSearchRec;
  I: integer;
begin
  // CopyFile(PChar(txtNomeArquivoRetorno.Text), PChar(M_NMPAST) ,True);
  Result := False;
  if not CopyFile(PChar(aOrigem), PChar(aDestino), true) then
    raise Exception.Create('Erro ao copiar ' + aOrigem + ' para ' + aDestino);
  Result := True;
End;

procedure AddLog(aMensagem: String);
var
  log: textfile;
  aFileLog : String;
begin
  try
     aFileLog := ExtractFilePath( Application.ExeName )+'\nn.txt';
     AssignFile(log, aFileLog );
     if not FileExists(aFileLog) then
        Rewrite(log, aFileLog);
     Append(log);
     WriteLn(log, aMensagem);
  finally
     CloseFile(log);
  end;
end;

function LimpaString(ATexto: String):String;
var
  I: Integer;
  s: string;
begin
  S := '';
  for I := 1 To Length(ATexto) Do
    if (ATexto[I] in ['0'..'9']) then
      S := S + Copy(ATexto, I, 1);
  Result := S;
end;

Function ProximoDiaUtil (dData : TDateTime) : TDateTime; 
begin 
    if DayOfWeek(dData) = 7 then
      dData := dData + 2
    else
      if DayOfWeek(dData) = 1 then
        dData := dData + 1;
    ProximoDiaUtil := dData;
end;


end.

