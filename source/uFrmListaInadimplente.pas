unit uFrmListaInadimplente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ToolEdit, ExtCtrls, Grids, DBGrids, DB,
  ppCtrls, ppPrnabl, ppClass, ppBands, ppCache, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppVar, OleServer, ExcelXP, comObj, ppStrtch,
  ppMemo, Spin, WordXP, DBCtrls;

type
  TNumeroStr = string;
  TfrmRelListaInadimplentes = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label12: TLabel;
    edtDTINIC: TDateEdit;
    edtDTFINA: TDateEdit;
    cmbGrupos: TComboBox;
    btnConsulta: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    lblRegistros: TLabel;
    btnFechar: TBitBtn;
    btnVisualizar: TBitBtn;
    grdConsultar: TDBGrid;
    dsDados: TDataSource;
    ppDBPipeline1: TppDBPipeline;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBImage1: TppDBImage;
    ppLabel1: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel3: TppLabel;
    ppDBText4: TppDBText;
    ppLine1: TppLine;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine4: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel2: TppLabel;
    lblPeriodo: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLabel6: TppLabel;
    ppLine3: TppLine;
    ppDBCalc2: TppDBCalc;
    ppLabel9: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLine2: TppLine;
    ppLabel10: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    btnExcel: TBitBtn;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ppMemo1: TppMemo;
    ppMemo2: TppMemo;
    ppLabel11: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppLabel12: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppReport2: TppReport;
    ppDBPipeline2: TppDBPipeline;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText8: TppDBText;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLine5: TppLine;
    ppLine6: TppLine;
    rgTipo: TRadioGroup;
    ppMemo3: TppMemo;
    ppDBText9: TppDBText;
    ppDBCalc7: TppDBCalc;
    ppMemo4: TppMemo;
    ppMemo5: TppMemo;
    ppDBText10: TppDBText;
    ppMemo6: TppMemo;
    ppMemo7: TppMemo;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppLabel16: TppLabel;
    ppDBCalc11: TppDBCalc;
    ppLabel17: TppLabel;
    ppDBCalc12: TppDBCalc;
    sedDia: TSpinEdit;
    Label2: TLabel;
    lblDia: TppLabel;
    rgModeloCartas: TRadioGroup;
    btnCartao: TBitBtn;
    btnImpCarta: TBitBtn;
    Panel4: TPanel;
    DBNavigator1: TDBNavigator;
    procedure FormShow(Sender: TObject);
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINAExit(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure dsDadosDataChange(Sender: TObject; Field: TField);
    procedure btnFecharClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure cmbGruposEnter(Sender: TObject);
    procedure edtDTINICEnter(Sender: TObject);
    procedure edtDTFINAEnter(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure edtDTINICKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTFINAKeyPress(Sender: TObject; var Key: Char);
    procedure cmbGruposKeyPress(Sender: TObject; var Key: Char);
    procedure sedDiaEnter(Sender: TObject);
    procedure sedDiaKeyPress(Sender: TObject; var Key: Char);
    procedure btnCartaoClick(Sender: TObject);
    procedure btnImpCartaClick(Sender: TObject);
  private
    { Private declarations }
    procedure Carregar_Grupos;
    procedure LimparRotulo;
    Procedure VisualizarCarta(iCliente : Integer; aTipo : String);
    Procedure VisualizarCarta2(iCliente : Integer; aTipo : String);
    Procedure VisualizarCartaRecisao(iCliente : Integer; aTipo : String);
    Procedure VisualizarCartaRecisao2(iCliente : Integer; aTipo : String);
    //
    function NumeroParaExtenso(parmNumero: Real): string;
    function ConversaoRecursiva(N: LongWord): string;
  public
    { Public declarations }
  end;

const
         Unidades: array[1..19] of TNumeroStr = ('um', 'dois', 'três', 'quatro','cinco', 'seis', 'sete', 'oito', 'nove', 'dez', 'onze', 'doze',
         'treze', 'quatorze', 'quinze', 'dezesseis', 'dezessete', 'dezoito','dezenove');

         Dezenas: array[1..9] of TNumeroStr = ('dez', 'vinte', 'trinta', 'quarenta','cinqüenta', 'sessenta', 'setenta', 'oitenta', 'noventa');

         Centenas: array[1..9] of TNumeroStr = ('cem', 'duzentos', 'trezentos','quatrocentos', 'quinhentos', 'seiscentos', 'setecentos',          'oitocentos','novecentos');

         ErrorString = 'Valor fora da faixa';
         Min = 0.01;
         Max = 4294967295.99;
         Moeda = ' real ';
         Moedas = ' reais ';
         Centesimo = ' centavo ';
         Centesimos = ' centavos ';

var
  frmRelListaInadimplentes: TfrmRelListaInadimplentes;

implementation

uses Udm, udmConsulta, udmDados, uFuncoes;

{$R *.dfm}

procedure TfrmRelListaInadimplentes.Carregar_Grupos;
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

procedure TfrmRelListaInadimplentes.FormShow(Sender: TObject);
begin
     Carregar_Grupos;
     //
     btnVisualizar.Enabled := false;
     btnExcel.Enabled := btnVisualizar.Enabled;
     //
     btnCartao.Enabled   := False;
     btnImpCarta.Enabled := False;
end;

procedure TfrmRelListaInadimplentes.edtDTINICExit(Sender: TObject);
begin
    If (edtDTINIC.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(edtDTINIC.Text);
              edtDTINIC.Text := DatetoStr(edtDTINIC.Date);
              //
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inválida!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edtDTINIC.Clear;
                     edtDTINIC.SetFocus;
                End;
           end;
     End;
end;

procedure TfrmRelListaInadimplentes.edtDTFINAExit(Sender: TObject);
begin
     If (edtDTFINA.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(edtDTFINA.Text);
              edtDTFINA.Text := DatetoStr(edtDTFINA.Date);
              //
              If (edtDTFINA.Date < edtDTINIC.Date) Then
              Begin
                   Application.MessageBox(PChar('Período final deve ser maior ou igual ao inicial!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   edtDTFINA.Date := Date;
                   edtDTFINA.SetFocus;
                   Exit;
              End;
          except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inválida!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edtDTFINA.Clear;
                     edtDTFINA.SetFocus;
                End;
           end;
     End;
end;

procedure TfrmRelListaInadimplentes.btnConsultaClick(Sender: TObject);
Var
   iGrupo : Integer;
begin
     dmDados.cdsListaClientes.close;
     If not uFuncoes.Empty(cmbGrupos.Text) Then
         iGrupo := Dm.GetCodigoGrupo(cmbGrupos.Text)
     Else
         iGrupo := 0;
     //
     btnConsulta.Enabled := False;
     try
        Screen.Cursor := crHourGlass;
        dmDados.ConsultaClientesInadimplente(iGrupo, sedDia.Value, edtDTINIC.Date, edtDTFINA.Date);
     Finally
           btnConsulta.Enabled := true;
           Screen.Cursor := crDefault;
           grdConsultar.SetFocus;
     End;
     Application.ProcessMessages;
     //
     If (dmDados.cdsListaClientes.IsEmpty) Then
        Application.MessageBox(PChar('Não há dados para os parametros especificado.'),
                'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmRelListaInadimplentes.dsDadosDataChange(Sender: TObject;
  Field: TField);
begin
    If (dsDados.DataSet.Active) and not (dsDados.DataSet.IsEmpty) Then
        lblRegistros.Caption := 'Registro(s): ' +
                  InttoStr(dsDados.DataSet.RecNo)+'/'+
                 InttoStr(dsDados.DataSet.RecordCount)
    Else
        lblRegistros.Caption := 'Registro(s): ';
    //
    btnVisualizar.Enabled := (dsDados.DataSet.Active) and not (dsDados.DataSet.IsEmpty);
    btnExcel.Enabled := btnVisualizar.Enabled;
    //
    btnCartao.Enabled   := (dsDados.DataSet.Active) and not (dsDados.DataSet.IsEmpty);
    btnImpCarta.Enabled := (dsDados.DataSet.Active) and not (dsDados.DataSet.IsEmpty);
end;

procedure TfrmRelListaInadimplentes.btnFecharClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmRelListaInadimplentes.btnVisualizarClick(Sender: TObject);
begin
     If not (dsDados.DataSet.IsEmpty) Then
      begin
           With ppReport1 do
            begin
                 lblPeriodo.Caption := 'PERÍODO : '+edtDTINIC.Text + ' À '+ edtDTFINA.Text;
                 if (sedDia.Value > 0) Then
                    lblDia.Caption := 'VENCIMENTO DIA: '+ sedDia.Text
                 Else
                    lblDia.Caption := '';
                 PrintReport;
            End;
      End;
end;

procedure TfrmRelListaInadimplentes.cmbGruposEnter(Sender: TObject);
begin
     LimparRotulo;
end;

procedure TfrmRelListaInadimplentes.edtDTINICEnter(Sender: TObject);
begin
     LimparRotulo;
end;

procedure TfrmRelListaInadimplentes.edtDTFINAEnter(Sender: TObject);
begin
     LimparRotulo;
end;

procedure TfrmRelListaInadimplentes.LimparRotulo;
begin
     dmDados.cdsListaClientes.close;
     lblRegistros.Caption := 'Registro(s): ';
end;

procedure TfrmRelListaInadimplentes.btnExcelClick(Sender: TObject);
Var
     Excel : Variant;
     Linha : Integer;
     M_ARQEXC : String;
     M_VLPAGO, M_VLDEBI : Double;
begin
 If (dmDados.cdsListaClientes.Active) and not (dmDados.cdsListaClientes.IsEmpty) Then
  begin
       if SaveDialog1.Execute then
             M_ARQEXC := SaveDialog1.FileName
         Else
             Exit;
         //
         If uFuncoes.Empty(M_ARQEXC) Then
           Begin
              Application.MessageBox('Nome de arquivo em branco!!!',
                     'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              Exit;
           End;
     try
      try
          Screen.Cursor := crHourGlass;
          //
          Excel := CreateOleObject('Excel.Application');
          {Excel.Workbooks.Add;}
          Excel.WorkBooks.Open(ExtractFilePath( Application.ExeName )+'temp2.xls');
          //
          Excel.WorkBooks[1].Sheets[1].Cells[1,1]:= 'LISTA DE INADIMPLENTES ';
          Excel.WorkBooks[1].Sheets[1].Cells[2,1]:= 'PERÍODO : '+edtDTINIC.Text + ' À '+edtDTFINA.Text;
          Excel.WorkBooks[1].Sheets[1].Cells[3,1]:= 'EMISSÃO : '+DatetoStr(Date());
          if (sedDia.Value > 0) Then
             Excel.WorkBooks[1].Sheets[1].Cells[3,2]:= 'VENCIMENTO DIA : '+sedDia.Text;
          //
          Linha := 4;
          //
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,1]:= 'NOME';
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,2]:= 'CPF/CNPJ';
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,3]:= 'Nº. BOX';
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,4]:= 'GRUPO';
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,5]:= 'PARCELAS';
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,6]:= 'PC.PAGAS';
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,7]:= 'PC.ABERTAS';
          //
          Linha     := 5;
          M_VLPAGO  := 0;
          M_VLDEBI  := 0;
          //
          dmDados.cdsListaClientes.DisableControls;
          dmDados.cdsListaClientes.First;
          While not (dmDados.cdsListaClientes.eof) do
            begin
                 Excel.WorkBooks[1].Sheets[1].Cells[Linha,1]:= dmDados.cdsListaClientes.FieldByName('CDS_NOME').AsString;
                 Excel.WorkBooks[1].Sheets[1].Cells[Linha,2]:= dmDados.cdsListaClientes.FieldByName('CDS_CGCCPF').AsString;
                 Excel.WorkBooks[1].Sheets[1].Cells[Linha,3]:= dmDados.cdsListaClientes.FieldByName('CDS_NRBOX').AsString;
                 Excel.WorkBooks[1].Sheets[1].Cells[Linha,4] := dmDados.cdsListaClientes.FieldByName('CDS_NMGRUPO').AsString;
                 Excel.WorkBooks[1].Sheets[1].Cells[Linha,5] := dmDados.cdsListaClientes.FieldByName('CDS_QTPARC').AsInteger;
                 Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := dmDados.cdsListaClientes.FieldByName('CDS_QTPAGA').AsInteger;
                 Excel.WorkBooks[1].Sheets[1].Cells[Linha,7] := dmDados.cdsListaClientes.FieldByName('CDS_QTABERTAS').AsInteger;
                 //
                 M_VLPAGO  := M_VLPAGO + dmDados.cdsListaClientes.FieldByName('CDS_VLPAGO').AsFloat;
                 M_VLDEBI  := M_VLDEBI + dmDados.cdsListaClientes.FieldByName('CDS_VLDEBITO').AsFloat;
                 //
                 Linha     := Linha + 1;
                 dmDados.cdsListaClientes.Next;
            End;
            //
            Linha     := Linha + 1;
          //
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,7] := 'TOTAL DEBITO : ';
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := FormatFloat('#,###,##0.#0',M_VLDEBI);
          //
          Excel.WorkBooks[1].SaveAs(M_ARQEXC);
          Excel.WorkBooks[1].Close;
          //
          dmDados.cdsListaClientes.First;
          dmDados.cdsListaClientes.EnableControls;
          //
       Finally
             Screen.Cursor := crDefault;
       End;
       Application.ProcessMessages;
       //
       Application.MessageBox('Arquivo gerado com sucesso!!!',
               'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       Except
           on Exc:Exception do
           begin
                dmDados.cdsListaClientes.EnableControls;
                //
                Application.MessageBox(PChar('Error ao tentar gerar arquivo.'+#13
                    + Exc.Message),
                  'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           End;
       End;
  End;
end;

procedure TfrmRelListaInadimplentes.edtDTINICKeyPress(Sender: TObject;
  var Key: Char);
begin
      if (key = #13) and not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTINIC.Text)) Then
        begin
             key := #0;
             edtDTFINA.SetFocus;
        End;
end;

procedure TfrmRelListaInadimplentes.edtDTFINAKeyPress(Sender: TObject;
  var Key: Char);
begin
      if (key = #13) and not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTFINA.Text)) Then
        begin
             key := #0;
             cmbGrupos.SetFocus;
        End;
end;

procedure TfrmRelListaInadimplentes.cmbGruposKeyPress(Sender: TObject;
  var Key: Char);
begin
      if (key = #13) and not uFuncoes.Empty(uFuncoes.RemoveChar(cmbGrupos.Text)) Then
        begin
             key := #0;
             sedDia.SetFocus;
        End;
end;

procedure TfrmRelListaInadimplentes.sedDiaEnter(Sender: TObject);
begin
     LimparRotulo;
end;

procedure TfrmRelListaInadimplentes.sedDiaKeyPress(Sender: TObject;
  var Key: Char);
begin
      If not( key in['0'..'9',#8, #13] ) then
         key:=#0;
      //   
      if (key = #13) Then
        begin
             key := #0;
             if (btnConsulta.Enabled) Then
               btnConsulta.SetFocus;
        End;

end;

procedure TfrmRelListaInadimplentes.VisualizarCarta(iCliente: Integer; aTipo : String);
Var
      MSWord: Variant;
      i : integer;
      M_DATA : String;
begin
      If not FileExists(ExtractFilePath( Application.ExeName )+'modelo.DOC') Then
          raise Exception.Create('Arquivo de modelo de carta não encontrado.');

      PostMessage(FindWindow(nil, 'TEMP - Microsoft Word'), WM_CLOSE,0,0);
      PostMessage(FindWindow(nil, 'INFOG2.DOC - Microsoft Word'), WM_CLOSE,0,0);
      If (fileexists(ExtractFilePath( Application.ExeName )+'INFOG2.DOC')) Then
          DeleteFile(ExtractFilePath( Application.ExeName )+'INFOG2.DOC');
      MSWord:= CreateOleObject ('Word.Basic'); //cria o objeto
      If (aTipo = 'V') Then
         MSWord.AppShow; //mostra o word
      MSWord.FileOpen(ExtractFilePath( Application.ExeName )+'modelo.DOC');
      //
      MSWord.Font('Times New Roman'); //muda a fonte usada
      MSWord.FontSize(13); //muda o tamanho da fonte
      MSWord.LeftPara;
      MSWord.bold(false);
      MSWord.insert(#13);
      MSWord.insert('Ilmo(a) Sr.(a)');
      MSWord.FontSize(12);
      MSWord.bold; //coloca negrito
      MSWord.insert(#13+dmDados.cdsListaClientesCDS_NOME.AsString);
      MSWord.bold(false);
      MSWord.insert(#13+dmDados.cdsListaClientesCDS_NRBOX.AsString +' : Condômino do Shopping da Cidade');
      MSWord.FontSize(13); //muda o tamanho da fonte
      MSWord.insert(#13+'Teresina (PI)');
      MSWord.insert(#13);
      MSWord.FontSize(14);
      MSWord.bold; //coloca negrito
      MSWord.underline;//sublina
      MSWord.CenterPara; //alinha ao centro
      MSWord.insert('C O N V O C A Ç Ã O'); //Escreve algo
      MSWord.underline(false);//sublina
      MSWord.bold(false);
      MSWord.insert(#13);
      MSWord.FontSize(13);
      //
      MSWord.JustifyPara;
      MSWord.insert('Pela presente levamos ao conhecimento de V.Sa., que existem taxa(s)em aberto de condomínio referente ao contrato de comodato que ainda  não foram pagos até esta data.');
      MSWord.insert(#13+'Assim solicitamos que a situação seja regularizada no prazo de 5 dias, sob pena de ser compelido a desocupar o Box ocupado no prazo previsto '
                              +'no contrato de comodato modal que na clausula Sétima, Parágrafo único, a seguir descrito "Não sendo adimplido o pagamento das despesas referidas '
                              +'nesta cláusula será rescindido o presente contrato e o (a) comodatário (a) será imediatamente substituído por outro cujo nome será selecionado (a) '
                              +'pelo Município de Teresina PI, obedecendo a critérios estabelecidos no contrato de gestão". ');
      MSWord.insert(#13+'Informamos que os juros dos boletos vencidos estão sendo cobrados, portanto o pagamento em dias '
                              +'garante seu desconto de 10%. O Instituto de Negócios do Piauí - Inpi, estará negociando seu debito'
                              +' dos boletos em atraso até dia '+datetoStr(uFuncoes.Datafinal(Date(), 5)) +'. Qualquer informação procurar a administração do Shopping '
                              +'no 2º Piso.');
      //
      {MSWord.Font('Times New Roman'); //muda a fonte usada
      MSWord.FontSize(13); //muda o tamanho da fonte}
      MSWord.bold; //coloca negrito
      MSWord.insert(#13+'Caso já tenha regularizado o pagamento favor desconsiderar.');
      MSWord.bold(false); //coloca negrito
      //
      MSWord.ActiveDocument.Content.Find.Execute(FindText := '<0001>', ReplaceWith := '<abcd>');
      MSWord.ActiveDocument.Content.Find.Execute(FindText := '<0002>', ReplaceWith := '<efgh>');
      //
      MSWord.LeftPara;
      MSWord.insert(#13);
      MSWord.insert(#13+#9+#9+#9+#9+#9+uFuncoes.Replicate(' ',8)+'Teresina, '+uFuncoes.DataExtenso(Date));
      //MSWord.LeftPara;
      //MSWord.insert(#13);
      MSWord.insert(#13+'Atenciosamente,');
      //
      MSWord.FileSaveAs(ExtractFilePath( Application.ExeName )+'INFOG2.DOC', 1); //Salva o arquivo
      //
      If (aTipo = 'I') Then
      begin
          //MsWord.ActiveDocument.PrintOut(Copies := 1);
          MsWord.FilePrint;
          PostMessage(FindWindow(nil, 'INFOG2 [Modo de Compatibilidade] - Microsoft Word'), WM_CLOSE,0,0);
      End;
end;

procedure TfrmRelListaInadimplentes.btnCartaoClick(Sender: TObject);
begin
    If not (dmDados.cdsListaClientes.IsEmpty) Then
    begin
       btnCartao.Enabled := false;
       try
          if (rgModeloCartas.ItemIndex = 0) Then
              VisualizarCarta2(dmDados.cdsListaClientesCDS_CODIGO.AsInteger, 'V');
          if (rgModeloCartas.ItemIndex = 1) Then
              VisualizarCartaRecisao2(dmDados.cdsListaClientesCDS_CODIGO.AsInteger, 'V');
       Finally
           btnCartao.Enabled := true;
       End;
       Application.ProcessMessages;
       //
       grdConsultar.SetFocus;
    End;
end;

procedure TfrmRelListaInadimplentes.btnImpCartaClick(Sender: TObject);
Var
   aModelo : String;
begin
    If not (dmDados.cdsListaClientes.IsEmpty) Then
     begin
       Case (rgModeloCartas.ItemIndex) of
          0 : aModelo := 'Convocação';
          1 : aModelo := 'Rescisão';
       End;
       //
       If Application.MessageBox(PChar('Imprimir todas as cartas modelo '+aModelo+'?'),
        'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
         begin
            btnImpCarta.Enabled := false;
            Panel1.Enabled      := False;
            try
               With dmDados.cdsListaClientes do
               begin
                  DisableControls;
                  First;
                  While not (Eof) do
                    begin 
                          if (rgModeloCartas.ItemIndex = 0) Then
                               VisualizarCarta2(dmDados.cdsListaClientesCDS_CODIGO.AsInteger, 'I');
                          if (rgModeloCartas.ItemIndex = 1) Then
                               VisualizarCartaRecisao2(dmDados.cdsListaClientesCDS_CODIGO.AsInteger, 'I');
                          //
                          Next;
                    End;
                  First;
                  EnableControls;
               End;
            Finally
                 btnImpCarta.Enabled := true;
                 Panel1.Enabled      := true;
            End;
            //
            Application.ProcessMessages;
            grdConsultar.SetFocus;
         End;
     End;
end;

procedure TfrmRelListaInadimplentes.VisualizarCartaRecisao(
  iCliente: Integer; aTipo: String);
Var
      MSWord: Variant;
      i : integer;
      M_DATA : String;
      M_QTMESE : Integer;
begin
      If not FileExists(ExtractFilePath( Application.ExeName )+'modelo2.DOC') Then
          raise Exception.Create('Arquivo de modelo de carta não encontrado.');
      PostMessage(FindWindow(nil, 'TEMP - Microsoft Word'), WM_CLOSE,0,0);
      PostMessage(FindWindow(nil, 'INFOG2.DOC - Microsoft Word'), WM_CLOSE,0,0);
      If (fileexists(ExtractFilePath( Application.ExeName )+'INFOG2.DOC')) Then
          DeleteFile(ExtractFilePath( Application.ExeName )+'INFOG2.DOC');
      MSWord:= CreateOleObject ('Word.Basic'); //cria o objeto
      If (aTipo = 'V') Then
         MSWord.AppShow; //mostra o word
      MSWord.FileOpen(ExtractFilePath( Application.ExeName )+'modelo2.DOC');
      //
      MSWord.Font('Times New Roman'); //muda a fonte usada
      MSWord.FontSize(13); //muda o tamanho da fonte
      MSWord.LeftPara;
      MSWord.insert(#13);
      MSWord.insert(#9+#9+#9+#9+#9+uFuncoes.Replicate(' ',8)+ 'Teresina, '+uFuncoes.DataExtenso(Date));
      MSWord.insert(#13);
      //
      MSWord.LeftPara;
      MSWord.bold(false);
      MSWord.insert(#13);
      MSWord.insert('Ilmo(a) Sr.(a)');
      MSWord.FontSize(12);
      MSWord.bold; //coloca negrito
      MSWord.insert(#13+dmDados.cdsListaClientesCDS_NOME.AsString);
      MSWord.bold(false);
      MSWord.insert(#13+dmDados.cdsListaClientesCDS_NRBOX.AsString +' : Condômino do Shopping da Cidade');
      MSWord.FontSize(13); //muda o tamanho da fonte
      MSWord.insert(#13+'Teresina (PI)');
      MSWord.insert(#13);
      MSWord.insert(#13);
      MSWord.bold; //coloca negrito
      MSWord.LeftPara;//alinha ao centro
      MSWord.insert('Ref. Notificação Rescisão do Contrato. '); //Escreve algo
      MSWord.bold(false);
      MSWord.insert(#13);
      MSWord.insert(#13);
      MSWord.FontSize(13);
      //
      M_QTMESE := dmDados.cdsListaClientesCDS_QTABERTAS.AsInteger;
      MSWord.JustifyPara;
      MSWord.insert('Tem sido observado pela Administração deste estabelecimento que V.Sa., não tem interesse em '
                    +'cumprir as normas internas haja vista já ter sido notificado  por várias vezes o não pagamento '
                    +'das mensalidades do seu contrato de locação.');
      MSWord.insert(#13+'Registra-se a inadimplência de V.Sa. com o pagamento das taxas de condomínio já se '
                    +'encontrando em atraso '+ uFuncoes.StrZero(dmDados.cdsListaClientesCDS_QTABERTAS.AsString,2));
                    If (M_QTMESE > 1) Then
                       MSWord.insert(' (' +NumeroParaExtenso(M_QTMESE)+')'+' meses.')
                    Else
                       MSWord.insert(' (' +NumeroParaExtenso(M_QTMESE)+')'+' mês.');

      MSWord.insert(#13+'Desta forma informamos que o contrato de comodato será rescindido e que V.Sa. deverá '
                    +'desocupar o imóvel no prazo máximo e improrrogável de 3 (três) dias, como determina Clausula '
                    +'Sexta Parágrafo Primeiro e Clausula Sétima do Contrato de Comodato Modal.');
      //
      {MSWord.Font('Times New Roman'); //muda a fonte usada
      MSWord.FontSize(13); //muda o tamanho da fonte}
      MSWord.bold; //coloca negrito
      MSWord.insert(#13+'Caso já tenha regularizado o pagamento favor desconsiderar.');
      MSWord.bold(false); //coloca negrito
      //
      MSWord.LeftPara;
      MSWord.insert(#13+'Cordialmente,');
      MSWord.insert(#13);
      MSWord.insert(#13);
      MSWord.insert(#13+'Luiz Antônio Teixeira Veloso');
      MSWord.insert(#13+'Pres. do Inpi.');
      //
      MSWord.FileSaveAs(ExtractFilePath( Application.ExeName )+'INFOG2.DOC', 1); //Salva o arquivo
      //
      If (aTipo = 'I') Then
      begin
          MsWord.FilePrint;
          PostMessage(FindWindow(nil, 'INFOG2 [Modo de Compatibilidade] - Microsoft Word'), WM_CLOSE,0,0);
      End;
end;

function TfrmRelListaInadimplentes.ConversaoRecursiva(N: LongWord): string;
begin
       case N of
                1..19:
                        Result := Unidades[N];
                20, 30, 40, 50, 60, 70, 80, 90:
                        Result := Dezenas[N div 10] + ' ';
                21..29, 31..39, 41..49, 51..59, 61..69, 71..79, 81..89, 91..99:
                        Result := Dezenas[N div 10] + ' e ' + ConversaoRecursiva(N mod 10);
                100, 200, 300, 400, 500, 600, 700, 800, 900:
                        Result := Centenas[N div 100] + ' ';
                101..199:
                        Result := ' cento e ' + ConversaoRecursiva(N mod 100);
                201..299, 301..399, 401..499, 501..599, 601..699, 701..799, 801..899, 901..999:
                        Result := Centenas[N div 100] + ' e ' + ConversaoRecursiva(N mod 100);
                1000..999999:
                        Result := ConversaoRecursiva(N div 1000) + ' mil ' + ConversaoRecursiva(N mod 1000);
                1000000..1999999:
                        Result := ConversaoRecursiva(N div 1000000) + ' milhão '+ ConversaoRecursiva(N mod 1000000);
                2000000..999999999:
                        Result := ConversaoRecursiva(N div 1000000) + ' milhões '+ ConversaoRecursiva(N mod 1000000);
                1000000000..1999999999:
                        Result := ConversaoRecursiva(N div 1000000000) + ' bilhão ' + ConversaoRecursiva(N mod 1000000000);
                2000000000..4294967295:
                        Result := ConversaoRecursiva(N div 1000000000) + ' bilhões ' + ConversaoRecursiva(N mod 1000000000);
        end;
end;

function TfrmRelListaInadimplentes.NumeroParaExtenso(
  parmNumero: Real): string;
begin
   if (parmNumero >= Min) and (parmNumero <= Max) then
        begin
       {Tratar reais}
                Result := ConversaoRecursiva(Round(Int(parmNumero)));
                if Round(Int(parmNumero)) = 1 then
                    Result := Result
                else
                    if Round(Int(parmNumero)) <> 0 then
                       Result := Result ;
                    {Tratar centavos}
                    if not(Frac(parmNumero) = 0.00) then
                    begin
                            if Round(Int(parmNumero)) <> 0 then
                                Result := Result + ' e ';
                                Result := Result + ConversaoRecursiva(Round(Frac(parmNumero) * 100));
                                if (Round(Frac(parmNumero) * 100) = 1) then
                                    Result := Result
                                    //+ centesimo
                                    else
                                            Result := Result
                                            //+ centesimos;
                                end;
                            end
                    else
                    raise ERangeError.CreateFmt('%g ' + ErrorString + ' %g..%g',[parmNumero, Min, Max]);
end;

procedure TfrmRelListaInadimplentes.VisualizarCarta2(iCliente: Integer;
  aTipo: String);
Var
      MSWord: Variant;
      i, iDias : integer;
      M_DATA : String;
      M_DTATUAL : Tdate;
begin
      If not FileExists(ExtractFilePath( Application.ExeName )+'modelo1.doc') Then
          raise Exception.Create('Arquivo de modelo de carta não encontrado.');

      PostMessage(FindWindow(nil, 'TEMP - Microsoft Word'), WM_CLOSE,0,0);
      PostMessage(FindWindow(nil, 'modelo1.DOC - Microsoft Word'), WM_CLOSE,0,0);
      If (fileexists(ExtractFilePath( Application.ExeName )+'INFOG2.DOC')) Then
          DeleteFile(ExtractFilePath( Application.ExeName )+'INFOG2.DOC');
      MSWord:= CreateOleObject('Word.Application'); //cria o objeto
      If (aTipo = 'V') Then
         MSWord.Visible := True; //mostra o word
      MSWord.Documents.Open(ExtractFIlePath(Application.ExeName) + 'modelo1.doc');

      //FileOpen(ExtractFilePath( Application.ExeName )+'modelo1.DOC');
      //
      M_DTATUAL := Date();
      //uFuncoes.Datafinal(Date(), 5);
      if (uFuncoes.NumeroDiadaSemana(DatetoStr(M_DTATUAL)) = 1) or (uFuncoes.NumeroDiadaSemana(DatetoStr(M_DTATUAL)) = 7) Then
       begin
          M_DTATUAL := uFuncoes.ProximoDiaUtil(M_DTATUAL);
          iDias := 4;
          M_DATA := datetoStr(uFuncoes.Datafinal(M_DTATUAL, iDias));
       End
      Else
          M_DATA := DatetoStr( Date() + 7);
          //datetoStr(uFuncoes.Datafinal(Date(), 7));
      MSWord.ActiveDocument.Content.Find.Execute(FindText := '<<NOME>>', ReplaceWith := dmDados.cdsListaClientesCDS_NOME.AsString);
      MSWord.ActiveDocument.Content.Find.Execute(FindText := '<<BOX>>', ReplaceWith  := dmDados.cdsListaClientesCDS_NRBOX.AsString);
      MSWord.ActiveDocument.Content.Find.Execute(FindText := '<<DATA>>', ReplaceWith := M_DATA);
      MSWord.ActiveDocument.Content.Find.Execute(FindText := '<<DATA2>>', ReplaceWith := 'Teresina, '+uFuncoes.DataExtenso(Date));
      //
      //MSWord.ActiveDocument.FileSaveAs(ExtractFilePath( Application.ExeName )+'modelo1.DOC', 1); //Salva o arquivo
      //
      If (aTipo = 'I') Then
      begin
          MsWord.ActiveDocument.PrintOut(Copies := 1);
          //MSWord.ActiveDocument.FileSaveAs(ExtractFilePath( Application.ExeName )+'INFOG2.DOC', 1); //Salva o arquivo
          MSWord.ActiveDocument.Content.Find.Execute(FindText := dmDados.cdsListaClientesCDS_NOME.AsString, ReplaceWith   := '<<NOME>>');
          MSWord.ActiveDocument.Content.Find.Execute(FindText := dmDados.cdsListaClientesCDS_NRBOX.AsString, ReplaceWith  := '<<BOX>>');
          MSWord.ActiveDocument.Content.Find.Execute(FindText := M_DATA, ReplaceWith := '<<DATA>>');
          MSWord.ActiveDocument.Content.Find.Execute(FindText := 'Teresina, '+uFuncoes.DataExtenso(Date), ReplaceWith := '<<DATA2>>');
          MSWord.ActiveDocument.Save;
          //MsWord.FilePrint;
          PostMessage(FindWindow(nil, 'modelo1 [Modo de Compatibilidade] - Microsoft Word'), WM_CLOSE,0,0);
      End;
end;

procedure TfrmRelListaInadimplentes.VisualizarCartaRecisao2(
  iCliente: Integer; aTipo: String);
Var
      MSWord: Variant;
      i, iDias, M_QTMESE : integer;
      M_DATA, M_MESES : String;
      M_DTATUAL : Tdate;
begin
      If not FileExists(ExtractFilePath( Application.ExeName )+'modelo2.doc') Then
          raise Exception.Create('Arquivo de modelo de carta não encontrado.');

      PostMessage(FindWindow(nil, 'TEMP - Microsoft Word'), WM_CLOSE,0,0);
      PostMessage(FindWindow(nil, 'modelo2.DOC - Microsoft Word'), WM_CLOSE,0,0);
      If (fileexists(ExtractFilePath( Application.ExeName )+'INFOG2.DOC')) Then
          DeleteFile(ExtractFilePath( Application.ExeName )+'INFOG2.DOC');
      MSWord:= CreateOleObject('Word.Application'); //cria o objeto
      If (aTipo = 'V') Then
         MSWord.Visible := True; //mostra o word
      MSWord.Documents.Open(ExtractFIlePath(Application.ExeName) + 'modelo2.doc');
      //
      M_DTATUAL := Date();
      //
      M_QTMESE := dmDados.cdsListaClientesCDS_QTABERTAS.AsInteger;
      M_MESES := uFuncoes.StrZero(dmDados.cdsListaClientesCDS_QTABERTAS.AsString,2);
      If (M_QTMESE > 1) Then
          M_MESES :=  M_MESES + ' (' +NumeroParaExtenso(M_QTMESE)+')'+' meses.'
      Else
          M_MESES :=  M_MESES + ' (' +NumeroParaExtenso(M_QTMESE)+')'+' mês.';
      MSWord.ActiveDocument.Content.Find.Execute(FindText := '<<NOME>>', ReplaceWith := dmDados.cdsListaClientesCDS_NOME.AsString);
      MSWord.ActiveDocument.Content.Find.Execute(FindText := '<<BOX>>', ReplaceWith  := dmDados.cdsListaClientesCDS_NRBOX.AsString);
      MSWord.ActiveDocument.Content.Find.Execute(FindText := '<<MESES>>', ReplaceWith := M_MESES);
      MSWord.ActiveDocument.Content.Find.Execute(FindText := '<<DATA>>', ReplaceWith := 'Teresina, '+uFuncoes.DataExtenso(Date));
      //
      //MSWord.ActiveDocument.FileSaveAs(ExtractFilePath( Application.ExeName )+'modelo1.DOC', 1); //Salva o arquivo
      //
      If (aTipo = 'I') Then
      begin
          MsWord.ActiveDocument.PrintOut(Copies := 1);
          //
          MSWord.ActiveDocument.Content.Find.Execute(FindText := dmDados.cdsListaClientesCDS_NOME.AsString, ReplaceWith := '<<NOME>>');
          MSWord.ActiveDocument.Content.Find.Execute(FindText := dmDados.cdsListaClientesCDS_NRBOX.AsString, ReplaceWith  := '<<BOX>>');
          MSWord.ActiveDocument.Content.Find.Execute(FindText := M_MESES, ReplaceWith := '<<MESES>>');
          MSWord.ActiveDocument.Content.Find.Execute(FindText := 'Teresina, '+uFuncoes.DataExtenso(Date), ReplaceWith := '<<DATA>>');
          MSWord.ActiveDocument.Save;
          //MsWord.FilePrint;
          PostMessage(FindWindow(nil, 'modelo2 [Modo de Compatibilidade] - Microsoft Word'), WM_CLOSE,0,0);
      End;
end;

end.
