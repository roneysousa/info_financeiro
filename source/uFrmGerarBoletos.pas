unit uFrmGerarBoletos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Mask, ToolEdit, CurrEdit,
  Buttons, FMTBcd, DB, DBClient, Provider, SqlExpr, DBCtrls,
  BmsXPProgressBar;

type
  TfrmGerarBoletos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Panel4: TPanel;
    grdConsultar: TDBGrid;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    edbDTEMISSAO: TDateEdit;
    cmbConta: TComboBox;
    Label10: TLabel;
    Label2: TLabel;
    edtDTVENC: TDateEdit;
    edtValor: TCurrencyEdit;
    edtDesconto: TCurrencyEdit;
    edtJuros: TCurrencyEdit;
    edtMulta: TCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    BtSair: TBitBtn;
    BtGravar: TBitBtn;
    Label12: TLabel;
    Label13: TLabel;
    cmbGrupos: TComboBox;
    edtCDCLIE: TEdit;
    spLocClientes: TSpeedButton;
    lbl_NMCLIE: TEdit;
    dstConsultar: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    dsConsultar: TDataSource;
    cdsConsultarCLI_CODIGO: TIntegerField;
    cdsConsultarCLI_FANTASIA: TStringField;
    cdsConsultarCLI_CGC: TStringField;
    cdsConsultarCLI_NRBOX: TStringField;
    cdsConsultarCLI_CDGRUPO: TIntegerField;
    rgOrdem: TRadioGroup;
    DBNavigator1: TDBNavigator;
    cdsConsultarCLI_TIPOPESSOA: TStringField;
    cdsConsultarCPF_CNPJ: TStringField;
    Memo1: TMemo;
    lblRegistros: TLabel;
    BmsXPProgressBar1: TBmsXPProgressBar;
    lblPercentual: TLabel;
    cmbNMLOJA: TComboBox;
    Label14: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure spLocClientesClick(Sender: TObject);
    procedure edtCDCLIEExit(Sender: TObject);
    procedure cmbGruposExit(Sender: TObject);
    procedure rgOrdemClick(Sender: TObject);
    procedure edtCDCLIEChange(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
    procedure edbDTEMISSAOExit(Sender: TObject);
    procedure edtDTVENCExit(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtCDCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure cmbGruposEnter(Sender: TObject);
    procedure cdsConsultarCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure Carregar_Contas;
    procedure Carregar_Lojas;
    procedure Carregar_Grupos;
    Procedure Consulta_Clientes;
    Function Validar_Campos() : Boolean;
    Function IncluirBoletoCliente(iCliente, iLoja, iCedente : Integer;
             aDtEmissao, aDtVencimento : TDatetime; fValor, fDesconto, fJuro, fMulta : Double; aFatura : String): Boolean;
  public
    { Public declarations }
  end;

var
  frmGerarBoletos: TfrmGerarBoletos;

implementation

uses Udm, udmConsulta, uFrmBuscaClientes, uFuncoes, uLocCliente, Math,
  UFrmAdmin, udmDados, uDmRelatorios;

{$R *.dfm}

{ TfrmGerarBoletos }

procedure TfrmGerarBoletos.Carregar_Contas;
begin
      dm.RefreshCDS(dmConsultas.cdsListaCedentes);
      //
      With dmConsultas.cdsListaCedentes do
        begin
             first;
             cmbConta.Clear;
             While not (Eof) do
              begin
                   cmbConta.Items.Add(FieldByName('CEDENTE_NOME').AsString);
                   //
                   Next;
              End;
        End;
end;

procedure TfrmGerarBoletos.FormShow(Sender: TObject);
begin
      Carregar_Contas();
      Carregar_Grupos;
      Carregar_Lojas;
      //
      lblPercentual.Visible := false;
      //
      edbDTEMISSAO.Date := Date();
      //
      BtGravar.Enabled := False;
end;

procedure TfrmGerarBoletos.BtSairClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmGerarBoletos.Carregar_Grupos;
begin
      dm.RefreshCDS(dmConsultas.cdsGrupos);
      //
      cmbGrupos.Clear;
      With dmConsultas.cdsGrupos do
        begin
             first;
             cmbGrupos.Items.Add(' ');
             While not (Eof) do
              begin
                   cmbGrupos.Items.Add(FieldByName('GRU_DESCRICAO').AsString);
                   //
                   Next;
              End;
        End;
end;

procedure TfrmGerarBoletos.spLocClientesClick(Sender: TObject);
begin
  edtCDCLIE.SetFocus;
  with TfrmLocCliente.create(self) do
  try
    uLocCliente.M_NRFROM := 5;
    showmodal;
  finally
    If not (cdsConsultaCliente.IsEmpty) Then
       edtCDCLIE.Text := uFuncoes.StrZero(cdsConsultaCliente.FieldByname('CLI_CODIGO').AsString,7);
    free;
  end;

  {with TfrmBuscaClientes.create(self) do
  try
     showmodal;
  finally
    If not (frmBuscaClientes.cdsBusca.IsEmpty) Then
       edtCDCLIE.Text := uFuncoes.StrZero(frmBuscaClientes.cdsBuscaCLI_CODIGO.AsString,7);
    //
    If uFuncoes.Empty(edtCDCLIE.Text) Then
       edtCDCLIE.SetFocus;
    free;
  end;}
end;

procedure TfrmGerarBoletos.edtCDCLIEExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          With dmConsultas.qryLocCliente do
          Begin
               Close;
               Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDCLIE.Text);
               Open;
          End;
          //
          If (dmConsultas.qryLocCliente.IsEmpty) Then
          Begin
              Application.MessageBox(PChar('Cliente não cadastrado!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              lbl_NMCLIE.Clear;
              edtCDCLIE.Clear;
              edtCDCLIE.SetFocus;
              Exit;
          End
          Else
          Begin
             If uFuncoes.Empty(edtCDCLIE.text) Then
             begin
                 edtCDCLIE.SetFocus;
                 Exit;
             End;
             //
             lbl_NMCLIE.Text := dmConsultas.qryLocCliente.FieldByName('CLI_FANTASIA').AsString;
             edtCDCLIE.Text := uFuncoes.StrZero(edtCDCLIE.Text,7);
             //
             if not uFuncoes.Empty(edtCDCLIE.Text) Then
                Consulta_Clientes;
          End;
          //
     End;

end;

procedure TfrmGerarBoletos.Consulta_Clientes;
Var
   aTexto, aCampo : String;
   iGrupo : Integer;
begin
     aTexto := 'select CL.CLI_CODIGO, CLI_TIPOPESSOA, CL.CLI_FANTASIA, CL.CLI_CGC, CL.CLI_NRBOX, CL.CLI_CDGRUPO, CL.SIT_CODIGO from CLIENTES CL';
     iGrupo := dm.GetCodigoGrupo(cmbGrupos.Text);
     //
     With cdsConsultar do
      begin
           DisableControls;
           Close;
           //
           If not uFuncoes.Empty(cmbGrupos.Text) Then
              aTexto := aTexto + ' Where (CL.CLI_CDGRUPO = '+QuotedStr(InttoStr(iGrupo))+') ';
           //
           If not uFuncoes.Empty(edtCDCLIE.Text) Then
             If not uFuncoes.Empty(cmbGrupos.Text) Then
                 aTexto := aTexto + ' and (CL.CLI_CODIGO = '+QuotedStr(edtCDCLIE.Text)+') '
             Else
                 aTexto := aTexto + ' Where (CL.CLI_CODIGO = '+QuotedStr(edtCDCLIE.Text)+') ';
           //
           aTexto := aTexto + ' And (CL.SIT_CODIGO = '+QuotedStr('1') +') ';
           //
           case rgOrdem.ItemIndex of
             0 : aCampo := 'CL.CLI_CGC';
             1 : aCampo := 'CL.CLI_FANTASIA';
             2 : aCampo := 'CL.CLI_NRBOX';
           End;
           //
           aTexto := aTexto + ' order by '+aCampo;
           //
           CommandText := aTexto;
           //
           Open;
           EnableControls;
      End;
end;

procedure TfrmGerarBoletos.cmbGruposExit(Sender: TObject);
begin
     if not uFuncoes.Empty(cmbGrupos.Text) Then
         Consulta_Clientes;
end;

procedure TfrmGerarBoletos.rgOrdemClick(Sender: TObject);
begin
     Consulta_Clientes;
end;

procedure TfrmGerarBoletos.edtCDCLIEChange(Sender: TObject);
begin
     if uFuncoes.Empty(edtCDCLIE.Text) Then
     begin
          lbl_NMCLIE.Clear;
          cdsConsultar.Close;
     End;
end;

procedure TfrmGerarBoletos.dsConsultarDataChange(Sender: TObject;
  Field: TField);
begin
    BtGravar.Enabled := not (dsConsultar.DataSet.IsEmpty)
                        and (dsConsultar.DataSet.RecordCount > 0);
    lblRegistros.Caption := 'Registro(s): '+ InttoStr(dsConsultar.DataSet.RecordCount);
end;

function TfrmGerarBoletos.Validar_Campos: Boolean;
begin
     Result := False;
     //
     If uFuncoes.Empty (cmbNMLOJA.Text) Then
     begin
          Application.MessageBox(PChar('Selecione o condominio.'),
              'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION +MB_APPLMODAL);
          cmbNMLOJA.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty (cmbConta.Text) Then
     begin
          cmbConta.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(edbDTEMISSAO.Text) Then
     begin
          edbDTEMISSAO.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(edtDTVENC.Text)
       or (edtDTVENC.Text = '  /  /    ') Then
     begin
          Application.MessageBox(PChar('Digite a data de vencimento.'),
              'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION +MB_APPLMODAL);
          edtDTVENC.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(edtValor.Text) or (edtValor.Value <= 0) Then
     begin
          edtValor.SetFocus;
          Exit;
     End;
     //
     Result := True;
end;

procedure TfrmGerarBoletos.edbDTEMISSAOExit(Sender: TObject);
begin
     If (edbDTEMISSAO.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(edbDTEMISSAO.Text);
              edbDTEMISSAO.Text := DatetoStr(edbDTEMISSAO.Date);
              //
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inválida!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edbDTEMISSAO.Clear;
                     edbDTEMISSAO.SetFocus;
                End;
           end;
     End;
end;

procedure TfrmGerarBoletos.edtDTVENCExit(Sender: TObject);
begin
     If (edtDTVENC.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(edtDTVENC.Text);
              edtDTVENC.Text := DatetoStr(edtDTVENC.Date);
              //
              if (edtDTVENC.Date < edbDTEMISSAO.Date) Then
                begin
                     Application.MessageBox(PChar('Data de vencimento deve ser maior que a de emissão.'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edtDTVENC.Clear;
                     edtDTVENC.SetFocus;
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

procedure TfrmGerarBoletos.BtGravarClick(Sender: TObject);
Var
   iLoja, iCedente : Integer;
   I, Cont, Total  : Integer;
   W_NRFATU : String;
   iUsuario : Integer;
begin
     If not (Validar_Campos) Then
        Exit;
     //
     iUsuario := StrtoInt(UFrmAdmin.M_CDUSUA);
     //
     If Application.MessageBox('Confirma geração de boletos?',
         'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
      begin
           // Falta alterar
           iLoja := uFuncoes.CDLOJA(cmbNMLOJA.Text);
           iCedente := Dm.GetCodigoCedente(cmbConta.Text);
           W_NRFATU := uFuncoes.StrZero(InttoStr(Dm.GeraNumeroFatura()),10);
           //
           BtGravar.Enabled := False;
           //
           With cdsConsultar do
            begin
              try
                 Screen.Cursor := crHourGlass;
                 BmsXPProgressBar1.Visible := True;
                 lblPercentual.Visible := True; 
                 lblPercentual.Caption := '0%';
                 DisableControls;
                 First;
                 Total := cdsConsultar.RecordCount;
                 BmsXPProgressBar1.Position := 0;
                 Cont  := 0;
                 //
                 While not (EOF) do
                  begin
                       {function TfrmGerarBoletos.IncluirBoletoCliente(iCliente, iLoja: Integer;
                       aDtEmissao, aDtVencimento: TDatetime; fValor, fDesconto, fJuro,
                       fMulta: Double): Boolean;}
                       IncluirBoletoCliente(FieldByName('CLI_CODIGO').AsInteger, iLoja, iCedente,
                              edbDTEMISSAO.Date, edtDTVENC.Date, edtValor.Value, edtDesconto.Value, edtJuros.Value, edtMulta.Value, W_NRFATU);
                       //
                       Cont := Cont + 1;
                       BmsXPProgressBar1.Position := (Cont * 100) div Total;
                       lblPercentual.Caption := InttoStr(BmsXPProgressBar1.Position)+'%';
                       Application.ProcessMessages;
                       //
                       Next;
                  End;
                  //
                  first;
                  EnableControls;
               Finally
                      Screen.Cursor := crDefault;
               End;
               //
               Application.ProcessMessages;
            End;
            //
            Application.MessageBox(PChar('Boletos gerados com sucesso.'+#13+
                   'Nº. Fatura : ' + W_NRFATU),
                   'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            //
            Dm.Start;
            Try
              If not (dm.IncluirTarefaUsuario( iUsuario,
                 'Gerou Boletos > ' +
                 ' Grupo: '+ cmbGrupos.Text +
                 ' Qt.Bol: '+ InttoStr(cdsConsultar.RecordCount)+
                 ' Dt.Vcto.: ' + edtDTVENC.Text+
                 ' Valor: '+FormatFloat('###,##0.#0', edtValor.Value) +' *F*')) Then
                    ShowMessage('Erro ao adicionar tarefa do usuário.');
                 dm.Comit(Dm.Transc);
            Except
                 dm.Rollback;
            End;
            //
            Close;
      End;
end;

procedure TfrmGerarBoletos.edtCDCLIEKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
         key:=#0;
     //
     If (key = #13) and not uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          Key := #0;
          Perform(WM_NEXTDLGCTL, 0, 0);
     End;
     //
     If (key = #13) and uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          Key := #0;
          spLocClientesClick(Sender);
     End;
end;

procedure TfrmGerarBoletos.cmbGruposEnter(Sender: TObject);
begin
     if not uFuncoes.Empty(edtCDCLIE.Text) Then
      begin
           edtCDCLIE.Clear;
      End;
end;

procedure TfrmGerarBoletos.cdsConsultarCalcFields(DataSet: TDataSet);
begin
     If not uFuncoes.Empty(cdsConsultarCLI_TIPOPESSOA.AsString) Then
       If (cdsConsultarCLI_TIPOPESSOA.AsString = 'F') Then
          cdsConsultarCPF_CNPJ.AsString := uFuncoes.FormataCPF(cdsConsultarCLI_CGC.AsString)
       Else
          cdsConsultarCPF_CNPJ.AsString := uFuncoes.FormataCNPJ(cdsConsultarCLI_CGC.AsString);
end;

function TfrmGerarBoletos.IncluirBoletoCliente(iCliente, iLoja, iCedente: Integer;
  aDtEmissao, aDtVencimento: TDatetime; fValor, fDesconto, fJuro,
  fMulta: Double; aFatura : String): Boolean;
var
    qraux : TSQLquery;
    texto : string;
    //
    iSequencia, iCredito, iSeuNumero  : Integer;
    aMesRefe, aNossoNumero : String;
    aFlNossoNumero : boolean;
begin
     Result := False;
     //
     Dm.RefreshCDS(Dm.CdsConfig);
     Dm.CdsConfig.Edit;
     Dm.CdsConfigCFG_SEQRECEBER.AsInteger :=
        Dm.CdsConfigCFG_SEQRECEBER.AsInteger + 1;
     dm.CdsConfigCFG_CREDITO.AsInteger    :=
        dm.CdsConfigCFG_CREDITO.AsInteger + 1;
     dm.CdsConfig.ApplyUpdates(0);
     //
     iSequencia := Dm.CdsConfigCFG_SEQRECEBER.AsInteger;
     iCredito   := dm.CdsConfigCFG_CREDITO.AsInteger;
     //
     Dm.FilterCDS(dmDados.cdsCedente, fsInteger, IntToStr(iLoja));
     //
     If not (dmDados.cdsCedente.IsEmpty) Then
      begin
           dmDados.cdsCedente.Edit;
           dmDados.cdsCedentePROXIMO_NOSSO_NUMERO.AsInteger :=
              dmDados.cdsCedentePROXIMO_NOSSO_NUMERO.AsInteger + 1;
           dmDados.cdsCedente.ApplyUpdates(0);
           //
           aFlNossoNumero := True;
           while aFlNossoNumero do
           begin
                 aNossoNumero := dmDados.cdsCedenteINICIO_NOSSO_NUMERO.AsString +
                    uFuncoes.StrZero(dmDados.cdsCedentePROXIMO_NOSSO_NUMERO.AsString,9);
                //
                aFlNossoNumero := Dm.VerificarExisteNossoNumero(iLoja, aNossoNumero);
                if (aFlNossoNumero) Then
                begin
                     dmDados.cdsCedente.Edit;
                     dmDados.cdsCedentePROXIMO_NOSSO_NUMERO.AsInteger :=
                        dmDados.cdsCedentePROXIMO_NOSSO_NUMERO.AsInteger + 1;
                     dmDados.cdsCedente.ApplyUpdates(0);
                End;
           End;
           //
           aNossoNumero := dmDados.cdsCedenteINICIO_NOSSO_NUMERO.AsString
                           +uFuncoes.StrZero(dmDados.cdsCedentePROXIMO_NOSSO_NUMERO.AsString,9);
           // dmDados.cdsCedenteNUMERO_CONVENIO.AsString+
      End
      Else
          raise Exception.Create('Erro ao tentar buscar dados do cedente.');
     //
     aMesRefe := Copy(DatetoStr(aDtVencimento), 4,2) + Copy(DatetoStr(aDtVencimento), 7,4);
     iSeuNumero := Dm.GetCodigoMesReferencia(aMesRefe);
     //
     texto := 'Insert Into CONTASRECEBER ( ';
     texto := Texto + ' REC_SEQUENCIA, REC_LOJA, REC_CREDITO, REC_PARCELA, REC_QTPARCELAS, REC_CLIENTE, REC_DESCRICAO, ';
     texto := Texto + ' REC_DATAEMISSAO, REC_DATAVENCIMENTO, REC_VALORPARCELA, REC_SITUACAO, REC_USUARIO, REC_NATUREZA, ';
     texto := Texto + ' REC_FLBOLETO, REC_NOSSO_NUMERO, REC_SEUNUMERO, REC_PEDESC, REC_PEMULTA, REC_PEJURO, REC_CDCEDENTE, REC_NRFATURA) ';
     //
     texto := Texto + ' Values (:pSEQUENCIA, :pLOJA, :pCREDITO, :pPARCELA , :pQTPARCELAS, :pCLIENTE, :pDESCRICAO, ';
     texto := Texto + ' :pDATAEMISSAO, :pDATAVENCIMENTO, :pVALORPARCELA, :pSITUACAO, :pUSUARIO, :pNATUREZA, ';
     texto := Texto + ' :pFLBOLETO, :pNOSSO_NUMERO, :pSEUNUMERO, :pPEDESC, :pPEMULTA, :pPEJURO, :pCDCEDENTE, :pNRFATURA)';
     //
     Memo1.Clear;
     Memo1.Lines.Add('BOLETO REFERENTE A ' + aMesRefe);
     //
     QrAux := TSqlquery.Create(nil);
     with QrAux do
     try
        Dm.Start;
        Try
           SQLConnection := Dm.SqlAdmin;
           sql.Add(texto);
           Params.ParamByName('pSEQUENCIA').AsInteger := iSequencia;
           Params.ParamByName('pLOJA').AsInteger      := iLoja;
           Params.ParamByName('pCREDITO').AsInteger   := iCredito;
           Params.ParamByName('pCLIENTE').AsInteger   := iCliente;
           Params.ParamByName('pPARCELA').AsInteger   := 1;
           Params.ParamByName('pQTPARCELAS').AsInteger   := 1;
           Params.ParamByName('pSITUACAO').AsString   := 'A';
           Params.ParamByName('pFLBOLETO').AsString   := 'S';
           Params.ParamByName('pDESCRICAO').Assign(Memo1.Lines);
           Params.ParamByName('pDATAEMISSAO').AsDateTime := aDtEmissao;
           Params.ParamByName('pDATAVENCIMENTO').AsDateTime := aDtVencimento;
           Params.ParamByName('pVALORPARCELA').AsFloat := fValor;
           Params.ParamByName('pUSUARIO').AsInteger   := StrtoInt(uFrmAdmin.M_CDUSUA);
           Params.ParamByName('pNATUREZA').AsInteger  := 5;
           Params.ParamByName('pNOSSO_NUMERO').AsString := aNossoNumero;
           Params.ParamByName('pSEUNUMERO').AsString  := aMesRefe+InttoStr(iSeuNumero) ;
           Params.ParamByName('pPEDESC').AsFloat      := fDesconto;
           Params.ParamByName('pPEMULTA').AsFloat     := fMulta;
           Params.ParamByName('pPEJURO').AsFloat      := fJuro;
           Params.ParamByName('pCDCEDENTE').AsInteger := iCedente;
           Params.ParamByName('pNRFATURA').AsString   := aFatura;
           //
           ExecSQL();
           //
           Dm.Comit(Dm.Transc);
           //
           Result := True;
        Except
           Dm.Rollback;
        End;
     finally
         free;
     end;
end;

procedure TfrmGerarBoletos.Carregar_Lojas;
begin
  with dmRelatorios.cdsLojas do
  begin
        Active := False;
        CommandText := 'Select EMP_CODIGO, EMP_FANTASIA from EMPRESAS order by EMP_FANTASIA';
        Active := True;
        First;
        //
        cmbNMLOJA.Clear;
        While not (Eof) do
        Begin
            cmbNMLOJA.Items.Add(FieldByName('EMP_FANTASIA').AsString);
            //
            Next;
        End;
        //
        Active := False;
   End;
end;

end.
