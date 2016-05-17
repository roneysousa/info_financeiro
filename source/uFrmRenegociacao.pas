unit uFrmRenegociacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, ToolEdit,
  CurrEdit, DB, ImgList, DBClient, math;

type
  TfrmRenegociacao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    pnlEntrada: TPanel;
    Panel4: TPanel;
    grdConsultar: TDBGrid;
    Label1: TLabel;
    edtCDLOJA: TEdit;
    lblCliente: TEdit;
    spLocCliente: TSpeedButton;
    Label2: TLabel;
    edtDTMOVI: TDateEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    Panel5: TPanel;
    sbProximo: TSpeedButton;
    sbUltimo: TSpeedButton;
    sbAnterior: TSpeedButton;
    sbPrimeiro: TSpeedButton;
    edtTotalRenegociar: TCurrencyEdit;
    edtVLDESC: TCurrencyEdit;
    edtVLRECEBER: TCurrencyEdit;
    edtVLENTRADA: TCurrencyEdit;
    edtVLJUROS: TCurrencyEdit;
    edtQTPARC: TCurrencyEdit;
    edtValorParcelas: TCurrencyEdit;
    dsParcelas: TDataSource;
    Label10: TLabel;
    cmbNMLOJA: TComboBox;
    ImageList1: TImageList;
    ClientDataSet1: TClientDataSet;
    bntCalcular: TBitBtn;
    Label11: TLabel;
    edtVLFINAN: TCurrencyEdit;
    dbeDTVENC: TDateEdit;
    Label12: TLabel;
    Label13: TLabel;
    dbeDT2Venc: TDateEdit;
    Label14: TLabel;
    mmoObservacao: TMemo;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    lblTotalDebito: TLabel;
    Label18: TLabel;
    lblParcelas: TLabel;
    procedure edtCDLOJAKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDLOJAExit(Sender: TObject);
    procedure spLocClienteClick(Sender: TObject);
    procedure edtCDLOJAChange(Sender: TObject);
    procedure dsParcelasDataChange(Sender: TObject; Field: TField);
    procedure sbPrimeiroClick(Sender: TObject);
    procedure sbAnteriorClick(Sender: TObject);
    procedure sbProximoClick(Sender: TObject);
    procedure sbUltimoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdConsultarCellClick(Column: TColumn);
    procedure grdConsultarColEnter(Sender: TObject);
    procedure grdConsultarDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure grdConsultarEnter(Sender: TObject);
    procedure edtCDLOJAEnter(Sender: TObject);
    procedure edtVLDESCExit(Sender: TObject);
    procedure bntCalcularClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtVLJUROSChange(Sender: TObject);
    procedure edtVLENTRADAExit(Sender: TObject);
    procedure edtVLJUROSEnter(Sender: TObject);
    procedure dbeDTVENCExit(Sender: TObject);
    procedure dbeDT2VencExit(Sender: TObject);
    procedure edtQTPARCExit(Sender: TObject);
    procedure cmbNMLOJAEnter(Sender: TObject);
  private
    { Private declarations }
    procedure LOJAS;
    function TotalRenegociar(aCDS : TClientDataSet) : Double;
    function CalcularValorParcela(fValorReceber, fValorEntrada, fPencDesc, fJuros : Double; iParcelas : Integer): Double;
    Procedure Limpar;
    Function GetTotalDebito(aCds : TClientDataSet): Double;
  public
    { Public declarations }
  end;

var
  frmRenegociacao: TfrmRenegociacao;

implementation

uses uFuncoes, udmConsulta, uFrmBuscaClientes, uDm2, uDmRelatorios, Udm,
  UFrmAdmin, udmDados;

{$R *.dfm}

