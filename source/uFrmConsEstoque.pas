unit uFrmConsEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, FMTBcd, SqlExpr, DB,
  DBClient, Provider;

type
  TfrmConsultaEstoque = class(TForm)
    pnlLoja: TPanel;
    lblData: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    pnlInferior: TPanel;
    Label1: TLabel;
    GridEstoque: TDBGrid;
    rgConsultar: TRadioGroup;
    lblConsultar: TLabel;
    edtConsultar: TEdit;
    dstConsEstoque: TSQLDataSet;
    qryLoja: TSQLQuery;
    dspConsEstoque: TDataSetProvider;
    cdsConsEstoque: TClientDataSet;
    dsConsulta: TDataSource;
    Panel1: TPanel;
    sbProximo: TSpeedButton;
    sbUltimo: TSpeedButton;
    sbAnterior: TSpeedButton;
    sbPrimeiro: TSpeedButton;
    qryProcurar: TSQLQuery;
    cmbNMLOJA: TComboBox;
    qryLojas2: TSQLQuery;
    qryLojas2EMP_CODIGO: TIntegerField;
    qryLojas2EMP_FANTASIA: TStringField;
    qryLojas2EMP_RAZAO: TStringField;
    btnAlterar: TBitBtn;
    cdsConsEstoqueEST_CODIGOLOJA: TIntegerField;
    cdsConsEstoquePRO_CODIGO: TStringField;
    cdsConsEstoquePRO_DESCRICAO: TStringField;
    cdsConsEstoqueEST_QUANTIDADE: TFMTBCDField;
    procedure btnAlterarClick(Sender: TObject);
    procedure rgConsultarClick(Sender: TObject);
    procedure edtCDLOJAKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dsConsultaDataChange(Sender: TObject; Field: TField);
    procedure dsConsultaStateChange(Sender: TObject);
    procedure sbPrimeiroClick(Sender: TObject);
    procedure sbAnteriorClick(Sender: TObject);
    procedure sbProximoClick(Sender: TObject);
    procedure sbUltimoClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure edtCDLOJAEnter(Sender: TObject);
    procedure GridEstoqueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure cmbNMLOJAKeyPress(Sender: TObject; var Key: Char);
    procedure cmbNMLOJAEnter(Sender: TObject);
    procedure cmbNMLOJAChange(Sender: TObject);
  private
     procedure CONSULTA;
     procedure BUSCA_PRODUTO;
     procedure BUSCA_CODIGO;
     procedure BUSCA_NOME;
     procedure LOJAS;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaEstoque: TfrmConsultaEstoque;
  M_CDLOJA : Integer;
implementation

uses Udm, uFuncoes;

{$R *.dfm}

procedure TfrmConsultaEstoque.btnAlterarClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmConsultaEstoque.rgConsultarClick(Sender: TObject);
begin
  case rgConsultar.ItemIndex of
    0:
    begin
      lblConsultar.Caption := 'Código:';
      edtConsultar.Clear;
      If (cdsConsEstoque.Active) Then
          BUSCA_CODIGO;
    end;
    1:
    begin
      lblConsultar.Caption := 'Nome/Descrição:';
      edtConsultar.Clear;
      If (cdsConsEstoque.Active) Then
          BUSCA_NOME;
    end;
  end;
  if edtConsultar.CanFocus then
    edtConsultar.SetFocus;
end;

procedure TfrmConsultaEstoque.edtCDLOJAKeyPress(Sender: TObject;
  var Key: Char);
begin
    If (key = #37) Then
      key :=#0;
    //
      If (Key = #13) Then
      //not uFuncoes.Empty(edtCDLOJA.Text) Then
      Begin
           Key := #0;
           //
           With qryLoja do
           begin
                Close;
                //Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDLOJA.Text);
                //
                Open;
           End;
           //
           if qryLoja.IsEmpty then
               MessageDlg('Registro de loja não encontrado!' + #13 + 'Refaça a pesquisa', mtInformation, [mbOk], 0)
           Else
               CONSULTA;
      End;
end;

procedure TfrmConsultaEstoque.FormShow(Sender: TObject);
begin
     LOJAS;
end;

procedure TfrmConsultaEstoque.dsConsultaDataChange(Sender: TObject;
  Field: TField);
begin
  sbPrimeiro.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Bof);
  sbAnterior.Enabled := sbPrimeiro.Enabled;
  sbUltimo.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Eof);
  sbProximo.Enabled := sbUltimo.Enabled;
end;

procedure TfrmConsultaEstoque.dsConsultaStateChange(Sender: TObject);
begin
  pnlInferior.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty);
end;

procedure TfrmConsultaEstoque.sbPrimeiroClick(Sender: TObject);
begin
     If (cdsConsEstoque.Active) then
        dsConsulta.DataSet.First;
end;

procedure TfrmConsultaEstoque.sbAnteriorClick(Sender: TObject);
begin
     If (cdsConsEstoque.Active) then
        dsConsulta.DataSet.Prior;
end;

procedure TfrmConsultaEstoque.sbProximoClick(Sender: TObject);
begin
     If (cdsConsEstoque.Active) then
        dsConsulta.DataSet.Next;
end;

procedure TfrmConsultaEstoque.sbUltimoClick(Sender: TObject);
begin
     If (cdsConsEstoque.Active) then
        dsConsulta.DataSet.Last;
end;

