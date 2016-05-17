unit uFrmManuContReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, Grids, DBGrids,
  FMTBcd, DB, DBClient, Provider, SqlExpr, ImgList, ppCtrls, ppBands,
  ppVar, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  ppDB, ppDBPipe, DBCtrls, RpDefine, RpBase, RpSystem;

type
  TfrmManuContReceber = class(TForm)
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    spLocClientes: TSpeedButton;
    cmbSituacao: TComboBox;
    edtDTINICIAL: TDateEdit;
    edtDTFINAL: TDateEdit;
    edtNRCRED: TEdit;
    edtCDCLIE: TEdit;
    btFiltar: TBitBtn;
    rgPeriodos: TRadioGroup;
    Label4: TLabel;
    cmbNMLOJA: TComboBox;
    pnlGrid: TPanel;
    grdConsultar: TDBGrid;
    pnlEdicao: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    lbl_TOTABERTAS: TLabel;
    lbl_RECEBIDAS: TLabel;
    Panel2: TPanel;
    BtSair: TBitBtn;
    BtEditar: TBitBtn;
    BtExcluir: TBitBtn;
    dstContasReceber: TSQLDataSet;
    dspContasReceber: TDataSetProvider;
    cdsContasReceber: TClientDataSet;
    cdsContasReceberREC_LOJA: TIntegerField;
    cdsContasReceberREC_CREDITO: TIntegerField;
    cdsContasReceberREC_PARCELA: TIntegerField;
    cdsContasReceberREC_QTPARCELAS: TIntegerField;
    cdsContasReceberREC_CLIENTE: TIntegerField;
    cdsContasReceberREC_NRVENDA: TIntegerField;
    cdsContasReceberREC_DATAEMISSAO: TDateField;
    cdsContasReceberREC_DATAVENCIMENTO: TDateField;
    cdsContasReceberREC_VALORPARCELA: TFMTBCDField;
    cdsContasReceberREC_SITUACAO: TStringField;
    cdsContasReceberREC_DATAPAGAMENTO: TDateField;
    cdsContasReceberREC_NMSITUACAO: TStringField;
    cdsContasReceberREC_ATRASO: TFloatField;
    dsContas: TDataSource;
    cdsContasReceberREC_NMCLIENTE: TStringField;
    btImprimir: TBitBtn;
    btnBoleto: TBitBtn;
    cdsContasReceberREC_FLBOLETO: TStringField;
    ImageList1: TImageList;
    cdsContasReceberREC_FLBOLE: TBooleanField;
    cdsContasReceberREC_SEQUENCIA: TIntegerField;
    btnBolEnviados: TBitBtn;
    cdsDados: TClientDataSet;
    cdsDadosCODIGO: TStringField;
    cdsDadosNOME: TStringField;
    cdsDadosDOCUMENTO: TStringField;
    cdsDadosDT_ORIGINAL: TDateField;
    cdsDadosATRASO: TFloatField;
    cdsDadosVL_DOCUMENTO: TCurrencyField;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel6: TppLabel;
    ppLabel12: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText8: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine4: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLine3: TppLine;
    ppLabel9: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    cdsDadosDT_VENC: TDateField;
    ppDBBolEnviados: TppDBPipeline;
    dsBolReceber: TDataSource;
    ppDBText5: TppDBText;
    ppLabel5: TppLabel;
    ppDBImage1: TppDBImage;
    lblPeriodo: TppLabel;
    cdsContasReceberREC_PAGO: TFMTBCDField;
    lbl_NMCLIE: TEdit;
    cdsContasReceberREC_VLMULTA: TFMTBCDField;
    cdsContasReceberREC_NOSSO_NUMERO: TStringField;
    bntGerarBoletos: TBitBtn;
    Memo1: TMemo;
    DBNavigator1: TDBNavigator;
    RvSystem1: TRvSystem;
    Label8: TLabel;
    lblRegistro: TLabel;
    cmbGrupos: TComboBox;
    Label9: TLabel;
    cdsContasReceberREC_SEUNUMERO: TStringField;
    rbOrdem: TRadioGroup;
    cdsContasReceberREC_VALORJUROS: TFMTBCDField;
    cdsContasReceberREC_VALORDESCONTO: TFMTBCDField;
    cdsContasReceberREC_NRFATURA: TStringField;
    cdsContasReceberREC_DESCRICAO: TMemoField;
    cdsContasReceberCLI_CDGRUPO: TIntegerField;
    procedure spLocClientesClick(Sender: TObject);
    procedure cdsContasReceberCalcFields(DataSet: TDataSet);
    procedure BtSairClick(Sender: TObject);
    procedure dsContasDataChange(Sender: TObject; Field: TField);
    procedure btFiltarClick(Sender: TObject);
    procedure edtDTINICIALChange(Sender: TObject);
    procedure edtDTFINALChange(Sender: TObject);
    procedure edtDTINICIALExit(Sender: TObject);
    procedure edtDTINICIALKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTFINALExit(Sender: TObject);
    procedure edtDTFINALKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDCLIEChange(Sender: TObject);
    procedure edtCDCLIEExit(Sender: TObject);
    procedure edtCDCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure cmbSituacaoChange(Sender: TObject);
    procedure edtNRCREDChange(Sender: TObject);
    procedure cmbSituacaoExit(Sender: TObject);
    procedure cmbSituacaoKeyPress(Sender: TObject; var Key: Char);
    procedure edtNRCREDExit(Sender: TObject);
    procedure edtNRCREDKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbNMLOJAExit(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure cmbNMLOJAKeyPress(Sender: TObject; var Key: Char);
    procedure BtEditarClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure btnBoletoClick(Sender: TObject);
    procedure grdConsultarDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure grdConsultarCellClick(Column: TColumn);
    procedure grdConsultarColEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBolEnviadosClick(Sender: TObject);
    procedure bntGerarBoletosClick(Sender: TObject);
    procedure edtDTFINALEnter(Sender: TObject);
    procedure edtDTINICIALEnter(Sender: TObject);
    procedure edtCDCLIEEnter(Sender: TObject);
    procedure rbOrdemClick(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure dspContasReceberGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
  private
    novo, alterar, apagar : String;
    procedure CONSULTA;
    procedure TOTAIS;
    procedure BOTAO_FILTRA;
    procedure LOJAS;
    Procedure Limpar;
    procedure Carregar_Grupos;
    procedure ImprimirBoletoSelecionado(iSequencia : Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManuContReceber: TfrmManuContReceber;
  M_CDCLIE : String;

implementation

Uses uFrmBuscaClientes, uFuncoes, uDm2, udmConsulta, uFrmEditarTitulo,
  uDmRelatorios, Udm, UFrmAdmin, udmDados, uCodBarras,
  uFrmConfigurarBoletos, uFrmVisualizarPC;

{$R *.dfm}

procedure TfrmManuContReceber.spLocClientesClick(Sender: TObject);
begin
  edtCDCLIE.SetFocus;
  with TfrmBuscaClientes.create(self) do
  try
     uFrmBuscaClientes.M_NRFROM := 2;
     showmodal;
  finally
    edtCDCLIE.Text := uFuncoes.StrZero(M_CDCLIE,7);
    If not uFuncoes.Empty(edtCDCLIE.Text) Then
       cmbSituacao.SetFocus
    Else
       edtCDCLIE.SetFocus;
    free;
  end;
end;

procedure TfrmManuContReceber.cdsContasReceberCalcFields(
  DataSet: TDataSet);
begin
     cdsContasReceberREC_FLBOLE.AsBoolean := false;
     If (cdsContasReceberREC_SITUACAO.AsString = 'P') Then
         cdsContasReceberREC_NMSITUACAO.AsString := 'PAGA';
     If (cdsContasReceberREC_SITUACAO.AsString = 'C') Then
         cdsContasReceberREC_NMSITUACAO.AsString := 'CANCELA';
     If (cdsContasReceberREC_SITUACAO.AsString = 'A') Then
      begin
         cdsContasReceberREC_NMSITUACAO.AsString := 'ABERTA';
         cdsContasReceberREC_FLBOLE.AsBoolean := true;
      End;
     If (cdsContasReceberREC_SITUACAO.AsString = '') Then
         cdsContasReceberREC_NMSITUACAO.AsString := 'ABERTA';
end;

procedure TfrmManuContReceber.BtSairClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmManuContReceber.dsContasDataChange(Sender: TObject;
  Field: TField);
begin
  If (cdsContasReceber.Active = True) and not (cdsContasReceber.IsEmpty) Then
  Begin
     If (cdsContasReceber.FieldByName('REC_SITUACAO').AsString = 'A') Then
     Begin
          BtEditar.Enabled  := True;
          BtExcluir.Enabled := True;
          btImprimir.Enabled := False;
          btnBoleto.Enabled := True;
          btnBolEnviados.Enabled := True;
     End
     Else
     Begin
          BtEditar.Enabled  := False;
          BtExcluir.Enabled := False;
          btImprimir.Enabled := True;
          btnBoleto.Enabled := False;
          btnBolEnviados.Enabled := False;
     End;
     //
     bntGerarBoletos.Enabled := not (cdsContasReceber.IsEmpty) and (cdsContasReceber.FieldByName('REC_SITUACAO').AsString = 'A') ;
     btnBoleto.Enabled := not (cdsContasReceber.IsEmpty) and (cdsContasReceber.FieldByName('REC_SITUACAO').AsString = 'A') ;
  End
  Else
  begin
          BtEditar.Enabled   := False;
          BtExcluir.Enabled  := False;
          btImprimir.Enabled := False;
          btnBoleto.Enabled  := False;
          btnBolEnviados.Enabled := False;
  End;
  //
  If (cdsContasReceber.IsEmpty) Then
      Limpar;
end;

procedure TfrmManuContReceber.CONSULTA;
Var
    M_FLSITU, M_INTSQL, M_CAMPO, M_CAMPO_ORDEM : String;
    aDtInicio, aDtFinal : TDatetime;
    iGrupo : Integer;
begin
     M_INTSQL := '';
     If (cmbSituacao.Text = 'ABERTAS') Then
        M_FLSITU := 'A';
     If (cmbSituacao.Text = 'PAGAS') Then
        M_FLSITU := 'P';
     If (cmbSituacao.Text = 'TODAS') or
       uFuncoes.Empty(cmbSituacao.Text) Then
        M_FLSITU := 'T';
     //
     Case rbOrdem.ItemIndex of //        0 : M_CAMPO_ORDEM := 'REC_NMCLIENTE';
       0 : M_CAMPO_ORDEM := 'REC_NOSSO_NUMERO';
       1 : M_CAMPO_ORDEM := 'REC_DATAVENCIMENTO';
       2 : M_CAMPO_ORDEM := 'REC_DATAPAGAMENTO';
     End;

     //
     If (rgPeriodos.ItemIndex = 0) Then
        M_CAMPO := 'REC_DATAEMISSAO';
     If (rgPeriodos.ItemIndex = 1) Then
        M_CAMPO := 'REC_DATAVENCIMENTO';
     If (rgPeriodos.ItemIndex = 2) Then
        M_CAMPO := 'REC_DATAPAGAMENTO';
     //
     If uFuncoes.Empty(uFuncoes.RemoveChar(edtDTINICIAL.Text)) Then
        aDtInicio := StrtoDate('01/01/2000')
     Else
        aDtInicio := edtDTINICIAL.Date;
     //
     If uFuncoes.Empty(uFuncoes.RemoveChar(edtDTFINAL.Text)) Then
        aDtFinal  := StrtoDate('31/12/2099')
     Else
        aDtFinal  := edtDTFINAL.Date;
     //
     With cdsContasReceber do
     Begin
          //Active := False;
          DisableControls;
          Close;
          M_INTSQL := 'Select REC_SEQUENCIA, REC_LOJA, REC_CREDITO, REC_PARCELA, REC_QTPARCELAS, REC_CLIENTE, REC_NRVENDA, REC_DATAEMISSAO, REC_DATAVENCIMENTO, REC_VALORPARCELA, REC_PAGO, REC_SITUACAO, REC_DATAPAGAMENTO, REC_FLBOLETO, '
                      +' REC_NOSSO_NUMERO, REC_VLMULTA, REC_SEUNUMERO, REC_VALORJUROS, REC_VALORDESCONTO, REC_NRFATURA, REC_DESCRICAO, CL.CLI_CDGRUPO from CONTASRECEBER Inner Join CLIENTES CL on CL.cli_codigo = CONTASRECEBER.rec_cliente where ';
          //
          If not ufuncoes.Empty(cmbNMLOJA.Text) Then
              M_INTSQL := M_INTSQL + ' (REC_LOJA = '+QuotedStr(InttoStr(uFuncoes.CDLOJA(cmbNMLOJA.Text)))+') ';
          //
          M_INTSQL := M_INTSQL + ' AND ('+ M_CAMPO +' >= :pDTINICIO) ';
          //
          M_INTSQL := M_INTSQL + ' AND ('+ M_CAMPO +' <= :pDTFINAL) ';
          //
          If (M_FLSITU <> 'T') Then
              M_INTSQL := M_INTSQL + ' AND (REC_SITUACAO = '+QuotedStr(M_FLSITU)+') ';
          //
          If not ufuncoes.Empty(edtCDCLIE.Text) Then
             M_INTSQL := M_INTSQL + ' AND (REC_CLIENTE = '+QuotedStr(edtCDCLIE.Text)+') ';
          //
          If not uFuncoes.Empty(cmbGrupos.Text) Then
          begin
              iGrupo := Dm.GetCodigoGrupo(cmbGrupos.Text);
              M_INTSQL := M_INTSQL + ' AND (CL.CLI_CDGRUPO = '+QuotedStr(IntToStr(iGrupo))+') ';
          End;
          //
          Case rbOrdem.ItemIndex of
             0 : CommandText := M_INTSQL + ' order by REC_NOSSO_NUMERO';
             1 : CommandText := M_INTSQL + ' order by REC_DATAVENCIMENTO';
             2 : CommandText := M_INTSQL + ' order by REC_DATAPAGAMENTO';
          End;
          //
          Params.ParamByName('pDTINICIO').AsDateTime := aDtInicio;
          Params.ParamByName('pDTFINAL').AsDateTime  := aDtFinal;
          //FetchParams;
          Open;
          EnableControls;
     End;
     //
     //cdsContasReceber.FetchParams;
     //cdsContasReceber.Open;
     cdsContasReceber.EnableControls;
     //
     If (cdsContasReceber.IsEmpty) then
     Begin
          Application.MessageBox(PChar('Registro(s) de conta a receber não encontrado(s)...'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          DM2.cdsContasPagar.Close;
          cmbSituacao.SetFocus;
          Exit;
     End
     Else
     Begin
          dm.RefreshCDS(DM2.cdsClientes);
          //
          with cdsContasReceber do
            begin
                 DisableControls;
                 First;
                 While not (Eof) do
                  begin
                       Edit;
                       FieldByName('REC_FLBOLETO').AsString := 'S';
                       //
                       Next;
                  End;
                  ApplyUpdates(0);
                  first;
                 EnableControls;
            End;
          //
          {If (M_FLSITU = 'A') Then
              grdConsultar.Columns[5].Visible := False
          Else
          begin
              grdConsultar.Columns[5].Visible := True;
          End;}
     End;
     //
     TOTAIS;
end;

procedure TfrmManuContReceber.TOTAIS;
Var
    M_ABERTAS, M_PAGAS : Real;
begin
     If (cdsContasReceber.Active = true) Then
     Begin
          M_ABERTAS := 0;
          M_PAGAS   := 0;
          //
          cdsContasReceber.DisableControls;
          cdsContasReceber.First;
          //
          While not (cdsContasReceber.Eof) do
          Begin
               If (cdsContasReceber.FieldByName('REC_SITUACAO').AsString = 'A') Then
                   M_ABERTAS := M_ABERTAS + cdsContasReceber.FieldByName('REC_VALORPARCELA').AsCurrency;
               If (cdsContasReceber.FieldByName('REC_SITUACAO').AsString = 'P') Then
                   M_PAGAS   :=  M_PAGAS + cdsContasReceber.FieldByName('REC_PAGO').AsCurrency;
               // M_PAGAS   :=  M_PAGAS + cdsContasReceber.FieldByName('REC_VALORPARCELA').AsCurrency;
               //
               cdsContasReceber.Next;
          End;
          //
          cdsContasReceber.First;
          cdsContasReceber.EnableControls;
          //
          lbl_TOTABERTAS.Caption := FormatFloat('###,###,##0.#0',M_ABERTAS);
          lbl_RECEBIDAS.Caption  := FormatFloat('###,###,##0.#0',M_PAGAS);
          lblRegistro.Caption    :=  InttoStr(cdsContasReceber.RecordCount);
     End
     Else
     Begin
          lbl_TOTABERTAS.Caption := '0,00';
          lbl_RECEBIDAS.Caption      := '0,00';
          lblRegistro.Caption := '0';
     End;
end;

procedure TfrmManuContReceber.btFiltarClick(Sender: TObject);
begin
    if uFuncoes.Empty(cmbNMLOJA.Text) Then
    begin
         cmbNMLOJA.SetFocus;
         Exit;
    End;
    btFiltar.Enabled := False;
    try
      CONSULTA;
    finally
       btFiltar.Enabled := True;
    End;
end;

procedure TfrmManuContReceber.BOTAO_FILTRA;
begin
     If uFuncoes.Empty(edtCDCLIE.Text)
      and uFuncoes.Empty(cmbNMLOJA.Text)
      and uFuncoes.Empty(cmbSituacao.Text)
      and uFuncoes.Empty(edtNRCRED.Text)
      And (edtDTINICIAL.Text = '  /  /    ')
      and (edtDTFINAL.Text = '  /  /    ') Then
     begin
         btFiltar.Enabled := False;
         //
         BtEditar.Enabled  := False;
         BtExcluir.Enabled := False;
     End
     Else
         btFiltar.Enabled := True;
end;

procedure TfrmManuContReceber.edtDTINICIALChange(Sender: TObject);
begin
     If (edtDTINICIAL.Text = '  /  /    ') Then
         cdsContasReceber.Close;
end;

procedure TfrmManuContReceber.edtDTFINALChange(Sender: TObject);
begin
     If (edtDTFINAL.Text <> '  /  /    ') Then
         cdsContasReceber.Close;
end;

procedure TfrmManuContReceber.edtDTINICIALExit(Sender: TObject);
begin
     If (edtDTINICIAL.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(edtDTINICIAL.Text);
              edtDTINICIAL.Text := DatetoStr(edtDTINICIAL.Date);
              //
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inválida!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edtDTINICIAL.Clear;
                     edtDTINICIAL.SetFocus;
                End;
           end;
     End;
     //
     BOTAO_FILTRA;
end;

procedure TfrmManuContReceber.edtDTINICIALKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and (edtDTINICIAL.Text <> '  /  /    ') Then
     begin
          key := #0;
          edtDTFINAL.SetFocus;
     End;
end;

procedure TfrmManuContReceber.edtDTFINALExit(Sender: TObject);
begin
     If (edtDTFINAL.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(edtDTFINAL.Text);
              edtDTFINAL.Text := DatetoStr(edtDTFINAL.Date);
              //
              If (edtDTFINAL.Date < edtDTINICIAL.Date) Then
              Begin
                   Application.MessageBox(PChar('Período final deve ser maior ou igual ao inicial!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   edtDTFINAL.Date := Date;
                   edtDTFINAL.SetFocus;
                   Exit;
              End;
          except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inválida!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edtDTFINAL.Clear;
                     edtDTFINAL.SetFocus;
                End;
           end;
     End;
     //
     BOTAO_FILTRA;
end;

procedure TfrmManuContReceber.edtDTFINALKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and (edtDTFINAL.Text <> '  /  /    ') Then
     begin
          key := #0;
          edtCDCLIE.SetFocus;
     End;
end;

procedure TfrmManuContReceber.edtCDCLIEChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDCLIE.text) Then
     Begin
         cdsContasReceber.Close;
         lbl_NMCLIE.Clear;
     End;
     //
     BOTAO_FILTRA;
end;

procedure TfrmManuContReceber.edtCDCLIEExit(Sender: TObject);
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
             If not uFuncoes.Empty(edtCDCLIE.text) Then
                 cmbSituacao.SetFocus
             Else
             begin
                 edtCDCLIE.SetFocus;
                 Exit;
             End;
             //
             lbl_NMCLIE.Text := dmConsultas.qryLocCliente.FieldByName('CLI_FANTASIA').AsString;
             edtCDCLIE.Text := uFuncoes.StrZero(edtCDCLIE.Text,5);
          End;
          //
     End;
     BOTAO_FILTRA;
end;

procedure TfrmManuContReceber.edtCDCLIEKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
         key:=#0;
     If (key = #13) and not uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          Key := #0;
          cmbSituacao.SetFocus;
     End;
     //
     If (key = #13) and uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          Key := #0;
          spLocClientesClick(Sender);
     End;
end;

procedure TfrmManuContReceber.cmbSituacaoChange(Sender: TObject);
begin
     If uFuncoes.Empty(cmbSituacao.text) Then
         cdsContasReceber.Close;
     //
     BOTAO_FILTRA;
end;

procedure TfrmManuContReceber.edtNRCREDChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtNRCRED.text) Then
         cdsContasReceber.Close;
     //
     BOTAO_FILTRA;
end;

procedure TfrmManuContReceber.cmbSituacaoExit(Sender: TObject);
begin
     BOTAO_FILTRA;
end;

procedure TfrmManuContReceber.cmbSituacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and not uFuncoes.Empty(cmbSituacao.Text) Then
     Begin
          Key := #0;
          cmbGrupos.SetFocus;
     End;
end;

procedure TfrmManuContReceber.edtNRCREDExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtNRCRED.Text) Then
        edtNRCRED.Text := uFuncoes.StrZero(edtNRCRED.Text,7);
     //
     BOTAO_FILTRA;
end;

procedure TfrmManuContReceber.edtNRCREDKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
         key:=#0;
     //
     If (key = #13) and not uFuncoes.Empty(edtNRCRED.Text) Then
     Begin
          Key := #0;
          btFiltar.SetFocus;
     End;
end;

procedure TfrmManuContReceber.FormShow(Sender: TObject);
begin
     LOJAS;
     //
     Carregar_Grupos;
     //
     cdsContasReceber.Close;
     lbl_NMCLIE.Clear;
     //
     btFiltar.Enabled := False;
     bntGerarBoletos.Enabled := False;
     btnBoleto.Enabled := False;
end;

procedure TfrmManuContReceber.LOJAS;
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
     cmbNMLOJA.Clear;
     While not (dmConsultas.qryLoja.Eof) do
     Begin
          cmbNMLOJA.Items.Add(dmConsultas.qryLoja.FieldByName('EMP_FANTASIA').AsString);
          //
          dmConsultas.qryLoja.Next;
     End;
end;

procedure TfrmManuContReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      cdsContasReceber.close;
      Action := caFree;
end;

procedure TfrmManuContReceber.cmbNMLOJAExit(Sender: TObject);
begin
     BOTAO_FILTRA;
end;

procedure TfrmManuContReceber.BtExcluirClick(Sender: TObject);
Var
   iUsuario, iSeq : Integer;
   aCodigo : String;
begin
   If (cdsContasReceber.Active = True) Then
     if (cdsContasReceber.RecordCount > 0) then
     Begin
         If (cdsContasReceber.FieldByName('REC_SITUACAO').AsString = 'P') Then
         Begin
              Application.MessageBox(PChar('Registro de conta já pago!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              Exit;
         End;
         //
         If Application.MessageBox('Deseja excluir esta parcela?', 'Exclusão de registro',
                      MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
         Begin
             iSeq := cdsContasReceberREC_SEQUENCIA.AsInteger;
             //
             if (Dm.ExcluirContaReceber(iSeq)) Then
             begin
                  aCodigo  := 'Seq : '+uFuncoes.StrZero(cdsContasReceberREC_SEQUENCIA.AsString,7)+
                              ' Credito : '+uFuncoes.StrZero(cdsContasReceberREC_CREDITO.AsString,7)+
                              ' Cliente : '+uFuncoes.StrZero(cdsContasReceberREC_CLIENTE.AsString,7)+
                              ' Valor : '+ FormatFloat('###,##0.#0', cdsContasReceberREC_VALORPARCELA.AsFloat);
                  iUsuario := StrtoInt(UFrmAdmin.M_CDUSUA);
                  //
                  cdsContasReceber.Delete;
                  //cdsContasReceber.ApplyUpdates(0);
                  //
                  If not (dm.IncluirTarefaUsuario(iUsuario,
                     'Excluiu Conta Receber : '+aCodigo+' *F*')) Then
                     ShowMessage('Erro ao adicionar tarefa do usuário.')
                  Else
                      Application.MessageBox(PChar('Registro excluído com sucesso.'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             End
             Else
             begin
                   Application.MessageBox(PChar('Erro ao tentar excliur registro.'),
                      'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
             End;
         end;
         //
         CONSULTA;
     End;
end;

procedure TfrmManuContReceber.cmbNMLOJAKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and not uFuncoes.Empty(cmbNMLOJA.Text) Then
     Begin
          Key := #0;
          edtDTINICIAL.SetFocus;
     End;
end;

procedure TfrmManuContReceber.BtEditarClick(Sender: TObject);
Var
    M_NMCLIE : String;
begin
   If (cdsContasReceber.Active = True) Then
   Begin
     If (cdsContasReceber.RecordCount > 0) Then
     begin
       If (cdsContasReceber.FieldByName('REC_SITUACAO').AsString = 'A') Then
       begin
          M_NMCLIE := cdsContasReceber.FieldByName('REC_NMCLIENTE').AsString;
          DM2.cdsContasReceber.Close;
          With DM2.dstContasReceber do
          Begin
               Active := False;
               //
               CommandText := 'Select * from CONTASRECEBER Where (REC_CREDITO = :pCREDITO) '+
                        'and (REC_LOJA = :pLOJA) and (REC_PARCELA = :pPARCELA)'+
                        'and (REC_CLIENTE = :pCLIENTE)';
               //
              Params.ParamByName('pLOJA').AsInteger      := cdsContasReceber.FieldByName('REC_LOJA').AsInteger;
              Params.ParamByName('pCREDITO').AsInteger   := cdsContasReceber.FieldByName('REC_CREDITO').AsInteger;
              Params.ParamByName('pPARCELA').AsInteger   := cdsContasReceber.FieldByName('REC_PARCELA').AsInteger;
              Params.ParamByName('pCLIENTE').AsInteger   := cdsContasReceber.FieldByName('REC_CLIENTE').AsInteger;
              //
              Active := True;
          End;
          DM2.cdsContasReceber.FetchParams;
          DM2.cdsContasReceber.open;
          DM2.cdsContasReceber.Edit;
          //
          with TfrmEditarTitulo.create(self) do
              try
                 Caption := 'Editar Conta a Receber';
                 lbl_NMCLIE.Caption := M_NMCLIE;
                 showmodal;
              finally
                 free;
                 CONSULTA;
                 //
                 //dm.RefreshCDS(DM2.cdsClientes);
              end;
       End;
     End;
   End;
end;

procedure TfrmManuContReceber.btImprimirClick(Sender: TObject);
begin
     If Application.MessageBox('Deseja imprimir cupom de recebimento?',
      'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
         uFuncoes.NotaRecebimento('TELA',
                                 cdsContasReceber.FieldByName('REC_SEQUENCIA').AsInteger,
                                 cdsContasReceber.FieldByName('REC_CREDITO').AsInteger,
                                 cdsContasReceber.FieldByName('REC_LOJA').AsInteger, 'N','2');
end;

procedure TfrmManuContReceber.btnBoletoClick(Sender: TObject);
begin
//     ImprimirBoletoSelecionado(cdsContasReceberREC_SEQUENCIA.AsInteger);
{     If not (Dm.CdsConfig.Active) Then
       dm.RefreshCDS(Dm.CdsConfig);
     //
  If not (cdsContasReceber.IsEmpty) then
   begin

     If not Empty(Dm.CdsConfigCFG_CEDENTE_ATUAL.AsString)
      and (Dm.CdsConfigCFG_CEDENTE_ATUAL.AsInteger > 0) Then
     begin
        If not (cdsContasReceber.IsEmpty) Then
        begin
           // Pergunta se o usuario quer imprimir todos agora.
           If Application.MessageBox('Imprimir todos os boleto?',
                  'Imprimir todos',  MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)=idYes Then
           begin
                cdsContasReceber.DisableControls;
                cdsContasReceber.First;
                While not (cdsContasReceber.Eof) Do
                begin
                     //btImprimirClick(Sender);
                     dmRelatorios.IMPRIMIR_BOLETO(2,
                             cdsContasReceberREC_SEQUENCIA.AsInteger,
                             dm.CdsConfigCFG_CEDENTE_ATUAL.AsInteger,
                             cdsContasReceberREC_CREDITO.AsString, 'N',
                             cdsContasReceberREC_DATAVENCIMENTO.AsDateTime,
                             cdsContasReceberREC_VALORPARCELA.AsFloat);
                     // Proximo
                     cdsContasReceber.Next;
                End;
                //
                cdsContasReceber.EnableControls;
           End
           Else
               dmRelatorios.IMPRIMIR_BOLETO(1,
                             cdsContasReceberREC_SEQUENCIA.AsInteger,
                             dm.CdsConfigCFG_CEDENTE_ATUAL.AsInteger,
                             cdsContasReceberREC_CREDITO.AsString, 'N',
                             cdsContasReceberREC_DATAVENCIMENTO.AsDateTime,
                             cdsContasReceberREC_VALORPARCELA.AsFloat);
        End;     // fim-se cdsContasReceber.IsEmpty
     End
     Else
         Application.MessageBox(PChar('Não há cedente cadastro para gera boleto.'),
                  'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
  End;}
end;

procedure TfrmManuContReceber.grdConsultarDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  R: TRect;
begin
  {pinta checkbox}
  if Column.Field = cdsContasReceberREC_FLBOLETO then
  begin
    grdConsultar.Canvas.FillRect(Rect);
    ImageList1.Draw(grdConsultar.Canvas, Rect.Left + 10, Rect.Top + 1, 0);
    if cdsContasReceberREC_FLBOLETO.AsString = 'S' then
      ImageList1.Draw(grdConsultar.Canvas, Rect.Left + 10, Rect.Top + 1, 2)
    else
      ImageList1.Draw(grdConsultar.Canvas, Rect.Left + 10, Rect.Top + 1, 1);
  end;

end;

procedure TfrmManuContReceber.grdConsultarCellClick(Column: TColumn);
begin
  if (Column.Field = cdsContasReceberREC_FLBOLETO)
    AND (cdsContasReceberREC_SITUACAO.AsString = 'A') then
  begin
    cdsContasReceber.Edit;
    if (cdsContasReceberREC_FLBOLETO.AsString = 'N') Then
       cdsContasReceberREC_FLBOLETO.AsString := 'S'
    Else
       cdsContasReceberREC_FLBOLETO.AsString := 'N';
    cdsContasReceber.ApplyUpdates(0);   
  end;
end;

procedure TfrmManuContReceber.grdConsultarColEnter(Sender: TObject);
begin
 if grdConsultar.SelectedField = cdsContasReceberREC_FLBOLETO then
    grdConsultar.Options := grdConsultar.Options - [dgEditing]
  else
    grdConsultar.Options := grdConsultar.Options + [dgEditing];
end;

procedure TfrmManuContReceber.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Lojas...'));
           //
           novo    := UFrmAdmin.aNovo;
           alterar := UFrmAdmin.aAlterar;
           apagar  := UFrmAdmin.aApagar;
           //
     End;
     //
     FrmAdmin.Limpar_Acessos;
     //
     {BtAdicionar.Visible := (novo = 'S');
     BtEditar.Visible    := (alterar = 'S');
     BtExcluir.Visible   := (apagar = 'S');}
     //
   End;
end;

procedure TfrmManuContReceber.btnBolEnviadosClick(Sender: TObject);
begin
        If not (cdsContasReceber.IsEmpty) Then
        begin
           // Pergunta se o usuario quer imprimir todos agora.
           If Application.MessageBox('Imprimir relação de boletos enviados?',
                  'Imprimir todos',  MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)=idYes Then
           begin
                Dm.RefreshCDS(cdsDados);
                cdsDados.EmptyDataSet;
                //
                cdsContasReceber.DisableControls;
                cdsContasReceber.First;
                While not (cdsContasReceber.Eof) Do
                begin
                   if (cdsContasReceberREC_FLBOLETO.AsString = 'S') Then
                   Begin
                     With cdsDados do
                      begin
                           Append;
                           FieldByName('CODIGO').AsString  := StrZero(cdsContasReceberREC_CLIENTE.AsString,7);
                           FieldByName('NOME').AsString    := cdsContasReceberREC_NMCLIENTE.AsString;
                           FieldByName('DOCUMENTO').AsString     := StrZero(cdsContasReceberREC_CREDITO.AsString,10);
                           FieldByName('DT_ORIGINAL').AsDateTime := cdsContasReceberREC_DATAEMISSAO.AsDateTime;
                           FieldByName('DT_VENC').AsDateTime     := cdsContasReceberREC_DATAVENCIMENTO.AsDateTime;
                           //FieldByName('ATRASO')
                           FieldByName('VL_DOCUMENTO').AsFloat   := cdsContasReceberREC_VALORPARCELA.AsFloat;
                           //
                           Post;
                      End;
                   End;
                     // Proximo
                     cdsContasReceber.Next;
                End;
                //
                cdsContasReceber.EnableControls;
                //
                If not (cdsDados.IsEmpty) Then
                 begin
                      lblPeriodo.Caption := 'PERÍODO : '+edtDTINICIAL.Text + ' À ' +edtDTFINAL.Text;
                      ppReport1.PrintReport;
                 End;
           End;
        End;
end;

procedure TfrmManuContReceber.bntGerarBoletosClick(Sender: TObject);
Var
   M_CDCLIE, M_NMCLIE : String;
   M_NRDOCU, M_NRAGEN, M_DIAGEN, M_CDCEDE, M_DGNNUME, M_NRCONV, M_NRCART : String;
   M_LINHA, M_CDBARRA, M_DINOSSONUM : String;
   M_PEJURO, M_PEMULT, M_PEDESC, M_VLDESC, M_VLJURO : Double;
   M_MENSAGEM, M_NMCIDA, M_NMBAIR : String;
   M_FLIMPR : Boolean;
   M_CDCEDENTE : INTEGER;
   iUsuario : Integer;
   X : String;
begin
   M_FLIMPR := False;
   iUsuario := StrtoInt(UFrmAdmin.M_CDUSUA);
   //
   If FileExists('nn.txt') Then
       DeleteFile('nn.txt');
   //
   If (cdsContasReceber.Active) Then
   begin
         If not (cdsContasReceber.IsEmpty) then
           begin
             //
              With cdsContasReceber do
              begin
                  DisableControls;
                  First;
                  While not (Eof) do
                    begin
                         If (cdsContasReceberREC_SITUACAO.AsString = 'A')
                           and uFuncoes.Empty(cdsContasReceberREC_NOSSO_NUMERO.AsString) Then
                                 Dm.GerarNossoNumero(cdsContasReceberREC_SEQUENCIA.AsInteger);
                         //
                         Next;
                    End;
                    //
                    First;
                    //
                    // CONSULTA;
                    //
                   EnableControls;
              End;
           End;
           //
           Application.CreateForm(TfrmConfiguraBoletos, frmConfiguraBoletos);
           try
              If frmConfiguraBoletos.ShowModal = mrOk Then
                  M_FLIMPR := true;
           Finally
              M_PEDESC := uFrmConfigurarBoletos.W_PEDESC;
              M_PEJURO := uFrmConfigurarBoletos.W_PEJURO;
              M_PEMULT := uFrmConfigurarBoletos.W_PEMULT;
              M_MENSAGEM := frmConfiguraBoletos.edtMensagem.Text;
              M_CDCEDENTE := dm.GetCodigoCedente(uFrmConfigurarBoletos.W_NMCEDENTE);
              //
              frmConfiguraBoletos.Release;
              frmConfiguraBoletos := nil;
           End;
           //
           If not (M_FLIMPR) Then
              Exit;
           //
           Dm.FilterCDS(dmDados.cdsCedente, fsInteger, InttoStr(M_CDCEDENTE));
           //Dm.FilterCDS(dmDados.cdsCedente, fsInteger, Dm.CdsConfigCFG_CEDENTE_ATUAL.AsString);
           //
           If not (dmDados.cdsCedente.IsEmpty) Then
            begin
                 M_NRAGEN := dmDados.cdsCedenteAGENCIA_CODIGO.AsString+'-'+dmDados.cdsCedenteAGENCIA_DIGITO.AsString;
                 M_DIAGEN := dmDados.cdsCedenteAGENCIA_DIGITO.AsString;
                 M_CDCEDE := dmDados.cdsCedenteCEDENTE_CODIGO.AsString+'-'+dmDados.cdsCedenteCEDENTE_CODIGO_DIGITO.AsString;
                 M_NRCONV := dmDados.cdsCedenteNUMERO_CONVENIO.AsString;
                 M_NRCART := dmDados.cdsCedenteCARTEIRA.AsString;
            End
            Else
               raise Exception.Create('Erro ao tentar abrir configurações do cedente.');
           //
           dmRelatorios.cds2Boletos.close;
           dmRelatorios.cds2Boletos.Open;
           dmRelatorios.cds2Boletos.EmptyDataSet;
           //
           With cdsContasReceber do
            begin
                  DisableControls;
                  First;
                  While not (Eof) do
                    begin
                         //
                         If not uFuncoes.Empty(FieldByName('REC_NOSSO_NUMERO').AsString)
                           and (FieldByName('REC_SITUACAO').AsString = 'A') And (FieldByName('REC_FLBOLETO').AsString = 'S') Then
                          begin
                               If (dm.VerificarExisteCedenteTitulo(FieldByName('REC_SEQUENCIA').AsInteger)) Then
                                  Dm.AtualizarCedenteTitulo(FieldByName('REC_SEQUENCIA').AsInteger, M_CDCEDENTE);
                               //
                               M_DINOSSONUM := dmRelatorios.NewPrepararTitulo(Dm.CdsConfigCFG_CEDENTE_ATUAL.AsInteger,
                                         M_NRCONV, FieldByName('REC_NOSSO_NUMERO').AsString,
                                         FieldByName('REC_DATAVENCIMENTO').AsDateTime,
                                         FieldByName('REC_VALORPARCELA').AsFloat);
                               //
                               M_CDCLIE := FieldByName('REC_CLIENTE').AsString;
                               // 99/99/9999
                               M_NRDOCU := FieldByName('REC_SEUNUMERO').AsString;
                               {Copy(FieldByName('REC_DATAEMISSAO').AsString,4,2)+'.'+
                                           Copy(FieldByName('REC_DATAEMISSAO').AsString,7,4);}
                               If uFuncoes.Empty(M_NRDOCU) Then
                                   M_NRDOCU := Copy(FieldByName('REC_DATAVENCIMENTO').AsString, 4,2)
                                              + Copy(FieldByName('REC_DATAVENCIMENTO').AsString, 7,4)+'.'+Copy(FieldByName('REC_NOSSO_NUMERO').AsString,8,3);
                               //
                               dm.FilterCDS(dm.CdsClientes, fsInteger, M_CDCLIE);
                               M_DGNNUME := M_DINOSSONUM;
                               //
                               dmRelatorios.SetCodigoBarras(FieldByName('REC_NOSSO_NUMERO').AsString,
                                         FieldByName('REC_DATAVENCIMENTO').AsDateTime,
                                         FieldByName('REC_VALORPARCELA').AsFloat);
                               //
                               M_LINHA   := uCodBarras.TgbCobCodBar.Create.GetLinhaDigitavel(uDmRelatorios.M_CODIGOBARRAS);
                               M_CDBARRA := udmRelatorios.M_CODIGOBARRAS;
                               //
                               M_VLDESC := uFuncoes.Arredondar(uFuncoes.Gerapercentual(FieldByName('REC_VALORPARCELA').AsFloat, M_PEDESC),2);
                               M_VLJURO := uFuncoes.Arredondar((uFuncoes.Gerapercentual(FieldByName('REC_VALORPARCELA').AsFloat, M_PEJURO)/30),2);
                               //
                               M_NMCIDA := uFuncoes.GetCidade(dm.CdsClientesCID_CODIGO.AsInteger);
                               M_NMBAIR := dm.CdsClientesBAI_NOME.AsString;
                               //
                               Memo1.Lines.Clear;
                               If (M_VLDESC > 0) Then
                                 Memo1.Lines.Add('DESCONTO DE R$ '+FormatFloat('###,##0.#0',M_VLDESC)+' ATÉ '+ FieldByName('REC_DATAVENCIMENTO').AsString);
                               If (M_PEJURO > 0) Then
                                  Memo1.Lines.Add('JUROS DE MORA DE '+FormatFloat('###,##0.#0',M_PEJURO)+'% MENSAL (R$ '+FormatFloat('###,##0.#0',M_VLJURO)+' AO DIA)');
                               If (M_PEMULT > 0) Then
                                  Memo1.Lines.Add('MULTAS DE '+FormatFloat('###,##0.#0',M_PEMULT)+'% A PARTIR DE '+DatetoStr(FieldByName('REC_DATAVENCIMENTO').AsDateTime + 1));
                               If not uFuncoes.Empty(M_MENSAGEM) Then
                                  Memo1.Lines.Add(M_MENSAGEM);
                               If not uFuncoes.Empty(FieldByName('REC_DESCRICAO').AsString)
                                 And (Copy(FieldByName('REC_DESCRICAO').AsString,1,16) = 'BOLETO VINCULADO') Then
                                  Memo1.Lines.Add(FieldByName('REC_DESCRICAO').AsString);
                               //
                               {iSEQUENCIA, iCLIENTE: Integer;
                               aNMCLIENTE, aCPF, aENDERECO, aCIDADE, aBAIRRO, aDOCUMENTO, aNOSSONUMERO,
                               aCARTEIRA, aCEP, aBOXMESA, aLINHA_DIGITAVEL, aCODIGO_BARRAS,
                               aAGENCIA, aDIAGEN, aCDCEDENTE, aDG_NNUMERO: String;
                               aDESCRICAO: TStrings; aDTDOCU, aDTPROCESSAMENTO,
                               aDTVENCIMENTO: TDatetime; fVALOR}
                               dmRelatorios.AddBoletoCliente(
                                  FieldByName('REC_SEQUENCIA').AsInteger, FieldByName('REC_CLIENTE').AsInteger,
                                  dm.CdsClientesCLI_RAZAO.AsString, Dm.CdsClientesCLI_CGC.AsString,
                                  dm.CdsClientesCLI_END_COBRANCA.AsString,
                                  M_NMCIDA, M_NMBAIR, M_NRDOCU,
                                  M_NRCONV+FieldByName('REC_NOSSO_NUMERO').AsString, M_NRCART, dm.CdsClientesCLI_CEP.AsString,
                                  dm.CdsClientesCLI_NRBOX.AsString,
                                  M_LINHA, M_CDBARRA,
                                  M_NRAGEN, M_DIAGEN, M_CDCEDE, M_DGNNUME,
                                  Memo1.Lines, FieldByName('REC_DATAEMISSAO').AsDatetime,
                                  FieldByName('REC_DATAEMISSAO').AsDatetime, FieldByName('REC_DATAVENCIMENTO').AsDatetime,
                                  FieldByName('REC_VALORPARCELA').AsFloat);
                          End;
                         //
                         uFuncoes.AddLog('CLIENTE : ' +uFuncoes.StrZero(FieldByName('REC_CLIENTE').AsString,7) + ' - NOSSO NUMERO : '+  FieldByName('REC_NOSSO_NUMERO').AsString);
                         //
                         Next;
                    End;
                  //
                  EnableControls;
            End;
            //
            With dmRelatorios.rv2Boletos do
              begin
                   SetParam('CDBANC', dmDados.cdsCedenteBANCO_CODIGO.AsString + '-' + '9');
                   SetParam('LOCAL_PAGAMENTO', Dm.CdsConfigCFG_LOCAL_PAGAMENTO.AsString);
                   SetParam('CEDENTE_NOME', dmDados.cdsCedenteCEDENTE_NOME.AsString);
                   SetParam('Carteira', dmDados.cdsCedenteCARTEIRA.AsString);
                   SetParam('ESPECIEDOC', 'DM');
                   SetParam('AGE_CEDENTE', M_NRAGEN+'/'+M_CDCEDE);
                   //aArqImagem := ExtractFilePath(Application.ExeName)+'logo.bmp';
                   //
                   //SetParam('LogoBanco', );
                   //
                   If Application.MessageBox('Clique em Sim - Impressora ou Não - Visualizar?',
                         'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idNo then
                    begin
                       dmRelatorios.RvSystem3.DefaultDest := rdPreview;
                       //
                       If not (dm.IncluirTarefaUsuario(iUsuario,
                         'Visualizou Boletos '+' *F*')) Then
                           ShowMessage('Erro ao adicionar tarefa do usuário.');
                    End
                   Else
                    begin
                        dmRelatorios.RvSystem3.DefaultDest := rdPrinter;
                        //
                        If not (dm.IncluirTarefaUsuario(iUsuario,
                          'Imprimiu Boletos '+'* F*')) Then
                           ShowMessage('Erro ao adicionar tarefa do usuário.');
                    End;
                   //
                   Execute;
              End;
      //End;
      //
      CONSULTA;
   End
   Else
       if btFiltar.Enabled Then
          btFiltar.SetFocus;
end;

procedure TfrmManuContReceber.Limpar;
begin
   lbl_TOTABERTAS.Caption := '0,00';
   lbl_RECEBIDAS.Caption  := '0,00';
   lblRegistro.Caption    := '0';
end;

procedure TfrmManuContReceber.edtDTFINALEnter(Sender: TObject);
begin
     cdsContasReceber.Close;
     Limpar;
end;

procedure TfrmManuContReceber.edtDTINICIALEnter(Sender: TObject);
begin
     cdsContasReceber.Close;
     Limpar;
end;

procedure TfrmManuContReceber.edtCDCLIEEnter(Sender: TObject);
begin
     cdsContasReceber.Close;
     Limpar;
end;

procedure TfrmManuContReceber.Carregar_Grupos;
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

procedure TfrmManuContReceber.rbOrdemClick(Sender: TObject);
begin
     CONSULTA;
end;

procedure TfrmManuContReceber.ImprimirBoletoSelecionado(
  iSequencia : Integer);
Var
   M_CDCLIE, M_NMCLIE : String;
   M_NRDOCU, M_NRAGEN, M_DIAGEN, M_CDCEDE, M_DGNNUME, M_NRCONV, M_NRCART : String;
   M_LINHA, M_CDBARRA, M_DINOSSONUM : String;
   M_PEJURO, M_PEMULT, M_PEDESC, M_VLDESC, M_VLJURO : Double;
   M_MENSAGEM, M_NMCIDA, M_NMBAIR : String;
   M_FLIMPR : Boolean;
   M_CDCEDENTE : INTEGER;
   iUsuario : Integer;
begin
   M_FLIMPR := False;
   iUsuario := StrtoInt(UFrmAdmin.M_CDUSUA);
   //
   If FileExists('nn.txt') Then
       DeleteFile('nn.txt');
   //
   If (cdsContasReceber.Active) Then
   begin
         If not (cdsContasReceber.IsEmpty) then
           begin
              //
              With cdsContasReceber do
              begin
                   DisableControls;
                   If (cdsContasReceberREC_SITUACAO.AsString = 'A')
                     and uFuncoes.Empty(cdsContasReceberREC_NOSSO_NUMERO.AsString) Then
                        Dm.GerarNossoNumero(cdsContasReceberREC_SEQUENCIA.AsInteger);
                   //
                   CONSULTA;
                   //
                   Locate('REC_SEQUENCIA', iSequencia,[]);
                   //
                   EnableControls;
              End;
           End;
           //
           Application.CreateForm(TfrmConfiguraBoletos, frmConfiguraBoletos);
           try
              If frmConfiguraBoletos.ShowModal = mrOk Then
                  M_FLIMPR := true;
           Finally
              M_PEDESC := uFrmConfigurarBoletos.W_PEDESC;
              M_PEJURO := uFrmConfigurarBoletos.W_PEJURO;
              M_PEMULT := uFrmConfigurarBoletos.W_PEMULT;
              M_MENSAGEM := frmConfiguraBoletos.edtMensagem.Text;
              M_CDCEDENTE := dm.GetCodigoCedente(uFrmConfigurarBoletos.W_NMCEDENTE);
              //
              frmConfiguraBoletos.Release;
              frmConfiguraBoletos := nil;
           End;
           //
           If not (M_FLIMPR) Then
              Exit;
           //
           Dm.FilterCDS(dmDados.cdsCedente, fsInteger, InttoStr(M_CDCEDENTE));
           //
           If not (dmDados.cdsCedente.IsEmpty) Then
            begin
                 M_NRAGEN := dmDados.cdsCedenteAGENCIA_CODIGO.AsString+'-'+dmDados.cdsCedenteAGENCIA_DIGITO.AsString;
                 M_DIAGEN := dmDados.cdsCedenteAGENCIA_DIGITO.AsString;
                 M_CDCEDE := dmDados.cdsCedenteCEDENTE_CODIGO.AsString+'-'+dmDados.cdsCedenteCEDENTE_CODIGO_DIGITO.AsString;
                 M_NRCONV := dmDados.cdsCedenteNUMERO_CONVENIO.AsString;
                 M_NRCART := dmDados.cdsCedenteCARTEIRA.AsString;
            End
            Else
               raise Exception.Create('Erro ao tentar abrir configurações do cedente.');
           //
           dmRelatorios.cds2Boletos.close;
           dmRelatorios.cds2Boletos.Open;
           dmRelatorios.cds2Boletos.EmptyDataSet;
           //
           With cdsContasReceber do
            begin
                  DisableControls;
                  If not uFuncoes.Empty(FieldByName('REC_NOSSO_NUMERO').AsString)
                     and (FieldByName('REC_SITUACAO').AsString = 'A') Then
                     begin
                            If (dm.VerificarExisteCedenteTitulo(FieldByName('REC_SEQUENCIA').AsInteger)) Then
                                  Dm.AtualizarCedenteTitulo(FieldByName('REC_SEQUENCIA').AsInteger, M_CDCEDENTE);
                               //
                               M_DINOSSONUM := dmRelatorios.NewPrepararTitulo(Dm.CdsConfigCFG_CEDENTE_ATUAL.AsInteger,
                                         M_NRCONV, FieldByName('REC_NOSSO_NUMERO').AsString,
                                         FieldByName('REC_DATAVENCIMENTO').AsDateTime,
                                         FieldByName('REC_VALORPARCELA').AsFloat);
                               //
                               M_CDCLIE := FieldByName('REC_CLIENTE').AsString;
                               // 99/99/9999
                               M_NRDOCU := FieldByName('REC_SEUNUMERO').AsString;
                               {Copy(FieldByName('REC_DATAEMISSAO').AsString,4,2)+'.'+
                                           Copy(FieldByName('REC_DATAEMISSAO').AsString,7,4);}
                               If uFuncoes.Empty(M_NRDOCU) Then
                                   M_NRDOCU := Copy(FieldByName('REC_DATAVENCIMENTO').AsString, 4,2)
                                             + Copy(FieldByName('REC_DATAVENCIMENTO').AsString, 7,4)+'.'+Copy(FieldByName('REC_NOSSO_NUMERO').AsString,8,3);
                               //
                               dm.FilterCDS(dm.CdsClientes, fsInteger, M_CDCLIE);
                               M_DGNNUME := M_DINOSSONUM;
                               //
                               dmRelatorios.SetCodigoBarras(FieldByName('REC_NOSSO_NUMERO').AsString,
                                         FieldByName('REC_DATAVENCIMENTO').AsDateTime,
                                         FieldByName('REC_VALORPARCELA').AsFloat);
                               //
                               M_LINHA   := uCodBarras.TgbCobCodBar.Create.GetLinhaDigitavel(uDmRelatorios.M_CODIGOBARRAS);
                               M_CDBARRA := udmRelatorios.M_CODIGOBARRAS;
                               //
                               M_VLDESC := uFuncoes.Arredondar(uFuncoes.Gerapercentual(FieldByName('REC_VALORPARCELA').AsFloat, M_PEDESC),2);
                               M_VLJURO := uFuncoes.Arredondar((uFuncoes.Gerapercentual(FieldByName('REC_VALORPARCELA').AsFloat, M_PEJURO)/30),2);
                               //
                               M_NMCIDA := uFuncoes.GetCidade(dm.CdsClientesCID_CODIGO.AsInteger);
                               M_NMBAIR := dm.CdsClientesBAI_NOME.AsString;
                               //
                               Memo1.Lines.Clear;
                               If (M_VLDESC > 0) Then
                                 Memo1.Lines.Add('DESCONTO DE R$ '+FormatFloat('###,##0.#0',M_VLDESC)+' ATÉ '+ FieldByName('REC_DATAVENCIMENTO').AsString);
                               If (M_PEJURO > 0) Then
                                  Memo1.Lines.Add('JUROS DE MORA DE '+FormatFloat('###,##0.#0',M_PEJURO)+'% MENSAL (R$ '+FormatFloat('###,##0.#0',M_VLJURO)+' AO DIA)');
                               If (M_PEMULT > 0) Then
                                  Memo1.Lines.Add('MULTAS DE '+FormatFloat('###,##0.#0',M_PEMULT)+'% A PARTIR DE '+DatetoStr(FieldByName('REC_DATAVENCIMENTO').AsDateTime + 1));
                               If not uFuncoes.Empty(M_MENSAGEM) Then
                                  Memo1.Lines.Add(M_MENSAGEM);
                               If not uFuncoes.Empty(FieldByName('REC_DESCRICAO').AsString) Then
                                  Memo1.Lines.Add(FieldByName('REC_DESCRICAO').AsString);
                               //
                               {iSEQUENCIA, iCLIENTE: Integer;
                               aNMCLIENTE, aCPF, aENDERECO, aCIDADE, aBAIRRO, aDOCUMENTO, aNOSSONUMERO,
                               aCARTEIRA, aCEP, aBOXMESA, aLINHA_DIGITAVEL, aCODIGO_BARRAS,
                               aAGENCIA, aDIAGEN, aCDCEDENTE, aDG_NNUMERO: String;
                               aDESCRICAO: TStrings; aDTDOCU, aDTPROCESSAMENTO,
                               aDTVENCIMENTO: TDatetime; fVALOR}
                               dmRelatorios.AddBoletoCliente(
                                  FieldByName('REC_SEQUENCIA').AsInteger, FieldByName('REC_CLIENTE').AsInteger,
                                  dm.CdsClientesCLI_RAZAO.AsString, Dm.CdsClientesCLI_CGC.AsString,
                                  dm.CdsClientesCLI_END_COBRANCA.AsString,
                                  M_NMCIDA, M_NMBAIR, M_NRDOCU,
                                  M_NRCONV+FieldByName('REC_NOSSO_NUMERO').AsString, M_NRCART, dm.CdsClientesCLI_CEP.AsString,
                                  dm.CdsClientesCLI_NRBOX.AsString,
                                  M_LINHA, M_CDBARRA,
                                  M_NRAGEN, M_DIAGEN, M_CDCEDE, M_DGNNUME,
                                  Memo1.Lines, FieldByName('REC_DATAEMISSAO').AsDatetime,
                                  FieldByName('REC_DATAEMISSAO').AsDatetime, FieldByName('REC_DATAVENCIMENTO').AsDatetime,
                                  FieldByName('REC_VALORPARCELA').AsFloat);
                     End;
                  //
                  uFuncoes.AddLog('CLIENTE : ' +uFuncoes.StrZero(FieldByName('REC_CLIENTE').AsString,7) + ' - NOSSO NUMERO : '+  FieldByName('REC_NOSSO_NUMERO').AsString);
                  //
                  EnableControls;
            End;
            //
            With dmRelatorios.rv2Boletos do
              begin
                   SetParam('CDBANC', dmDados.cdsCedenteBANCO_CODIGO.AsString + '-' + '9');
                   SetParam('LOCAL_PAGAMENTO', Dm.CdsConfigCFG_LOCAL_PAGAMENTO.AsString);
                   SetParam('CEDENTE_NOME', dmDados.cdsCedenteCEDENTE_NOME.AsString);
                   SetParam('Carteira', dmDados.cdsCedenteCARTEIRA.AsString);
                   SetParam('ESPECIEDOC', 'DM');
                   SetParam('AGE_CEDENTE', M_NRAGEN+'/'+M_CDCEDE);
                   //aArqImagem := ExtractFilePath(Application.ExeName)+'logo.bmp';
                   //
                   //SetParam('LogoBanco', );
                   //
                   If Application.MessageBox('Clique em Sim - Impressora ou Não - Visualizar?',
                         'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idNo then
                    begin
                       dmRelatorios.RvSystem3.DefaultDest := rdPreview;
                       //
                       If not (dm.IncluirTarefaUsuario(iUsuario,
                         'Visualizou Boletos '+' *F*')) Then
                           ShowMessage('Erro ao adicionar tarefa do usuário.');
                    End
                   Else
                    begin
                        dmRelatorios.RvSystem3.DefaultDest := rdPrinter;
                        //
                        If not (dm.IncluirTarefaUsuario(iUsuario,
                          'Imprimiu Boletos '+'* F*')) Then
                           ShowMessage('Erro ao adicionar tarefa do usuário.');
                    End;
                   //
                   Execute;
              End;
      //End;
      //
         CONSULTA;
   End
   Else
       if btFiltar.Enabled Then
          btFiltar.SetFocus;
end;

procedure TfrmManuContReceber.grdConsultarDblClick(Sender: TObject);
begin
     If (cdsContasReceber.Active) and not (cdsContasReceber.IsEmpty)
       and (cdsContasReceberREC_SITUACAO.AsString = 'A') Then
       begin
            ImprimirBoletoSelecionado(cdsContasReceberREC_SEQUENCIA.AsInteger);
            Exit;
       End;
     //
    if (cdsContasReceberREC_SITUACAO.AsString = 'P') Then
     begin
         Application.CreateForm(TfrmVisualizarPC, frmVisualizarPC);
         try
            With frmVisualizarPC do
            begin
                 cdsConsulta.Close;
                 cdsConsulta.Params[0].AsInteger := cdsContasReceberREC_SEQUENCIA.AsInteger;
                 cdsConsulta.open;
                 //
                 ShowModal;
            End;
         Finally
            FreeAndNil(frmVisualizarPC);
         End;
     End;
end;

procedure TfrmManuContReceber.dspContasReceberGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'CONTASRECEBER';
end;

end.