procedure TfrmRenegociacao.edtCDLOJAKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
          key:=#0;
      //
     If (key = #13) and not uFuncoes.Empty(edtCDLOJA.Text) Then
     Begin
          Key := #0;
          edtDTMOVI.SetFocus;
     End;
     //
     If (key = #13) and uFuncoes.Empty(edtCDLOJA.Text) Then
     Begin
          Key := #0;
          spLocClienteClick(Sender);
     End;
end;

procedure TfrmRenegociacao.edtCDLOJAExit(Sender: TObject);
Var
    M_CDLOJA, M_CDCLIE : Integer;
begin
     pnlEntrada.Enabled := False;
     lblTotalDebito.Caption := '';
     lblParcelas.Caption := '';
     If not uFuncoes.Empty(edtCDLOJA.Text) Then
      begin
           edtCDLOJA.Text := uFuncoes.StrZero(edtCDLOJA.Text,7);
           If not (dmConsultas.BUSCA_CLIENTE(StrtoInt(edtCDLOJA.Text))) Then
            begin
                 Application.MessageBox(PChar('Código de loja não cadastrado!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 lblCliente.Clear;
                 edtCDLOJA.Clear;
                 edtCDLOJA.SetFocus;
                 Exit;
            End
            Else
            Begin
                lblCliente.Text := dmConsultas.qryLocCliente.FieldByName('CLI_FANTASIA').AsString;
                M_CDLOJA := uFuncoes.CDLOJA(cmbNMLOJA.Text);
                M_CDCLIE := StrtoInt(edtCDLOJA.Text);
                //
                if not (DM2.AddParcelaParaRenegociacao(M_CDLOJA, M_CDCLIE)) then
                  begin
                       Application.MessageBox(PChar('Não debito para cliente!!'),
                          'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                       lblCliente.Clear;
                       edtCDLOJA.Clear;
                       edtCDLOJA.SetFocus;
                       Exit;
                  End
                  Else
                  begin
                      lblTotalDebito.Caption := FormatFloat('###,##0.#0', GetTotalDebito(DM2.cdsPCRenegociacao));
                      lblParcelas.Caption := 'Parcela(s) :' + InttoStr(DM2.cdsPCRenegociacao.RecordCount);
                      edtTotalRenegociar.Value := TotalRenegociar(DM2.cdsPCRenegociacao);
                      pnlEntrada.Enabled := true;
                  End;
            End;
      End;
end;

procedure TfrmRenegociacao.spLocClienteClick(Sender: TObject);
begin
     edtCDLOJA.SetFocus;
     Application.CreateForm(TfrmBuscaClientes, frmBuscaClientes);
     try
          uFrmBuscaClientes.M_NRFROM := 1;
          frmBuscaClientes.ShowModal;
     Finally
          If not (frmBuscaClientes.cdsBusca.IsEmpty) Then
              edtCDLOJA.Text := frmBuscaClientes.cdsBuscaCLI_CODIGO.AsString;
          If not uFuncoes.Empty(edtCDLOJA.Text) Then
            edtDTMOVI.SetFocus
          Else
            edtCDLOJA.SetFocus;
          //
          frmBuscaClientes.Free;
     End;
end;

procedure TfrmRenegociacao.edtCDLOJAChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDLOJA.text) Then
      begin
           lblCliente.Clear;
           //
           If (DM2.cdsPCRenegociacao.Active) Then
             DM2.cdsPCRenegociacao.EmptyDataSet;
           //
           Limpar;  
      End;
end;

procedure TfrmRenegociacao.LOJAS;
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

procedure TfrmRenegociacao.dsParcelasDataChange(Sender: TObject;
  Field: TField);
begin
  sbPrimeiro.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Bof);
  sbAnterior.Enabled := sbPrimeiro.Enabled;
  sbUltimo.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Eof);
  sbProximo.Enabled := sbUltimo.Enabled;
  //
  BtGravar.Enabled := ((Sender as TDataSource).DataSet.Active) and not ((Sender as TDataSource).DataSet.IsEmpty);
end;

procedure TfrmRenegociacao.sbPrimeiroClick(Sender: TObject);
begin
     If (dsParcelas.DataSet.Active) then
        dsParcelas.DataSet.First;
end;

procedure TfrmRenegociacao.sbAnteriorClick(Sender: TObject);
begin
     If (dsParcelas.DataSet.Active) then
        dsParcelas.DataSet.Prior;
end;

procedure TfrmRenegociacao.sbProximoClick(Sender: TObject);
begin
     If (dsParcelas.DataSet.Active) then
        dsParcelas.DataSet.Next;
end;

procedure TfrmRenegociacao.sbUltimoClick(Sender: TObject);
begin
     If (dsParcelas.DataSet.Active) then
        dsParcelas.DataSet.Last;
end;

procedure TfrmRenegociacao.FormShow(Sender: TObject);
begin
      LOJAS;
      //
      cmbNMLOJA.SetFocus;
      //
      edtDTMOVI.Date := Date();
      //
      pnlEntrada.Enabled := False;
      lblTotalDebito.Caption := '';
      lblParcelas.Caption := '';
      //
      BtGravar.Enabled := False;
end;

procedure TfrmRenegociacao.grdConsultarCellClick(Column: TColumn);
begin
  if (Column.Field = DM2.cdsPCRenegociacaoCDS_FLRENEG)  then
  begin
    DM2.cdsPCRenegociacao.Edit;
    DM2.cdsPCRenegociacaoCDS_FLRENEG.asBoolean := not DM2.cdsPCRenegociacaoCDS_FLRENEG.AsBoolean;
    //
    edtTotalRenegociar.Value := TotalRenegociar(DM2.cdsPCRenegociacao);
    edtVLFINAN.Value         := edtTotalRenegociar.Value;
  end;                                                                 
end;

procedure TfrmRenegociacao.grdConsultarColEnter(Sender: TObject);
begin
  if grdConsultar.SelectedField = DM2.cdsPCRenegociacaoCDS_FLRENEG then
    grdConsultar.Options := grdConsultar.Options - [dgEditing]
  else
    grdConsultar.Options := grdConsultar.Options + [dgEditing];
end;

procedure TfrmRenegociacao.grdConsultarDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  R: TRect;
begin
  grdConsultar.DefaultDrawDataCell(Rect, grdConsultar.columns[datacol].field, State);
 {pinta checkbox}
  if Column.Field = DM2.cdsPCRenegociacaoCDS_FLRENEG then
  begin
    grdConsultar.Canvas.FillRect(Rect);
    ImageList1.Draw(grdConsultar.Canvas, Rect.Left + 10, Rect.Top + 1, 0);
    if DM2.cdsPCRenegociacaoCDS_FLRENEG.AsBoolean then
      ImageList1.Draw(grdConsultar.Canvas, Rect.Left + 10, Rect.Top + 1, 2)
    else
      ImageList1.Draw(grdConsultar.Canvas, Rect.Left + 10, Rect.Top + 1, 1);
  end;
end;

procedure TfrmRenegociacao.grdConsultarEnter(Sender: TObject);
begin
     grdConsultar.SelectedIndex := 8;
end;

procedure TfrmRenegociacao.edtCDLOJAEnter(Sender: TObject);
begin
     If (DM2.cdsPCRenegociacao.Active) Then
       DM2.cdsPCRenegociacao.EmptyDataSet;
     //
     lblTotalDebito.Caption := '';
     lblParcelas.Caption  := '';
     pnlEntrada.Enabled := False;  
end;

function TfrmRenegociacao.TotalRenegociar(aCDS: TClientDataSet): Double;
Var
   M_VALOR : Double;
begin
     M_VALOR := 0;
     With aCDS do
      begin
           DisableControls;
           First;
           While not (eof) do
            begin
                 If (FieldByName('CDS_FLRENEG').AsBoolean) Then
                    M_VALOR := M_VALOR + FieldByName('CSD_VALOR_ATUAL').AsFloat;
                 //
                 next;
            End;
           First;
           EnableControls;
      End;
      //
      Result := M_VALOR;
end;

procedure TfrmRenegociacao.edtVLDESCExit(Sender: TObject);
begin
     If (edtTotalRenegociar.Value > 0) and (edtVLDESC.Value > 0) Then
        edtVLRECEBER.Value := edtTotalRenegociar.Value - edtVLDESC.Value
     Else
        edtVLRECEBER.Value := edtTotalRenegociar.Value;
     //
     If (edtVLRECEBER.Value > 0) Then
        edtVLFINAN.Value := edtVLRECEBER.Value - edtVLENTRADA.Value;
end;

function TfrmRenegociacao.CalcularValorParcela(fValorReceber,
  fValorEntrada, fPencDesc, fJuros: Double; iParcelas: Integer): Double;
Var
   M_VLRECE, M_VLENTR, M_PEDESC, M_VLJURO : Double;
   M_NRPARC : Integer;
   M_VLPARC : Real;
begin
     M_VLPARC := 0;
     M_VLENTR := fValorEntrada;
     M_VLRECE := fValorReceber;
     M_PEDESC := fPencDesc;
     //M_VLRECE := M_VLRECE + uFuncoes.Gerapercentual(M_VLRECE, M_PEDESC);
     M_VLJURO := fJuros;
     M_NRPARC := iParcelas;
     //
     //M_VLPARC := uFuncoes.Arredondar(M_VLRECE/M_NRPARC, 2);
     M_VLPARC := M_VLRECE / ((1-uFuncoes.Potencia(((1+(M_VLJURO/100))), -M_NRPARC))/(M_VLJURO/100));
     //uFuncoes.Arredondar(M_VLRECE/M_NRPARC, 2);
     //
     Result := M_VLPARC;
end;

procedure TfrmRenegociacao.bntCalcularClick(Sender: TObject);
begin
   If not (dsParcelas.DataSet.IsEmpty) Then
   begin
      If (edtQTPARC.Value = 0) Then
        begin
             edtQTPARC.SetFocus;
             Exit;
        End;
      If (edtTotalRenegociar.Value > 0) and (edtQTPARC.Value > 0) and (edtVLFINAN.Value > 0) Then
           edtValorParcelas.Value := CalcularValorParcela(edtVLFINAN.Value,
             edtVLENTRADA.Value, edtVLDESC.Value, edtVLJUROS.Value, StrtoInt(edtQTPARC.Text));
   End;          
end;

procedure TfrmRenegociacao.Limpar;
begin
     edtTotalRenegociar.Value := 0;
     edtVLDESC.Value          := 0;
     edtVLENTRADA.Value       := 0;
     edtVLJUROS.Value         := 0;
     edtVLRECEBER.Value       := 0;
     edtQTPARC.Value          := 0;
     edtValorParcelas.Value   := 0;
     edtVLFINAN.Value         := 0;
     //
     lblTotalDebito.Caption   := '0,00';
     lblParcelas.Caption      := 'Parcelas:';
end;

procedure TfrmRenegociacao.BtGravarClick(Sender: TObject);
Var
   M_CDLOJA, M_CDCLIE, M_NRCRED, iParcelas, M_SEQ, M_QTPARC, M_CDNATU : Integer;
   M_DTVENC : TDatetime;
   iUsuario, iQuantBol : Integer;
   M_FLENTRADA, M_FLVINCULO : boolean;
   aNossoNum, aDataVenc, aInstrucao : String;
begin
  M_FLENTRADA := false;
  iQuantBol := 0;
  M_FLVINCULO := False;
  //
  If (edtTotalRenegociar.Value = 0) Then
   begin
        Application.MessageBox(PChar('Total a negociar está zerado.'+#13+'Selecione parcelas para negociar.'),
           'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
        Exit;
   End;
   //
  If (edtQTPARC.Value < 1) Then
   begin
        Application.MessageBox(PChar('Quantidade de parcelas inválida.'+#13+'Digite um valor iguail o superior a 1.'),
           'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
        Exit;
   End;
  //
  If (edtValorParcelas.Value = 0) Then
   begin
        Application.MessageBox(PChar('Valor da parcela inválido.'+#13+'Clique no botão Calcular para gerar o valor da parcela.'),
           'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
        bntCalcular.SetFocus;
        Exit;
   End;
   //
   If (dbeDTVENC.Text = '  /  /    ') Then
   begin
        Application.MessageBox(PChar('Digite a data do 1º Vencimento.'),
           'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
        dbeDTVENC.SetFocus;
        Exit;
   End;
  //
  bntCalcularClick(Sender);
  //
  With DM2.cdsPCRenegociacao do
  begin
       DisableControls;
       First;
       While not (Eof) do
        begin
             //
             If (FieldByName('CDS_FLRENEG').AsBoolean) Then
             begin
                 aNossoNum := FieldByName('CDS_NOSSO_NUMERO').AsString;
                 aDataVenc := FieldByName('CDS_DTVENC').AsString;
                 iQuantBol := iQuantBol + 1;
             End;
             Next;
        End;
       First;
       EnableControls;
       //
       if (iQuantBol = 1) Then
        begin
          M_FLVINCULO := True;
          aInstrucao := 'BOLETO VINCULADO - NOSSO NUMERO: '+aNossoNum + ' DATA VENCIMENTO :'+aDataVenc;
        End;
  End;
  //
  if (edtVLENTRADA.Value > 0) Then
     M_FLENTRADA := True;
  iUsuario := StrtoInt(UFrmAdmin.M_CDUSUA);
  //
  If Application.MessageBox('Confirma Renegociação com o cliente?',
     'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
   begin
     If (edtDTMOVI.Text <> '  /  /    ') Then
      If not (DM2.cdsPCRenegociacao.IsEmpty) and (edtValorParcelas.Value > 0) Then
        begin
             M_CDLOJA := uFuncoes.CDLOJA(cmbNMLOJA.Text);
             M_CDCLIE := StrtoInt(edtCDLOJA.Text);
             M_CDNATU := DM2.cdsPCRenegociacaoCDS_NATUREZA.AsInteger;
             iParcelas := 1;
             M_QTPARC := StrtoInt(edtQTPARC.Text);
             //
             dm.RefreshCDS(dm.CdsConfig);
             dm.CdsConfig.Edit;
             dm.CdsConfigCFG_CREDITO.Value       := dm.CdsConfigCFG_CREDITO.Value+1;
             M_NRCRED := dm.CdsConfigCFG_CREDITO.AsInteger;
             dm.CdsConfig.ApplyUpdates(0);
             // Se tiver entrada
             If (M_FLENTRADA) Then
              begin
                   dm2.AddParcelaContaReceber(M_CDLOJA, M_NRCRED, M_CDCLIE, 0,
                           iParcelas, 1, M_CDNATU, StrtoInt(uFrmAdmin.M_CDUSUA),
                           edtVLENTRADA.Value, 'PARCELA DE ENTRADA: '+#13+mmoObservacao.Lines.Text, 'A', 'N',
                           edtDTMOVI.Date, Date(), edtDTMOVI.Date);
              End;
             //
             DM2.cdsPCRenegociacao.First;
             While (iParcelas <= M_QTPARC) do
              begin
                   //  pLOJA, pCREDITO, pCLIENTE, pNRVENDA,
                   //  pPARCELA, pQTPARCELAS, pNATUREZA, pUSUARIO: Integer; pVALORPARCELA: Double;
                   //  pDESCRICAO, pSITUACAO, pFLBOLETO: String; pDATAEMISSAO,
                   //  pDATAVENCIMENTO, pDTRENEGOCIACAO: TDATETime
                   //M_DTVENC := IncMonth(edtDTMOVI.Date, iParcelas);
                   If (iParcelas = 1) Then
                       M_DTVENC := dbeDTVENC.Date
                   Else
                   begin
                        If (dbeDT2Venc.Text = '  /  /    ') Then
                            M_DTVENC := IncMonth(dbeDTVENC.Date, (iParcelas - 1))
                        Else
                        begin
                             If (iParcelas = 2) Then
                                 M_DTVENC := dbeDT2Venc.Date
                             Else
                                 M_DTVENC := IncMonth(dbeDT2VENC.Date, (iParcelas - 2));
                        End;
                   End;
                   //
                   If not (M_FLVINCULO) Then
                     dm2.AddParcelaContaReceber(M_CDLOJA, M_NRCRED, M_CDCLIE, 0,
                             iParcelas, StrtoInt(edtQTPARC.text), M_CDNATU, StrtoInt(uFrmAdmin.M_CDUSUA),
                             edtValorParcelas.Value, mmoObservacao.Lines.Text, 'A', 'N',
                             edtDTMOVI.Date, M_DTVENC, edtDTMOVI.Date)
                   Else
                     dm2.AddParcelaContaReceber(M_CDLOJA, M_NRCRED, M_CDCLIE, 0,
                             iParcelas, StrtoInt(edtQTPARC.text), M_CDNATU, StrtoInt(uFrmAdmin.M_CDUSUA),
                             edtValorParcelas.Value, aInstrucao, 'A', 'N',
                             edtDTMOVI.Date, M_DTVENC, edtDTMOVI.Date);
                   //
                   iParcelas := iParcelas + 1;
              End;
              //
              DM2.cdsPCRenegociacao.First;
              While not (DM2.cdsPCRenegociacao.eof) do
               begin
                   If (DM2.cdsPCRenegociacao.FieldByName('CDS_FLRENEG').AsBoolean) Then
                   begin
                       M_SEQ := DM2.cdsPCRenegociacao.FieldByName('CDS_SEQUENCIA').AsInteger;
                       //
                       DM2.SetParcelaRenegociacao(M_Seq);
                       //
                   End;
                   //
                   DM2.cdsPCRenegociacao.next;
               End;
              //
              {AddRegistroRenegociacao(iCDLOJA, iCLIENTE, iQUANTIDADE,
              iUSUARIO: integer; fTOTAL_RENEGOCIACAO, fDESCONTO, fVLENTRADA,
              fVLFINANCIADO, fPEJUROS, fVLPARCELA: double; aDTMOVI, aDTVENC1: TDATE;
              aDTVENC2, aOBSERVACAO: String): Boolean;}
              dmDados.AddRegistroRenegociacao(M_CDLOJA, M_CDCLIE, StrtoInt(edtQTPARC.Text),
                StrtoInt(uFrmAdmin.M_CDUSUA), edtTotalRenegociar.Value, edtVLDESC.Value, edtVLENTRADA.Value,
                edtVLFINAN.Value, edtVLJUROS.Value, edtValorParcelas.Value, edtDTMOVI.Date, dbeDTVENC.Date,
                dbeDT2Venc.Text, mmoObservacao.Text);
              //
              dbeDTVENC.Clear;
              dbeDT2Venc.Clear;
              mmoObservacao.Lines.Clear;
              //
              Application.MessageBox(PChar('Renegociação realizada com sucesso.'),
                          'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              //
              Dm.Start;
              Try
                If not (dm.IncluirTarefaUsuario( iUsuario,
                   'Gerou Renegociação Lojas\Comodatários\Locatários : ' +
                    uFuncoes.StrZero(edtCDLOJA.Text,7) +
                    ' Total Financiado :' +FormatFloat('###,##0.#0',edtVLFINAN.Value)+
                    ' Valor Parcela :' +FormatFloat('###,##0.#0',edtVLFINAN.Value)+ ' *F*')) Then
                     ShowMessage('Erro ao adicionar tarefa do usuário.');
                   dm.Comit(Dm.Transc);
              Except
                 dm.Rollback;
              End;
              //
              edtCDLOJA.Clear;
              edtCDLOJA.SetFocus;
        End;
   End;
end;

procedure TfrmRenegociacao.BtCancelarClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmRenegociacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if (DM2.cdsPCRenegociacao.Active) Then
        DM2.cdsPCRenegociacao.EmptyDataSet;
     //
     DM2.cdsPCRenegociacao.Close;
end;

procedure TfrmRenegociacao.edtVLJUROSChange(Sender: TObject);
begin
     If (edtValorParcelas.Value > 0) Then
        edtValorParcelas.Clear;
end;

procedure TfrmRenegociacao.edtVLENTRADAExit(Sender: TObject);
begin
     If (edtVLRECEBER.Value > 0) Then
        edtVLFINAN.Value := edtVLRECEBER.Value - edtVLENTRADA.Value;
end;

procedure TfrmRenegociacao.edtVLJUROSEnter(Sender: TObject);
begin
     If (edtVLRECEBER.Value > 0) Then
        edtVLFINAN.Value := edtVLRECEBER.Value - edtVLENTRADA.Value;
end;

procedure TfrmRenegociacao.dbeDTVENCExit(Sender: TObject);
begin
     If (dbeDTVENC.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(dbeDTVENC.Text);
              dbeDTVENC.Text := DatetoStr(dbeDTVENC.Date);
              //
              If (dbeDTVENC.Date < Date()) Then
                begin
                     Application.MessageBox(PChar('Data inferior a data atual.'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     dbeDTVENC.Clear;
                     dbeDTVENC.SetFocus;
                     Exit;
                End;
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inválida!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     dbeDTVENC.Clear;
                     dbeDTVENC.SetFocus;
                End;
           end;
     End;
end;

procedure TfrmRenegociacao.dbeDT2VencExit(Sender: TObject);
begin
     If (dbeDT2Venc.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(dbeDT2Venc.Text);
              dbeDT2Venc.Text := DatetoStr(dbeDT2Venc.Date);
              //
              If (dbeDT2Venc.Date < dbeDTVenc.Date) Then
                begin
                     Application.MessageBox(PChar('Data 2º vencimento deve ser maior '+#13' que a data do 1º vencimento.'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     dbeDT2Venc.Date := IncMonth(dbeDTVenc.Date, 1);
                     dbeDT2Venc.SetFocus;
                     Exit;
                End;
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inválida!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     dbeDT2Venc.Clear;
                     dbeDT2Venc.SetFocus;
                End;
           end;
     End;
end;

procedure TfrmRenegociacao.edtQTPARCExit(Sender: TObject);
begin
     If (edtQTPARC.Value < 1) Then
      begin
           Application.MessageBox(PChar('Quantidade de parcelas inválido.'+#13+'Digite outro valor.'),
             'ATENÇÃO', MB_OK+MB_ICONWARNING +MB_APPLMODAL);
           //
           edtQTPARC.SetFocus;
           Exit;
      End;
end;

function TfrmRenegociacao.GetTotalDebito(aCds: TClientDataSet): Double;
Var
   fValorDebito : Double;
begin
     fValorDebito := 0;
     With aCds do
      begin
           DisableControls;
           First;
           While not (Eof) do
            begin
                 fValorDebito := fValorDebito + aCds.FieldByName('CDS_VALOR').AsFloat;
                 //
                 Next;
            End;
           //
           First;
           EnableControls;
      End;
      //
      Result := fValorDebito;
end;

procedure TfrmRenegociacao.cmbNMLOJAEnter(Sender: TObject);
begin
     If (DM2.cdsPCRenegociacao.Active) Then
             DM2.cdsPCRenegociacao.EmptyDataSet;
     //
     Limpar;
end;

end.