procedure TfrmConsultaEstoque.CONSULTA;
begin
     With cdsConsEstoque do
     Begin
          Active := False;
          Params.ParamByName('pCDLOJA').AsInteger := M_CDLOJA;
          Active := True;
     End;
     //
     If not (cdsConsEstoque.IsEmpty) Then
     begin
         GridEstoque.SetFocus;
     End
     Else
     Begin
           Application.MessageBox(PChar('Não há estoque na loja indicada!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           Exit;
     End;
end;

procedure TfrmConsultaEstoque.BUSCA_PRODUTO;
Var
    M_CDPROD : String;
begin
     With qryProcurar do
     Begin
          Close;
          SQL.Clear;
          SQL.Add('Select PRO_CODIGO, PRO_BARRAS, PRO_DESCRICAO from PRODUTOS ');
          SQL.Add(' Where UPPER(PRO_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%'));
          Open;
     End;
     //
     If not (qryProcurar.IsEmpty) Then
     Begin
          M_CDPROD := qryProcurar.FieldByName('PRO_CODIGO').AsString;
          cdsConsEstoque.Locate('PRO_CODIGO', M_CDPROD, []);
     End;
end;

procedure TfrmConsultaEstoque.edtConsultarChange(Sender: TObject);
begin
     If not uFuncoes.Empty (edtConsultar.Text)
      and (cdsConsEstoque.Active) Then
     Begin
          case rgConsultar.ItemIndex of
              0: cdsConsEstoque.Locate('PRO_CODIGO',uFuncoes.StrZero(edtConsultar.Text,13), [loPartialKey]);
              1: cdsConsEstoque.Locate('PRO_DESCRICAO',edtConsultar.Text, [loPartialKey]);
          end;
     End;
end;

procedure TfrmConsultaEstoque.edtCDLOJAEnter(Sender: TObject);
begin
      edtConsultar.Clear;
end;

procedure TfrmConsultaEstoque.GridEstoqueKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if (Shift = [ssCtrl]) and (Key = 46) Then
        KEY := 0;
end;


procedure TfrmConsultaEstoque.BUSCA_CODIGO;
begin
end;

procedure TfrmConsultaEstoque.BUSCA_NOME;
begin
end;

procedure TfrmConsultaEstoque.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
    If (key = #37) Then
      key :=#0;
    //
    if rgConsultar.ItemIndex = 0 then
    begin
      if not( key in['0'..'9', #8, #13] ) then
      begin
        beep;
        key:=#0;
      end;
    end;
    //
     If (Key = #13) and not uFuncoes.Empty(edtConsultar.Text) Then
     Begin
          Key := #0;
          //
          If (rgConsultar.ItemIndex = 0) then
              BUSCA_CODIGO
          Else
              BUSCA_NOME;
     End;
end;

procedure TfrmConsultaEstoque.LOJAS;
begin
     With qryLojas2 do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select EMP_CODIGO, EMP_FANTASIA, EMP_RAZAO from EMPRESAS');
          SQL.Add('order by EMP_FANTASIA');
          Open;
          First;
     End;
     //
     While not (qryLojas2.Eof) do
     Begin
          cmbNMLOJA.Items.Add(qryLojas2.FieldByName('EMP_FANTASIA').AsString);
          //
          qryLojas2.Next;
     End;
end;

procedure TfrmConsultaEstoque.cmbNMLOJAKeyPress(Sender: TObject;
  var Key: Char);
begin
      If (Key = #13) and not uFuncoes.Empty(cmbNMLOJA.Text) Then
      Begin
           Key := #0;
           //
           With qryLojas2 do
           Begin
                SQL.Clear;
                Close;
                SQL.Add('Select EMP_CODIGO, EMP_FANTASIA, EMP_RAZAO from EMPRESAS');
                SQL.Add('Where (EMP_FANTASIA = :pFANTASIA)');
                Params.ParamByName('pFANTASIA').AsString := cmbNMLOJA.Text;
                Open;
                First;
           End;
           //
           M_CDLOJA := qryLojas2.FieldByName('EMP_CODIGO').AsInteger;
           //
           With qryLoja do
           begin
                Close;
                Params.ParamByName('pCODIGO').AsInteger := M_CDLOJA;
                //
                Open;
           End;
           //
           if qryLoja.IsEmpty then
           begin
                MessageDlg('Registro de loja não encontrado!' + #13 + 'Refaça a pesquisa', mtInformation, [mbOk], 0);
                cmbNMLOJA.SetFocus;
           end
           Else
           begin
               //
               CONSULTA;
           End;
      End;
end;

procedure TfrmConsultaEstoque.cmbNMLOJAEnter(Sender: TObject);
begin
     edtConsultar.Clear; 
end;

procedure TfrmConsultaEstoque.cmbNMLOJAChange(Sender: TObject);
begin
           With qryLojas2 do
           Begin
                SQL.Clear;
                Close;
                SQL.Add('Select EMP_CODIGO, EMP_FANTASIA, EMP_RAZAO from EMPRESAS');
                SQL.Add('Where (EMP_FANTASIA = :pFANTASIA)');
                Params.ParamByName('pFANTASIA').AsString := cmbNMLOJA.Text;
                Open;
                First;
           End;
           //
           M_CDLOJA := qryLojas2.FieldByName('EMP_CODIGO').AsInteger;
           //
           With qryLoja do
           begin
                Close;
                Params.ParamByName('pCODIGO').AsInteger := M_CDLOJA;
                //
                Open;
           End;
           //
           if not qryLoja.IsEmpty then
               CONSULTA;
end;

end.
