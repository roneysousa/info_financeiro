unit uFrmRelProdutoVencer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, FMTBcd, DB, SqlExpr, Provider,
  DBClient, ppCtrls, ppPrnabl, ppClass, ppBands, ppCache, ppDB, ppDBPipe,
  ppComm, ppRelatv, ppProd, ppReport, ppVar, Mask, ToolEdit;

type
  TfrmRelProdutosVencer = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtImprimir: TBitBtn;
    BtSair: TBitBtn;
    dstProdutos: TSQLDataSet;
    dspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    dsProdutos: TDataSource;
    qryTotal: TSQLQuery;
    cdsDados: TClientDataSet;
    cdsDadosPRO_CDPROD: TStringField;
    cdsDadosPRO_NMPROD: TStringField;
    cdsDadosPRO_NMFABR: TStringField;
    cdsDadosPRO_VLVEND: TCurrencyField;
    cdsDadosPRO_NRLOTE: TStringField;
    cdsDadosPRO_QTESTO: TFloatField;
    cdsDadosPRO_TOESTO: TCurrencyField;
    qryTotalLOT_PROCODIGO: TStringField;
    qryTotalTOTAL: TFMTBCDField;
    ppRepProdutos: TppReport;
    ppDBProdutos: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBImage1: TppDBImage;
    txtNMRELATORIO: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLine3: TppLine;
    ppLine1: TppLine;
    ppDBText1: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel14: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel15: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLine5: TppLine;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    txtPeriodo: TppLabel;
    cdsProdutosLOT_PROCODIGO: TStringField;
    cdsProdutosLOT_NRLOTE: TStringField;
    cdsProdutosLOT_QUANTIDADE: TFMTBCDField;
    cdsProdutosLOT_DTVENCIMENTO: TDateField;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppLabel8: TppLabel;
    ppLine2: TppLine;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtDias: TEdit;
    Label2: TLabel;
    edtFinal: TEdit;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    edtDTINICIAL: TDateEdit;
    edtDTFINAL: TDateEdit;
    Label4: TLabel;
    Label5: TLabel;
    rgOpcoes: TRadioGroup;
    procedure BtSairClick(Sender: TObject);
    procedure edtDiasKeyPress(Sender: TObject; var Key: Char);
    procedure BtImprimirClick(Sender: TObject);
    procedure cdsDadosCalcFields(DataSet: TDataSet);
    procedure edtDiasChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtFinalKeyPress(Sender: TObject; var Key: Char);
    procedure edtDiasExit(Sender: TObject);
    procedure edtFinalExit(Sender: TObject);
    procedure edtDTINICIALExit(Sender: TObject);
    procedure edtDTFINALExit(Sender: TObject);
    procedure edtDTINICIALEnter(Sender: TObject);
    procedure edtDTFINALEnter(Sender: TObject);
    procedure edtDiasEnter(Sender: TObject);
    procedure edtFinalEnter(Sender: TObject);
    procedure edtDTFINALChange(Sender: TObject);
  private
    Function TOTAL_ESTOQUE(M_CDPROD : String ) : Real;
    Function VALIDAR_ENTRADA(M_VALOR : integer) : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProdutosVencer: TfrmRelProdutosVencer;

implementation

uses Udm, uFuncoes;

{$R *.dfm}

