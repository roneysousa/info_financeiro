unit uFrmEntradasSaidas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, DB, DBXpress;

type
  TfrmEntradaSaida = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtAdicionar: TBitBtn;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    Label1: TLabel;
    cmbLoja: TDBLookupComboBox;
    cmbTipo: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    dbeObservacao: TDBEdit;
    Label4: TLabel;
    dbeValor: TDBEdit;
    Label5: TLabel;
    cmbModa: TDBLookupComboBox;
    Label6: TLabel;
    cmbNatureza: TDBLookupComboBox;
    cmbFunc: TComboBox;
    lbl_func: TLabel;
    procedure BtSairClick(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure dbeCDNATUExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbTipoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
      novo, alterar, apagar : String;
      procedure tratabotoes;
      procedure Comp_Func(M_SITUAC : Boolean);
      procedure Carregar_Funcionario;
      procedure Limpar;
      procedure Natureza_Tipo(aTipo : String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEntradaSaida: TfrmEntradaSaida;
  TD : TTransactionDesc;
  M_NRSEQU, M_CDCAIX : INTEGER;
  M_CXGERA : String;

implementation

uses Udm, uFuncoes, UFrmAdmin, uDm2, udmConsulta, DBClient, SqlExpr,
  udmDados;

{$R *.dfm}

procedure TfrmEntradaSaida.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmEntradaSaida.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
   cmbTipo.Enabled := not cmbTipo.Enabled; 
end;

procedure TfrmEntradaSaida.BtAdicionarClick(Sender: TObject);
begin
    tratabotoes;
    dm.parametros;
    M_NRSEQU := dm.CdsConfigCFG_SEQUENCIA.Value+1;
    //
    dm.cdsMovimentoCaixa.close;
    With dm.dstMovimentoCaixa do
    begin
         Active := False;
         CommandText := 'select * from MOVIMENTO_CAIXA Where (MCA_SEQUENCIA = :pSEQUENCIA)';
         Params.ParamByName('pSEQUENCIA').AsInteger := M_NRSEQU;
         Active := True;
    End;
    dm.cdsMovimentoCaixa.Open;
    //
    If (dm.cdsMovimentoCaixa.IsEmpty) Then
    Begin
        dm.cdsMovimentoCaixa.Append;
        dm.cdsMovimentoCaixaMCA_SEQUENCIA.Value := M_NRSEQU;
        cmbTipo.ItemIndex := -1;
        cmbLoja.SetFocus;
    End
    Else
    Begin
         tratabotoes;
         Application.MessageBox('Error ao tentar incluir novo registro!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         Exit;
    End;
end;

procedure TfrmEntradaSaida.BtCancelarClick(Sender: TObject);
begin
    tratabotoes;
    dm.cdsMovimentoCaixa.Cancel;
    dm.cdsMovimentoCaixa.Close;
    //
    Comp_Func(False);
    //
    Limpar;
end;

procedure TfrmEntradaSaida.BtGravarClick(Sender: TObject);
Var
    M_CDMODA, W_CDLOJA, W_CDNATU : Integer;
    M_VLANTE, M_VLMOVI, M_VLATUA : Double;
    M_HOMOVI, M_TPMOVI, M_NMDESC : String;
    M_DTMOVI : TDate;
begin
     If uFuncoes.Empty(cmbLoja.Text) Then
     Begin
            Application.MessageBox('Selecione a loja!!!','ATENÇÃO',
                  MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            cmbLoja.SetFocus;
            Exit;
     End;
     //
     If uFuncoes.Empty(cmbTipo.Text) Then
     Begin
            Application.MessageBox('Selecione o tipo de movimento!!!','ATENÇÃO',
                  MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            cmbTipo.SetFocus;
            Exit;
     End;
     //
     If uFuncoes.Empty(dbeValor.Text) Then
     Begin
            Application.MessageBox('Digite o valor do movimento!!!','ATENÇÃO',
                  MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            dbeValor.SetFocus;
            Exit;
     End;
     //
     If uFuncoes.Empty(cmbModa.Text) Then
     Begin
            Application.MessageBox('Selecione a modalidade!!!','ATENÇÃO',
                  MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            cmbModa.SetFocus;
            Exit;
     End;
     //
     Try
         tratabotoes;
         // Inicia um transação no BD
         TD.TransactionID  := StrtoInt(UFrmAdmin.M_CDUSUA);
         TD.IsolationLevel := xilREADCOMMITTED;
         Dm.SqlAdmin.StartTransaction(TD);
         //
         M_HOMOVI := Copy(TimetoStr(Time),1,5);
         M_DTMOVI := Date();
         M_VLANTE := 0;
         M_VLMOVI := 0;
         M_VLATUA := 0;
         W_CDLOJA := uFuncoes.CDLOJA(cmbLoja.Text);
         W_CDNATU := dmConsultas.GetNaturezaCogigo(cmbNatureza.Text);
         M_CDMODA := dmDados.GetModaRecebimento(dm.cdsMovimentoCaixaMCA_MODALIDADE.AsInteger);
         //
         If (cmbTipo.ItemIndex = 0) then
         begin
             M_TPMOVI := 'S';
             M_NMDESC := 'SANGRIA';
         End
         Else
         begin
             M_TPMOVI := 'E';
             M_NMDESC := 'SUPRIMENTO';
         End;
         //
         If (dm.cdsMovimentoCaixa.State in [dsInsert]) Then
         Begin
              dm.parametros;
              dm.CdsConfig.Edit;
              Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat :=
                  Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat+1;
              dm.cdsMovimentoCaixaMCA_SEQUENCIA.Value := Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsInteger;
              dm.CdsConfig.Post;
              dm.CdsConfig.ApplyUpdates(0);
         End;
         //
         dm.cdsMovimentoCaixaMCA_DTMOVIMENTO.Value := Date();
         dm.cdsMovimentoCaixaMCA_HRMOVIMENTO.AsString := TimetoStr(Time);
         If (cmbTipo.Text = 'SANGRIA') Then
             dm.cdsMovimentoCaixaMCA_TIPOMOV.AsString := 'S'
         Else
             dm.cdsMovimentoCaixaMCA_TIPOMOV.AsString := 'E';
         //
         If not Empty(cmbFunc.Text) Then
             Dm.cdsMovimentoCaixaMCA_FUNCIONARIO.AsInteger := dmConsultas.GetCodFuncionario(cmbFunc.Text);
         //
         dm.cdsMovimentoCaixaMCA_CAIXA.AsInteger := M_CDCAIX;
         dm.cdsMovimentoCaixa.Post;
         dm.cdsMovimentoCaixa.ApplyUpdates(0);
          // nova alteração  Caixa Geral
          If (M_CXGERA = 'S') Then
            begin
                 M_VLANTE := dmDados.GetValorAtual(M_CDMODA);
                 M_VLMOVI := dm.cdsMovimentoCaixa.FieldByName('MCA_VLMODALIDADE').AsFloat;
                 //
                 If (M_TPMOVI = 'S') Then
                    dmDados.SetSaldoConta(M_CDMODA,M_VLMOVI,'S')
                 Else
                    dmDados.SetSaldoConta(M_CDMODA,M_VLMOVI,'E');
                 //
                 M_VLATUA := dmDados.GetValorAtual(M_CDMODA);
                 // Nova alteração   incluir registro o Caixa Geral
                 dmDados.Incluir_Movimento_Contas(W_CDLOJA, StrtoInt(uFrmAdmin.M_CDUSUA),
                           M_CDMODA, W_CDNATU, 0, 0,
                           M_VLANTE, M_VLMOVI, M_VLATUA,
                           dm.cdsMovimentoCaixa.FieldByName('MCA_SEQUENCIA').AsString,
                           M_TPMOVI, M_HOMOVI, M_NMDESC, '','', M_DTMOVI);
            End;
         // Grava
         Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
         //
         Application.MessageBox(PChar('Registro gravado com sucesso.'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
     Except
         on Exc:Exception do
         begin
              Application.MessageBox(PChar('Erro ao tentar gravar registro!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              //  Cancelar transação no BD.
              Dm.SqlAdmin.Rollback(TD);
         End;
     End;
     //
     dm.cdsMovimentoCaixa.Close; 
     Comp_Func(False);
     //
     Limpar;
end;

procedure TfrmEntradaSaida.dbeCDNATUExit(Sender: TObject);
begin
{      If (dm.cdsMovimentoCaixa.State in [dsInsert])
       and not uFuncoes.Empty(cmbNatureza.Text) Then
         dbeCDNATU.Text := uFuncoes.StrZero(dbeCDNATU.Text,2);}
end;

procedure TfrmEntradaSaida.FormShow(Sender: TObject);
begin
     dmConsultas.cdsNatureza.Close;
     dmConsultas.cdsNatureza.Open; 
     dm.cdsMovimentoCaixa.Close;
     //
     Comp_Func(False);
end;

procedure TfrmEntradaSaida.Comp_Func(M_SITUAC: Boolean);
begin
     lbl_func.Visible := M_SITUAC;
     cmbFunc.Visible  := M_SITUAC;
end;

procedure TfrmEntradaSaida.cmbTipoExit(Sender: TObject);
begin
     If (cmbTipo.ItemIndex = 0) Then
     begin
         Carregar_Funcionario;
         Comp_Func(True);
     End
     Else
         Comp_Func(False);
     //
     If (cmbTipo.ItemIndex = 0) Then
         Natureza_Tipo('1')
     Else
         Natureza_Tipo('2');
end;

procedure TfrmEntradaSaida.Carregar_Funcionario;
begin
      with DM2.cdsGenerico do
        begin
             active := False;
             CommandText := 'Select FUN_CODIGO, FUN_NOME from FUNCIONARIOS order by FUN_NOME';
             Active := True;
             //
             If not (IsEmpty) Then
             begin
                  First;
                  cmbFunc.Clear;
                  While not (Eof) do
                    begin
                         cmbFunc.Items.Add(fieldByName('FUN_NOME').AsString);
                         //
                         next;
                    End;
             End;
             //
             active := False;
        End;
end;

procedure TfrmEntradaSaida.FormCreate(Sender: TObject);
begin
   If not (UFrmAdmin.admin) Then
   begin
     novo    := UFrmAdmin.aNovo;
     alterar := UFrmAdmin.aAlterar;
     apagar  := UFrmAdmin.aApagar;
     //
     If Empty(novo) or Empty(alterar) or Empty(apagar) Then
     begin
           dm.Verificar_Direitoa_Acesso(
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Suprimento e Sangrias'));
           //
           novo    := UFrmAdmin.aNovo;
           alterar := UFrmAdmin.aAlterar;
           apagar  := UFrmAdmin.aApagar;
           //
     End;
     //
     FrmAdmin.Limpar_Acessos;
     //
     BtAdicionar.Visible := (novo = 'S');
     //BtEditar.Visible    := (alterar = 'S');
     //BtExcluir.Visible   := (apagar = 'S');
     //
   End;
end;

procedure TfrmEntradaSaida.Limpar;
begin
     cmbTipo.ItemIndex := -1;
     dbeObservacao.Clear;
     dbeValor.Clear;
     cmbFunc.ItemIndex := -1;
end;

procedure TfrmEntradaSaida.Natureza_Tipo(aTipo: String);
begin
     dmConsultas.cdsNatureza.Close;
     With dmConsultas.dstNatureza do
      begin
           Active := False;
           CommandText := 'select NAT_CODIGO, NAT_NOME from NATUREZA ';
           CommandText := CommandText + ' Where (NAT_TIPO = :pTIPO) ';
           CommandText := CommandText + ' order by NAT_NOME ';
           ParamByName('pTIPO').AsString := aTipo;
           Active := True;
      End;
     dmConsultas.cdsNatureza.Open;
end;

End.

