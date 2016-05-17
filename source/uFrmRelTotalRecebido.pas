unit uFrmRelTotalRecebido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ToolEdit, ExtCtrls, DB, DBClient,
  FMTBcd, SqlExpr, Provider;

type
  TfrmRelTotalMes = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cmbNMLOJA: TComboBox;
    Panel2: TPanel;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    edtExercicio: TEdit;
    Label3: TLabel;
    edtCliente: TEdit;
    cdsTotal: TClientDataSet;
    dspDados: TDataSetProvider;
    dstDados: TSQLDataSet;
    cdsTotalARECEBER: TFMTBCDField;
    cdsTotalRECEBIDO: TFMTBCDField;
    spLocCliente: TSpeedButton;
    lblCliente: TLabel;
    cdsTotalREC_LOJA: TIntegerField;
    procedure BtSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtExercicioKeyPress(Sender: TObject; var Key: Char);
    procedure edtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure BtGravarClick(Sender: TObject);
    procedure edtClienteChange(Sender: TObject);
    procedure spLocClienteClick(Sender: TObject);
    procedure edtClienteExit(Sender: TObject);
    procedure edtExercicioExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelTotalMes: TfrmRelTotalMes;

implementation

uses uFuncoes, uDmRelatorios, Udm, uFrmBuscaClientes, udmConsulta;

{$R *.dfm}

procedure TfrmRelTotalMes.BtSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmRelTotalMes.FormShow(Sender: TObject);
begin
     uFuncoes.Loja_Combo(cmbNMLOJA);
     lblCliente.Caption := ''; 
end;

procedure TfrmRelTotalMes.edtExercicioKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
       key:=#0;
end;

procedure TfrmRelTotalMes.edtClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
         key:=#0;
     //
     If (key = #13) and not uFuncoes.Empty(edtCliente.Text) Then
     Begin
          Key := #0;
          BtGravar.SetFocus;
     End;
     //
     If (key = #13) and uFuncoes.Empty(edtCliente.Text) Then
     Begin
          Key := #0;
          spLocClienteClick(Sender);
     End;
end;

procedure TfrmRelTotalMes.BtGravarClick(Sender: TObject);
Var
   mes : integer;
   M_ARECEB, M_RECEBI : Double;
begin
     if Empty (cmbNMLOJA.Text) Then
      begin
           cmbNMLOJA.SetFocus;
           exit;
      End;
      //
     if Empty (edtExercicio.Text) Then
      begin
           edtExercicio.SetFocus;
           exit;
      End;
      //
     try
         for mes := 1 to 12 do
         begin
           with cdsTotal do
             begin
                 Active := False;
                 CommandText := 'Select r.rec_loja, Sum(R.rec_valorparcela) AS ARECEBER, ';
                 CommandText := CommandText + 'SUM(R.rec_pago) AS RECEBIDO from CONTASRECEBER R ';
                 CommandText := CommandText + 'Where (extract(year from R.REC_DATAVENCIMENTO) = :pANO) ';
                 CommandText := CommandText + 'AND (extract(MONTH from R.REC_DATAVENCIMENTO) = :pMES) ';
                 CommandText := CommandText + 'and (REC_LOJA = :pLOJA) ';
                 If not Empty(edtCliente.Text) Then
                      CommandText := CommandText + ' and (R.REC_CLIENTE = :pCLIENTE) ';
                 CommandText := CommandText + 'Group by r.rec_loja ';
                 Params.ParamByName('pANO').AsInteger  := StrtoInt(edtExercicio.Text);
                 Params.ParamByName('pMES').AsInteger  := mes;
                 Params.ParamByName('pLOJA').AsInteger := uFuncoes.CDLOJA(cmbNMLOJA.Text);
                 If not Empty(edtCliente.Text) Then
                     Params.ParamByName('pCLIENTE').AsInteger := StrtoInt(edtCliente.Text);
                 Active := True;
                 //
                 M_ARECEB := 0;
                 M_RECEBI := 0;
                 //
                 If not (IsEmpty) Then
                 begin
                      First;
                      {While not (EoF) do
                      begin}
                         // A receber
                         M_ARECEB := fieldBYName('ARECEBER').AsFloat;
                         // Recebida
                         M_RECEBI := fieldBYName('RECEBIDO').AsFloat;
                         //
                         Next;
                      //End;  // fim-enquanto
                 End;
                 //
                 dmRelatorios.Adicionar_Dados_Total_Mes(StrtoInt(edtExercicio.Text), mes, M_ARECEB, M_RECEBI);
             End;
         End;  //fim-para
         //
         If not (dmRelatorios.cdsTotalMes.IsEmpty ) Then
          begin
               With dmRelatorios do
                begin
                     lblLoja.Caption      := 'LOJA      : ' + cmbNMLOJA.Text;
                     lblExercicio.Caption := 'EXERCÍCIO : ' + edtExercicio.Text;
                     if not Empty(edtCliente.Text) Then
                        lblNomeCliente.Caption  := 'CLIENTE    : ' + lblCliente.Caption
                     Else
                        lblNomeCliente.Caption  := 'CLIENTE    : TODOS';
                     //
                     ppRepTotalMes.PrintReport;
                End;
          End
          Else
               Application.MessageBox(PChar('Não há movimento no exercício indicado!!!'),
                       'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
     Finally
           cdsTotal.Close;
           dmRelatorios.cdsTotalMes.EmptyDataSet;
           dmRelatorios.cdsTotalMes.Close;
     End;
end;

procedure TfrmRelTotalMes.edtClienteChange(Sender: TObject);
begin
     If Empty(edtCliente.Text) Then
       lblCliente.Caption := '';
end;

procedure TfrmRelTotalMes.spLocClienteClick(Sender: TObject);
begin
  with TfrmBuscaClientes.create(self) do
  try
     showmodal;
  finally
    If not Empty(cdsBuscaCLI_CODIGO.AsString) Then
       edtCliente.Text := StrZero(cdsBuscaCLI_CODIGO.AsString,7)
    Else
       edtCliente.SetFocus;
    free;
  end;
end;

procedure TfrmRelTotalMes.edtClienteExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCliente.Text) Then
      begin
           If not (dmConsultas.GetCliente(StrtoInt(edtCliente.Text))) Then
            begin
                 lblCliente.Caption := '';
                 edtCliente.SetFocus;
                 raise Exception.Create('Cliente não cadastro.');
            End
            Else
            begin
               edtCliente.Text := StrZero(edtCliente.Text,7);
               lblCliente.Caption := dmConsultas.qryConsulta.FieldByName('CLI_FANTASIA').AsString;
            End;
      End;
end;

procedure TfrmRelTotalMes.edtExercicioExit(Sender: TObject);
begin
     if not Empty(edtExercicio.Text) Then
       begin
            try
                StrtoDate(Copy(DatetoStr(Date()),1,6)+edtExercicio.Text);
                edtExercicio.Text := Copy(DatetoStr(StrtoDate(Copy(DatetoStr(Date()),1,6)+edtExercicio.Text)),7,4);
            Except
                on EConvertError do
                   ShowMessage ('Ano Inválido!');
            End;
       End;
end;

end.