procedure TfrmRelProdutosVencer.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmRelProdutosVencer.edtDiasKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13]) Then
        Key := #0;
     //
     If (key = #13) and not uFuncoes.Empty(edtDias.Text) Then
     begin
          Key := #0;
          edtFinal.SetFocus;
     End;
end;

procedure TfrmRelProdutosVencer.BtImprimirClick(Sender: TObject);
Var
    M_DTATUA, M_DTLIMI : TDate;
    M_DTINICIAL, M_DTFINAL :  TDate;
    M_OPCAO : Integer;
begin
        If not uFuncoes.Empty(edtDias.Text) and
             not uFuncoes.Empty(edtFinal.Text) Then
        begin
            If uFuncoes.Empty(edtDias.Text) Then
            begin
                 Application.MessageBox('Digite o dia inicial!!!','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 edtDias.SetFocus;
                 Exit;
            End;
            //
            If uFuncoes.Empty(edtFinal.Text) Then
            begin
                Application.MessageBox('Digite o dia final!!!','ATENÇÃO',
                    MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                edtFinal.SetFocus;
                Exit;
            End;
            //
            If (VALIDAR_ENTRADA(StrtoInt(edtFinal.Text)) = False) Then
             begin
                  edtFinal.SetFocus;
                  Exit;
             End;
             //
             M_DTINICIAL := StrtoDate(edtDias.Text+Copy(DatetoStr(Date),3,8));
             M_DTFINAL   := StrtoDate(edtFinal.Text+Copy(DatetoStr(Date),3,8));
             //
             If (M_DTFINAL < M_DTINICIAL) Then
               M_DTFINAL := IncMonth(M_DTFINAL,1);
             //
        End
        Else if (edtDTINICIAL.Text <> '  /  /    ')
          and (edtDTFINAL.Text <> '  /  /    ') Then
        begin
            If (edtDTINICIAL.Text = '  /  /    ') Then
            begin
                 Application.MessageBox('Digite o periodo inicial!!!','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 edtDTINICIAL.SetFocus;
                 Exit;
            End;
            //
            If (edtDTFINAL.Text = '  /  /    ') Then
            begin
                Application.MessageBox('Digite o periodo final!!!','ATENÇÃO',
                    MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                edtDTFINAL.SetFocus;
                Exit;
            End;
            //
             M_DTINICIAL := edtDTINICIAL.Date ;
             M_DTFINAL   := edtDTFINAL.Date;
        End;
        //
  try
    Screen.Cursor := crHourGlass;
    BtImprimir.Enabled := False;
    //
    If (rgOpcoes.ItemIndex = 0) Then
    begin
     try
        //
        M_DTATUA := Date();
        M_DTLIMI := M_DTATUA - M_DTINICIAL;
        //
        With cdsProdutos do
        Begin
             Close;
             Params.ParamByName('pDTINCIAL').AsDate := M_DTINICIAL;
             Params.ParamByName('pDTFINAL').AsDate  := M_DTFINAL;
             Open;
             //
             If not (IsEmpty) Then
             Begin
                  If (cdsDados.Active = False) then
                     cdsDados.Open;
                  //
                  cdsDados.EmptyDataSet;
                  //
                  cdsProdutos.First;
                  While not (cdsProdutos.Eof) do
                  Begin
                       cdsDados.Append;
                       cdsDados.FieldByName('PRO_CDPROD').AsString := FieldByName('LOT_PROCODIGO').AsString;
                       cdsDados.FieldByName('PRO_NMPROD').AsString := uFuncoes.NOME_PRODUTO(FieldByName('LOT_PROCODIGO').AsString);
                       cdsDados.FieldByName('PRO_NMFABR').AsString := uFuncoes.NOME_FORNECEDOR(FieldByName('LOT_PROCODIGO').AsString);
                       cdsDados.FieldByName('PRO_VLVEND').AsCurrency := uFuncoes.VALOR_PRODUTO(FieldByName('LOT_PROCODIGO').AsString);
                       cdsDados.FieldByName('PRO_NRLOTE').AsString := FieldByName('LOT_NRLOTE').AsString;
                       cdsDados.FieldByName('PRO_QTESTO').AsCurrency := FieldByName('LOT_QUANTIDADE').AsCurrency;
                       //cdsDados.FieldByName('')
                       cdsDados.Post;
                       //
                       cdsProdutos.Next;
                  End;
                  //
                  With ppRepProdutos do
                  begin
                       txtPeriodo.Caption := 'PERÍODO : '+DatetoStr(M_DTINICIAL)+' À '+DatetoStr(M_DTFINAL);
                       //'Data Limite : '+DatetoStr(M_DTLIMI);
                       PrintReport;
                  End;
             End      // Se estiver vazio
             Else
             begin
                  Application.MessageBox('Não há produtos a vender '+#13 +'na quantidade de dias indicado!!!'
                      ,'ATENÇÃO',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                  edtDias.Clear;
                  edtFinal.Clear;
                  edtDias.SetFocus;
                  //
                  Exit;
             End;
        End;
        //
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gerar relatorio!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        End;
     End;
   End  // fim-se opção A Vencer
   Else
   begin

   End; // fim-se Opcão Vencidos
 finally
  Screen.Cursor := crDefault;
  BtImprimir.Enabled := True;
 end;
 Application.ProcessMessages;
end;

procedure TfrmRelProdutosVencer.cdsDadosCalcFields(DataSet: TDataSet);
begin
     cdsDados.FieldByName('PRO_TOESTO').AsFloat :=
       TOTAL_ESTOQUE(cdsDados.FieldByName('PRO_CDPROD').AsString);
end;

function TfrmRelProdutosVencer.TOTAL_ESTOQUE(M_CDPROD: String): Real;
begin
     With qryTotal do
     begin
          Close;
          Params.ParamByName('pCODIGO').AsString := M_CDPROD;
          Open;
     End;
     //
     result := qryTotal.FieldByName('TOTAL').AsCurrency;
end;

procedure TfrmRelProdutosVencer.edtDiasChange(Sender: TObject);
begin
     if not uFuncoes.Empty(edtDias.Text)
      AND not uFuncoes.Empty(edtFinal.Text) Then
       BtImprimir.Enabled := True
     Else
       BtImprimir.Enabled := False;
end;

procedure TfrmRelProdutosVencer.FormShow(Sender: TObject);
begin
    BtImprimir.Enabled := False;
end;

procedure TfrmRelProdutosVencer.edtFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13]) Then
        Key := #0;
     //

     If (key = #13) and not uFuncoes.Empty(edtDias.Text) Then
     begin
          Key := #0;
          BtImprimirClick(Sender);
     End;

end;

procedure TfrmRelProdutosVencer.edtDiasExit(Sender: TObject);
Var
    M_DTINIC : String;
begin
     If not uFuncoes.Empty(edtDias.Text) Then
        begin
            If (VALIDAR_ENTRADA(StrtoInt(edtDias.Text)) = False) Then
              begin
                   edtDias.SetFocus;
                   Exit;
              End;
            try
                M_DTINIC := edtDias.Text+Copy(DatetoStr(Date),3,8);
                StrToDate(M_DTINIC);
            except
                on EConvertError do
                begin
                    ShowMessage ('Dia Inválido!');
                    edtDias.SetFocus;
                    Exit;
                End;
          end;
        End;
end;

procedure TfrmRelProdutosVencer.edtFinalExit(Sender: TObject);
Var
    M_DTFINA : String;
begin
     If not uFuncoes.Empty(edtFinal.Text) Then
       Begin
            If (VALIDAR_ENTRADA(StrtoInt(edtFinal.Text)) = False) Then
              begin
                   edtFinal.SetFocus;
                   Exit;
              End;
            try
                M_DTFINA   := edtFinal.Text+Copy(DatetoStr(Date),3,8);
                StrToDate(M_DTFINA);
            except
                on EConvertError do
                begin
                    ShowMessage ('Dia Inválido!');
                    edtFinal.SetFocus;
                    Exit;
                End;
            End;
       End;
end;


function TfrmRelProdutosVencer.VALIDAR_ENTRADA(M_VALOR: integer): Boolean;
begin
     result := True;
     If (M_VALOR < 1 ) or (M_VALOR > 31) Then
         result := False;
end;

procedure TfrmRelProdutosVencer.edtDTINICIALExit(Sender: TObject);
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
end;

procedure TfrmRelProdutosVencer.edtDTFINALExit(Sender: TObject);
begin
     If (edtDTFINAL.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(edtDTFINAL.Text);
              edtDTFINAL.Text := DatetoStr(edtDTFINAL.Date);
              //
              If (edtDTFINAL.Date < edtDTINICIAL.Date) Then
              Begin
                   Application.MessageBox(PChar('Perido final deve ser maior ou igual ao inicial!!!'),
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
end;

procedure TfrmRelProdutosVencer.edtDTINICIALEnter(Sender: TObject);
begin
     edtDias.Clear;
     edtFinal.Clear;
end;

procedure TfrmRelProdutosVencer.edtDTFINALEnter(Sender: TObject);
begin
     edtDias.Clear;
     edtFinal.Clear;
end;

procedure TfrmRelProdutosVencer.edtDiasEnter(Sender: TObject);
begin
     edtDTINICIAL.Clear;
     edtDTFINAL.Clear;
end;

procedure TfrmRelProdutosVencer.edtFinalEnter(Sender: TObject);
begin
     edtDTINICIAL.Clear;
     edtDTFINAL.Clear;
end;

procedure TfrmRelProdutosVencer.edtDTFINALChange(Sender: TObject);
begin
     if (edtDTINICIAL.Text <> '  /  /    ')
      AND (edtDTFINAL.Text <> '  /  /    ') Then
       BtImprimir.Enabled := True
     Else
       BtImprimir.Enabled := False;
end;

end.
