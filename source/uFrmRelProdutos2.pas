unit uFrmRelProdutos2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBXpress, FMTBcd, ppModule,
  raCodMod, ppBands, ppVar, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, DB, Provider, DBClient,
  SqlExpr, RpBase, RpSystem, RpDefine, RpRave, RpCon, RpConDS, VDODmPrinter;

type
  TfrmRelProdutos2 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cmbNMLOJA: TComboBox;
    cmbMostrarEstoque: TComboBox;
    cmbSomEstoque: TComboBox;
    cmbValor: TComboBox;
    Panel2: TPanel;
    BtImprimir: TBitBtn;
    BtSair: TBitBtn;
    dstProdutos: TSQLDataSet;
    cdsDados: TClientDataSet;
    cdsDadosPRO_NRITEM: TIntegerField;
    cdsDadosPRO_NMPROD: TStringField;
    cdsDadosPRO_NMABRE: TStringField;
    cdsDadosPRO_NMTRIB: TStringField;
    cdsDadosPRO_CDPROD: TStringField;
    cdsDadosPRO_CDUNID: TStringField;
    cdsDadosPRO_QTESTO: TFloatField;
    cdsDadosPRO_VALOR: TCurrencyField;
    dspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    dsProdutos: TDataSource;
    ppDBProdutos: TppDBPipeline;
    ppRelProdutos: TppReport;
    dstProdutosPRO_CODIGO: TStringField;
    dstProdutosPRO_DESCRICAO: TStringField;
    dstProdutosFOR_FANTASIA: TStringField;
    dstProdutosPRO_VLCOMPRA: TFMTBCDField;
    dstProdutosPRO_VLVENDA: TFMTBCDField;
    dstProdutosUNI_CODIGO: TStringField;
    dstProdutosTRI_CODIGO: TIntegerField;
    dstProdutosTRI_DESCRICAO: TStringField;
    dstProdutosEST_QUANTIDADE: TFMTBCDField;
    cdsProdutosPRO_CODIGO: TStringField;
    cdsProdutosPRO_DESCRICAO: TStringField;
    cdsProdutosFOR_FANTASIA: TStringField;
    cdsProdutosPRO_VLCOMPRA: TFMTBCDField;
    cdsProdutosPRO_VLVENDA: TFMTBCDField;
    cdsProdutosUNI_CODIGO: TStringField;
    cdsProdutosTRI_CODIGO: TIntegerField;
    cdsProdutosTRI_DESCRICAO: TStringField;
    cdsProdutosEST_QUANTIDADE: TFMTBCDField;
    cdsProdutosPRO_SUBTOTVENDA: TCurrencyField;
    cdsProdutosPRO_SUBTOTCOMPRA: TCurrencyField;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    RvDataSetConnection1: TRvDataSetConnection;
    ppHeaderBand1: TppHeaderBand;
    ppDBImage1: TppDBImage;
    ppLine3: TppLine;
    ppLabel8: TppLabel;
    ppLabel3: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    txtValor: TppLabel;
    ppLabel13: TppLabel;
    txtRazao: TppLabel;
    txtEndereco: TppLabel;
    txtCNPJ: TppLabel;
    txtMunicipio: TppLabel;
    txtInscEstadual: TppLabel;
    ppLine1: TppLine;
    pplblSubTotal: TppLabel;
    pplbl_Estoque: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBEstoque: TppDBText;
    ppDBValor: TppDBText;
    ppDBSubTotal: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine5: TppLine;
    ppLabel14: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel15: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBCValor: TppDBCalc;
    ppDBCSubtotal: TppDBCalc;
    ppSummaryBand1: TppSummaryBand;
    ppLabel16: TppLabel;
    pplbl_TOTESTOQUE: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppDBCalcEstoque: TppDBCalc;
    ppLine2: TppLine;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    raCodeModule1: TraCodeModule;
    btArquivo: TBitBtn;
    cbxMatricial: TCheckBox;
    procedure BtSairClick(Sender: TObject);
    procedure BtImprimirClick(Sender: TObject);
    procedure cdsProdutosCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btArquivoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
      procedure LOJAS;
      procedure DADOS_LOJA;
      procedure MATRICIAL;
      procedure MATRICIAL_NOVO;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProdutos2: TfrmRelProdutos2;
  M_NMRAZA, M_ENDERE, M_NMMUNI, M_NRCNPJ, M_INSEST : String;

implementation

uses Udm, udmConsulta, uFuncoes, UFrmAdmin, uFrmPreviewMatricial;

{$R *.dfm}

procedure TfrmRelProdutos2.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmRelProdutos2.DADOS_LOJA;
begin
     dm.CdsEmpresas.Close;
     With dm.SdsEmpresas do
     Begin
          Active := False;
          CommandText := 'SELECT * FROM EMPRESAS Where (EMP_CODIGO = :pCODIGO)';
          Params.ParamByName('pCODIGO').AsInteger := uFuncoes.CDLOJA(cmbNMLOJA.Text);
          Active := True;
     End;
     dm.CdsEmpresas.Open;
     //
     M_NMRAZA := dm.CdsEmpresas.FieldByName('EMP_RAZAO').AsString;
     M_ENDERE := dm.CdsEmpresas.FieldByName('EMP_ENDERECO').AsString + ' -  Nº. '+dm.CdsEmpresas.FieldByName('EMP_NUMERO').AsString;
     M_NMMUNI := dm.CdsEmpresas.FieldByName('EMP_NMCIDADE').AsString;
     M_NRCNPJ := dm.CdsEmpresas.FieldByName('EMP_CNPJ').AsString;
end;

procedure TfrmRelProdutos2.LOJAS;
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

procedure TfrmRelProdutos2.BtImprimirClick(Sender: TObject);
Var
  TD : TTransactionDesc;
begin
     If uFuncoes.Empty(cmbNMLOJA.Text) Then
     Begin
          Application.MessageBox('Selecione a loja!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbNMLOJA.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(cmbMostrarEstoque.Text) Then
     Begin
          Application.MessageBox('Selecione mostrar estoque!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbMostrarEstoque.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(cmbSomEstoque.Text) Then
     Begin
          Application.MessageBox('Selecione mostrar estoque!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbSomEstoque.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(cmbValor.Text) Then
     Begin
          Application.MessageBox('Selecione qual campo deseja imprimir!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbValor.SetFocus;
          Exit;
     End;
     //
   If (cbxMatricial.Checked = false) Then
   begin
     Try
          BtImprimir.Enabled := False;
          // Inicia um transação no BD
           {TD.TransactionID  := StrtoInt(UFrmAdmin.M_CDUSUA);
           TD.IsolationLevel := xilREADCOMMITTED;
           Dm.SqlAdmin.StartTransaction(TD);}
           Dm.Start;
           //
           cdsProdutos.Close;
           With dstProdutos do
           Begin
                Active := False;
                If (cmbSomEstoque.Text = 'SIM') Then
                Begin
                   Commandtext := 'Select P.PRO_CODIGO, P.PRO_DESCRICAO, P.PRO_VLCOMPRA, '+
                               ' (select F.FOR_FANTASIA from FORNECEDORES F Where (F.FOR_CODIGO = P.FOR_CODIGO)) as FOR_FANTASIA, ' +
                               'P.PRO_VLVENDA, P.UNI_CODIGO, P.TRI_CODIGO, '+
                               'E.EST_QUANTIDADE, E.EST_CODIGOLOJA, '+
                               '(Select TR.TRI_DESCRICAO from TRIBUTACAO TR Where (TR.TRI_CODIGO = P.TRI_CODIGO)) AS TRI_DESCRICAO '+
                               'from PRODUTOS P '+
                               'INNER join ESTOQUE E ON P.PRO_CODIGO = E.PRO_CODIGO '+
                               'Where (E.EST_CODIGOLOJA = :pLOJA) AND (E.EST_QUANTIDADE > 0)';
                End
                Else
                Begin
                   Commandtext := 'Select P.PRO_CODIGO, P.PRO_DESCRICAO, P.PRO_VLCOMPRA, '+
                               ' (select F.FOR_FANTASIA from FORNECEDORES F Where (F.FOR_CODIGO = P.FOR_CODIGO)) as FOR_FANTASIA, '+
                               'P.PRO_VLVENDA, P.UNI_CODIGO, P.TRI_CODIGO, '+
                               'E.EST_QUANTIDADE, E.EST_CODIGOLOJA, '+
                               '(Select TR.TRI_DESCRICAO from TRIBUTACAO TR Where (TR.TRI_CODIGO = P.TRI_CODIGO)) AS TRI_DESCRICAO '+
                               'from PRODUTOS P '+
                               'INNER join ESTOQUE E ON P.PRO_CODIGO = E.PRO_CODIGO '+
                               'Where (E.EST_CODIGOLOJA = :pLOJA)';
                End;
                //
                Params.ParamByName('pLOJA').AsInteger  := uFuncoes.CDLOJA(cmbNMLOJA.Text);
                Active := True;
           End;
           cdsProdutos.Open;
           //
           With ppRelProdutos do
           Begin
                DADOS_LOJA;
                txtRazao.caption     := M_NMRAZA;
                txtEndereco.Caption  := M_ENDERE;
                txtMunicipio.caption := M_NMMUNI;
                txtCNPJ.caption      := uFuncoes.FormataCNPJ(M_NRCNPJ);
                txtInscEstadual.caption  := '';
                //
                If (cmbMostrarEstoque.Text = 'SIM') Then
                Begin
                     pplbl_Estoque.Caption := 'ESTOQUE';
                     ppDBEstoque.DataField := 'EST_QUANTIDADE';
                     //
                     pplbl_TOTESTOQUE.Visible := True;
                     ppDBCalcEstoque.Visible  := True;
                     //
                     txtValor.Left       := 6.4375;
                     pplblSubTotal.Left  := 7.1667;
                     //
                     ppDBValor.Left      := 6.9271;
                     ppDBSubTotal.Left   := 7.1562;
                End
                Else
                Begin
                     pplbl_Estoque.Caption := '';
                     ppDBEstoque.DataField := '';
                     //
                     pplbl_TOTESTOQUE.Visible := False;
                     ppDBCalcEstoque.Visible  := False;
                     //
                     txtValor.Left       := 5.9271;
                     pplblSubTotal.Left  := 6.6979;
                     //
                     ppDBValor.Left      := 6.4167;
                     ppDBSubTotal.Left   := 6.6771;
                End;
                //
                If (cmbValor.Text = 'VENDA') Then
                Begin
                    txtValor.Caption    := 'VL.VENDA';
                    ppDBValor.DataField := 'PRO_VLVENDA';
                    ppDBSubTotal.DataField := 'PRO_SUBTOTVENDA';
                    //
                    ppDBCValor.DataField     := 'PRO_VLVENDA';
                    ppDBCSubtotal.DataField  := 'PRO_SUBTOTVENDA';
                    //
                    ppDBCalc5.DataField     := 'PRO_VLVENDA';
                    ppDBCalc6.DataField  := 'PRO_SUBTOTVENDA';
                End
                Else
                begin
                    txtValor.Caption := 'VL.COMPRA';
                    ppDBValor.DataField := 'PRO_VLCOMPRA';
                    ppDBSubTotal.DataField := 'PRO_SUBTOTCOMPRA';
                    ppDBCValor.DataField     := 'PRO_VLCOMPRA';
                    ppDBCSubtotal.DataField  := 'PRO_SUBTOTCOMPRA';
                    //
                    ppDBCalc5.DataField     := 'PRO_VLCOMPRA';
                    ppDBCalc6.DataField     := 'PRO_SUBTOTCOMPRA';
                End;
                //
                PrintReport;
                //
           End;
           // Grava
           //Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
           Dm.Comit(Dm.Transc);
           BtImprimir.Enabled := True;
     Except
        on Exc:Exception do
        begin
              Application.MessageBox(PChar('Error ao tentar gerar relatorio!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                //  Cancelar transação no BD.
                //Dm.SqlAdmin.Rollback(TD);
                BtImprimir.Enabled := True;
                Dm.Rollback;
        End;
     End;
   End
   Else
       MATRICIAL_NOVO;
       //MATRICIAL;
end;

procedure TfrmRelProdutos2.cdsProdutosCalcFields(DataSet: TDataSet);
begin
      cdsProdutos.FieldByName('PRO_SUBTOTVENDA').AsCurrency  :=
         cdsProdutos.FieldByName('EST_QUANTIDADE').AsFloat *
         cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency;
      cdsProdutos.FieldByName('PRO_SUBTOTCOMPRA').AsCurrency :=
         cdsProdutos.FieldByName('EST_QUANTIDADE').AsFloat *
         cdsProdutos.FieldByName('PRO_VLCOMPRA').AsCurrency;
end;

procedure TfrmRelProdutos2.FormShow(Sender: TObject);
begin
      LOJAS;
end;

procedure TfrmRelProdutos2.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key =#13 then
  begin
    key :=#0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmRelProdutos2.btArquivoClick(Sender: TObject);
Var
    M_NMARQU : textfile;
    W_NMARQU : String;
    M_NRITEM, M_NMDESC, M_DESCAB, M_CDUNID, M_CDPROD, M_CDTRIB : String;
    M_ESTOQU, M_VALOR, M_SUBTOT, M_SOMAQT,M_PARVAL, M_PARSUB : double;
    M_LINHA, M_ITENS, M_NRPAGI, M_QTLINH : integer;
    M_CAMINH, M_NMFILE : String;
begin
    //
     If uFuncoes.Empty(cmbNMLOJA.Text) Then
     Begin
          Application.MessageBox('Selecione a loja!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbNMLOJA.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(cmbMostrarEstoque.Text) Then
     Begin
          Application.MessageBox('Selecione mostrar estoque!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbMostrarEstoque.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(cmbSomEstoque.Text) Then
     Begin
          Application.MessageBox('Selecione mostrar estoque!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbSomEstoque.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(cmbValor.Text) Then
     Begin
          Application.MessageBox('Selecione qual campo deseja imprimir!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbValor.SetFocus;
          Exit;
     End;
     //
     {If dm.SaveDialog1.Execute then
         W_NMARQU := dm.SaveDialog1.FileName
     Else
         Exit;}
     //
     {If uFuncoes.Empty(W_NMARQU) Then
     Begin
          Application.MessageBox('Nome de arquivo em branco!!!',
                   'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          btArquivo.SetFocus;
          Exit;
     End;}
     //
     Try
          btArquivo.Enabled := False;
          // Inicia um transação no BD
           TD.TransactionID  := StrtoInt(UFrmAdmin.M_CDUSUA);
           TD.IsolationLevel := xilREADCOMMITTED;
           Dm.SqlAdmin.StartTransaction(TD);
           //
           M_SOMAQT := 0;
           M_NRPAGI := 0;
           //
           cdsProdutos.Close;
           With dstProdutos do
           Begin
                Active := False;
                If (cmbSomEstoque.Text = 'SIM') Then
                Begin
                   Commandtext := 'Select P.PRO_CODIGO, P.PRO_DESCRICAO, F.FOR_FANTASIA, P.PRO_VLCOMPRA, '+
                               'P.PRO_VLVENDA, P.UNI_CODIGO, P.TRI_CODIGO, T.TRI_DESCRICAO,'+
                               'E.EST_QUANTIDADE, E.EST_CODIGOLOJA '+
                               'from PRODUTOS P '+
                               'INNER join ESTOQUE E ON P.PRO_CODIGO = E.PRO_CODIGO '+
                               'INNER join FORNECEDORES F ON F.FOR_CODIGO = P.FOR_CODIGO '+
                               'INNER join TRIBUTACAO   T ON T.TRI_CODIGO = P.TRI_CODIGO '+
                               'Where (E.EST_CODIGOLOJA = :pLOJA) AND (E.EST_QUANTIDADE > 0)';
                End
                Else
                Begin
                   Commandtext := 'Select P.PRO_CODIGO, P.PRO_DESCRICAO, F.FOR_FANTASIA, P.PRO_VLCOMPRA, '+
                               'P.PRO_VLVENDA, P.UNI_CODIGO, P.TRI_CODIGO, T.TRI_DESCRICAO, '+
                               'E.EST_QUANTIDADE, E.EST_CODIGOLOJA '+
                               'from PRODUTOS P '+
                               'INNER join ESTOQUE E ON P.PRO_CODIGO = E.PRO_CODIGO '+
                               'INNER join FORNECEDORES F ON F.FOR_CODIGO = P.FOR_CODIGO '+
                               'INNER join TRIBUTACAO   T ON T.TRI_CODIGO = P.TRI_CODIGO '+
                               'Where (E.EST_CODIGOLOJA = :pLOJA)';
                End;
                //
                Params.ParamByName('pLOJA').AsInteger  := uFuncoes.CDLOJA(cmbNMLOJA.Text);
                Active := True;
           End;
           cdsProdutos.Open;
           cdsProdutos.First;
           //
               DADOS_LOJA;
               //
               M_CAMINH := uFuncoes.PASTA_CUPOM(StrtoInt(UFrmAdmin.M_CDUSUA));
               //
               If (fileexists(M_CAMINH+'\impressora.txt')) then
                  M_CAMINH := uFuncoes.percorreArquivoTexto(M_CAMINH+'\impressora.txt')
               Else
               begin
                  M_NMFILE := 'PRODUTOS.TXT';
                  //
                  If (M_CAMINH = 'C:\') Then
                     M_CAMINH := M_CAMINH + M_NMFILE
                  Else
                     M_CAMINH := M_CAMINH+'\'+M_NMFILE;
               End;
               //
               AssignFile(M_NMARQU, M_CAMINH); // Impressora
               //AssignFile(M_NMARQU, W_NMARQU);
               Rewrite(M_NMARQU);             // Impressora
               //
               Write(M_NMARQU, CHR(15));
               //Writeln(M_NMARQU,Format('%137s',['x']));
               { salta duas linhas}
               Writeln(M_NMARQU);
               // Cabeçalho
               Writeln(M_NMARQU, Format('%-1s',  ['RAZAO SOCIAL : '+uFuncoes.RemoveAcentos(M_NMRAZA)]));
               Writeln(M_NMARQU, Format('%-2s',  ['ENDERECO     : '+uFuncoes.RemoveAcentos(M_ENDERE)]));
               Writeln(M_NMARQU, Format('%-8s',  ['MUNICIPIO    : '+uFuncoes.RemoveAcentos(M_NMMUNI)]));
               Writeln(M_NMARQU, Format('%-1s',  ['CNPJ         : '+uFuncoes.FormataCNPJ(M_NRCNPJ)]));
         //
         Writeln(M_NMARQU, Format('%-1s',[uFuncoes.Replicate('=',137)]));
         //
         Write(M_NMARQU, Format('%-6s', ['ITEM  '+' ']));
         Write(M_NMARQU, Format('%-40s',['DESCRICAO'+' ']));
         Write(M_NMARQU, Format('%-21s',['FORNECEDOR  '+' ']));
         Write(M_NMARQU, Format('%2s',  ['UN'+' ']));
         Write(M_NMARQU, Format('%-13s',['CODIGO        ']));
         Write(M_NMARQU, Format('%-21s',['TRIBUTACAO']));
         If (cmbMostrarEstoque.Text = 'SIM') Then
             Write(M_NMARQU, Format('%-8s', ['ESTOQUE']));
         If (cmbValor.Text = 'VENDA') Then
             Write(M_NMARQU, Format('%-11s', ['VALOR VENDA']))
         Else
             Write(M_NMARQU, Format('%-11s', ['  VL.COMPRA']));
         Writeln(M_NMARQU, Format('%12s',   ['  SUB-TOTAL']));
         Writeln(M_NMARQU, Format('%-1s',[uFuncoes.Replicate('-',137)]));
         //
         M_LINHA := 11;
         M_ITENS := 0;
         M_PARVAL := 0;
         M_PARSUB := 0;
         //
         While not (cdsProdutos.Eof) do
         Begin
             M_NRITEM := InttoStr(cdsProdutos.RecNo);
             M_NMDESC := copy(cdsProdutos.FieldByName('PRO_DESCRICAO').AsString,1,38);
             M_DESCAB := copy(cdsProdutos.FieldByName('FOR_FANTASIA').AsString,1,20);
             M_CDUNID := cdsProdutos.FieldByName('UNI_CODIGO').AsString;
             M_CDPROD := cdsProdutos.FieldByName('PRO_CODIGO').AsString;
             M_CDTRIB := cdsProdutos.FieldByName('TRI_DESCRICAO').AsString;
             M_ESTOQU := cdsProdutos.FieldByName('EST_QUANTIDADE').AsFloat;
             //
             If (cmbValor.Text = 'VENDA') Then
             begin
                M_VALOR  := cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency;
                M_SUBTOT := cdsProdutos.FieldByName('PRO_SUBTOTVENDA').AsCurrency;
                //
                M_PARVAL := M_PARVAL + M_VALOR;
                M_PARSUB := M_PARSUB + M_SUBTOT;
             End
             Else
             begin
                M_VALOR  := cdsProdutos.FieldByName('PRO_VLCOMPRA').AsCurrency;
                M_SUBTOT := cdsProdutos.FieldByName('PRO_SUBTOTCOMPRA').AsCurrency;
                //
                M_PARVAL := M_PARVAL + M_VALOR;
                M_PARSUB := M_PARSUB + M_SUBTOT;
             End;
             //
             //If (cmbMostrarEstoque.Text = 'SIM') Then
                 Write(M_NMARQU, Format('%-6s', [uFuncoes.StrZero(M_NRITEM,6)+' ']));
                 Write(M_NMARQU, Format('%-40s',[M_NMDESC+' ']));
                 //Write(M_NMARQU, Format('%-20s',[M_DESCAB+uFuncoes.Replicate(' ',20-length(M_DESCAB))+' ']));
                 Write(M_NMARQU, Format('%-21s',[M_DESCAB+uFuncoes.Replicate(' ',1)]));
                 If not uFuncoes.Empty(M_CDUNID) Then
                    Write(M_NMARQU, Format('%2s', [M_CDUNID+' ']))
                 Else
                    Write(M_NMARQU, Format('%2s', [uFuncoes.Replicate(' ',2)+' ']));
                 //
                 Write(M_NMARQU, Format('%-13s',[M_CDPROD+' ']));
                 If not uFuncoes.Empty(M_CDTRIB) Then
                     Write(M_NMARQU, Format('%-15s',[M_CDTRIB+' ']))
                 Else
                     Write(M_NMARQU, Format('%-15s',[uFuncoes.Replicate(' ',15)+' ']));
                 If (cmbMostrarEstoque.Text = 'SIM') Then
                     Write(M_NMARQU, Format('%10s',[FormatFloat('#,##0.#00',M_ESTOQU)+'   ']));
                 Write(M_NMARQU, Format('%11s',[FormatFloat('###,###,##0.#0',M_VALOR)+'  ']));
                 Writeln(M_NMARQU, Format('%10s',[FormatFloat('###,###,##0.#0',M_SUBTOT)+' ']));
             //
             M_SOMAQT := M_SOMAQT + M_ESTOQU;
             //
             M_LINHA := M_LINHA + 1;
             M_ITENS := M_ITENS + 1;
             //
             If (M_NRPAGI = 0) Then
                 M_QTLINH := 62
             Else
                 M_QTLINH := 60;
             If (M_LINHA > M_QTLINH) then
              begin
                   M_LINHA := 2;
                   M_NRPAGI := M_NRPAGI + 1;
                   // rodape
                   Writeln(M_NMARQU, uFuncoes.Replicate('=',137));
                   If (cmbMostrarEstoque.Text = 'SIM') Then
                   begin
                       Writeln(M_NMARQU, Format('%-101s',[uFuncoes.Replicate(' ',85)+'TOTAL ITENS....:'])
                                     +Format('%8s',  [InttoStr(M_ITENS)])+
                                     Format('%17s',[formatfloat('#,##0.00',M_PARVAL)])+ Format('%11s',[formatfloat('#,##0.00',M_PARSUB)]));
                       Writeln(M_NMARQU, Format('%-20s',[uFuncoes.Replicate(' ',85)+'TOTAL ESTOQUE..: '+FormatFloat('###,##0.#00', M_SOMAQT)]));
                   End
                   Else
                   begin
                        Write(M_NMARQU, Format('%98s',[uFuncoes.Replicate(' ',98)]));
                        Writeln(M_NMARQU, Format('%17s',[formatfloat('#,##0.00',M_PARVAL)])+ Format('%11s',[formatfloat('#,##0.00',M_PARSUB)]));
                   End;
                   //
                   Write(M_NMARQU, uFuncoes.Replicate(' ',125));
                   Writeln(M_NMARQU, Format('%-17s',['Pagina : '+ InttoStr(M_NRPAGI)]));
                   Writeln(M_NMARQU, uFuncoes.Replicate('=',137));
              End;
             cdsProdutos.Next;
         End;
         // rodape
         M_NRPAGI := M_NRPAGI + 1;
         Writeln(M_NMARQU, uFuncoes.Replicate('=',137));
         If (cmbMostrarEstoque.Text = 'SIM') Then
         begin
               Writeln(M_NMARQU, Format('%-101s',[uFuncoes.Replicate(' ',85)+'TOTAL ITENS....:'])
                          +Format('%8s',  [InttoStr(M_ITENS)])+
                           Format('%17s',[formatfloat('#,##0.00',M_PARVAL)])+ Format('%11s',[formatfloat('#,##0.00',M_PARSUB)]));
               Writeln(M_NMARQU, Format('%-20s',[uFuncoes.Replicate(' ',85)+'TOTAL ESTOQUE..: '+FormatFloat('###,##0.#00', M_SOMAQT)]));
         End
         Else
         begin
               Write(M_NMARQU, Format('%-79',[uFuncoes.Replicate(' ',79)]));
               Writeln(M_NMARQU, Format('%-8s', ['TOTAL ITENS....:'+InttoStr(M_ITENS)])+
                                 Format('%17s',[formatfloat('#,##0.00',M_PARVAL)])+ Format('%11s',[formatfloat('#,##0.00',M_PARSUB)]));
         End;
         //
         Write(M_NMARQU, uFuncoes.Replicate(' ',125));
         Writeln(M_NMARQU, Format('%-17s',['Pagina : '+ InttoStr(M_NRPAGI)]));
         Writeln(M_NMARQU, uFuncoes.Replicate('=',137));
         //
         System.Close(M_NMARQU);  // IMPRESSORA
         //CloseFile(M_NMARQU);
         //
         {Application.MessageBox(PChar('Arquivo gerado com sucesso!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);}
           // Grava
           Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
           btArquivo.Enabled := True;
           Close;
     Except
        on Exc:Exception do
        begin
              Application.MessageBox(PChar('Error ao tentar gerar relatorio!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                //  Cancelar transação no BD.
                Dm.SqlAdmin.Rollback(TD);
                btArquivo.Enabled := True;
        End;
     End;
end;

procedure TfrmRelProdutos2.MATRICIAL;
Var
    M_NMARQU : textfile;
    W_NMARQU : String;
    M_NRITEM, M_NMDESC, M_DESCAB, M_CDUNID, M_CDPROD, M_CDTRIB : String;
    M_ESTOQU, M_VALOR, M_SUBTOT, M_SOMAQT,M_PARVAL, M_PARSUB : double;
    M_LINHA, M_ITENS, M_NRPAGI, M_QTLINH : integer;
    M_CAMINH, M_NMFILE : String;
begin
     //
     Try
          btArquivo.Enabled := False;
          // Inicia um transação no BD
           TD.TransactionID  := StrtoInt(UFrmAdmin.M_CDUSUA);
           TD.IsolationLevel := xilREADCOMMITTED;
           Dm.SqlAdmin.StartTransaction(TD);
           //
           M_SOMAQT := 0;
           M_NRPAGI := 0;
           //
           cdsProdutos.Close;
           With dstProdutos do
           Begin
                Active := False;
                If (cmbSomEstoque.Text = 'SIM') Then
                Begin
                   Commandtext := 'Select P.PRO_CODIGO, P.PRO_DESCRICAO, F.FOR_FANTASIA, P.PRO_VLCOMPRA, '+
                               'P.PRO_VLVENDA, P.UNI_CODIGO, P.TRI_CODIGO, T.TRI_DESCRICAO,'+
                               'E.EST_QUANTIDADE, E.EST_CODIGOLOJA '+
                               'from PRODUTOS P '+
                               'INNER join ESTOQUE E ON P.PRO_CODIGO = E.PRO_CODIGO '+
                               'INNER join FORNECEDORES F ON F.FOR_CODIGO = P.FOR_CODIGO '+
                               'INNER join TRIBUTACAO   T ON T.TRI_CODIGO = P.TRI_CODIGO '+
                               'Where (E.EST_CODIGOLOJA = :pLOJA) AND (E.EST_QUANTIDADE > 0)';
                End
                Else
                Begin
                   Commandtext := 'Select P.PRO_CODIGO, P.PRO_DESCRICAO, F.FOR_FANTASIA, P.PRO_VLCOMPRA, '+
                               'P.PRO_VLVENDA, P.UNI_CODIGO, P.TRI_CODIGO, T.TRI_DESCRICAO, '+
                               'E.EST_QUANTIDADE, E.EST_CODIGOLOJA '+
                               'from PRODUTOS P '+
                               'INNER join ESTOQUE E ON P.PRO_CODIGO = E.PRO_CODIGO '+
                               'INNER join FORNECEDORES F ON F.FOR_CODIGO = P.FOR_CODIGO '+
                               'INNER join TRIBUTACAO   T ON T.TRI_CODIGO = P.TRI_CODIGO '+
                               'Where (E.EST_CODIGOLOJA = :pLOJA)';
                End;
                //
                Params.ParamByName('pLOJA').AsInteger  := uFuncoes.CDLOJA(cmbNMLOJA.Text);
                Active := True;
           End;
           cdsProdutos.Open;
           cdsProdutos.First;
           //
               DADOS_LOJA;
               //
               M_CAMINH := uFuncoes.PASTA_CUPOM(StrtoInt(UFrmAdmin.M_CDUSUA));
               //
               If (fileexists(M_CAMINH+'\NN.TXT')) then
                   DeleteFile(M_CAMINH+'\NN.TXT');
                  //M_CAMINH := uFuncoes.percorreArquivoTexto(M_CAMINH+'\impressora.txt')
               M_NMFILE := 'NN.TXT';
               //
               If (M_CAMINH = 'C:\') Then
                   M_CAMINH := M_CAMINH + M_NMFILE
               Else
                   M_CAMINH := M_CAMINH+'\'+M_NMFILE;
               //
               AssignFile(M_NMARQU, M_CAMINH); // Impressora
               //AssignFile(M_NMARQU, W_NMARQU);
               Rewrite(M_NMARQU);             // Impressora
               //
               Write(M_NMARQU, CHR(15));
               //Writeln(M_NMARQU,Format('%137s',['x']));
               { salta duas linhas}
               Writeln(M_NMARQU);
               // Cabeçalho
               Writeln(M_NMARQU, Format('%-1s',  ['RAZAO SOCIAL : '+uFuncoes.RemoveAcentos(M_NMRAZA)]));
               Writeln(M_NMARQU, Format('%-2s',  ['ENDERECO     : '+uFuncoes.RemoveAcentos(M_ENDERE)]));
               Writeln(M_NMARQU, Format('%-8s',  ['MUNICIPIO    : '+uFuncoes.RemoveAcentos(M_NMMUNI)]));
               Writeln(M_NMARQU, Format('%-1s',  ['CNPJ         : '+uFuncoes.FormataCNPJ(M_NRCNPJ)]));
         //
         Writeln(M_NMARQU, Format('%-1s',[uFuncoes.Replicate('=',137)]));
         //
         Write(M_NMARQU, Format('%-6s', ['ITEM  '+' ']));
         Write(M_NMARQU, Format('%-40s',['DESCRICAO'+' ']));
         Write(M_NMARQU, Format('%-21s',['FORNECEDOR  '+' ']));
         Write(M_NMARQU, Format('%2s',  ['UN'+' ']));
         Write(M_NMARQU, Format('%-13s',['CODIGO        ']));
         Write(M_NMARQU, Format('%-21s',['TRIBUTACAO']));
         If (cmbMostrarEstoque.Text = 'SIM') Then
             Write(M_NMARQU, Format('%-8s', ['ESTOQUE']));
         If (cmbValor.Text = 'VENDA') Then
             Write(M_NMARQU, Format('%-11s', ['VALOR VENDA']))
         Else
             Write(M_NMARQU, Format('%-11s', ['  VL.COMPRA']));
         Writeln(M_NMARQU, Format('%12s',   ['  SUB-TOTAL']));
         Writeln(M_NMARQU, Format('%-1s',[uFuncoes.Replicate('-',137)]));
         //
         M_LINHA := 11;
         M_ITENS := 0;
         M_PARVAL := 0;
         M_PARSUB := 0;
         //
         While not (cdsProdutos.Eof) do
         Begin
             M_NRITEM := InttoStr(cdsProdutos.RecNo);
             M_NMDESC := copy(cdsProdutos.FieldByName('PRO_DESCRICAO').AsString,1,38);
             M_DESCAB := copy(cdsProdutos.FieldByName('FOR_FANTASIA').AsString,1,20);
             M_CDUNID := cdsProdutos.FieldByName('UNI_CODIGO').AsString;
             M_CDPROD := cdsProdutos.FieldByName('PRO_CODIGO').AsString;
             M_CDTRIB := cdsProdutos.FieldByName('TRI_DESCRICAO').AsString;
             M_ESTOQU := cdsProdutos.FieldByName('EST_QUANTIDADE').AsCurrency;
             //
             If (cmbValor.Text = 'VENDA') Then
             begin
                M_VALOR  := cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency;
                M_SUBTOT := cdsProdutos.FieldByName('PRO_SUBTOTVENDA').AsCurrency;
                //
                M_PARVAL := M_PARVAL + M_VALOR;
                M_PARSUB := M_PARSUB + M_SUBTOT;
             End
             Else
             begin
                M_VALOR  := cdsProdutos.FieldByName('PRO_VLCOMPRA').AsCurrency;
                M_SUBTOT := cdsProdutos.FieldByName('PRO_SUBTOTCOMPRA').AsCurrency;
                //
                M_PARVAL := M_PARVAL + M_VALOR;
                M_PARSUB := M_PARSUB + M_SUBTOT;
             End;
             //
             //If (cmbMostrarEstoque.Text = 'SIM') Then
                 Write(M_NMARQU, Format('%-6s', [uFuncoes.StrZero(M_NRITEM,6)+' ']));
                 Write(M_NMARQU, Format('%-40s',[M_NMDESC+' ']));
                 //Write(M_NMARQU, Format('%-20s',[M_DESCAB+uFuncoes.Replicate(' ',20-length(M_DESCAB))+' ']));
                 Write(M_NMARQU, Format('%-21s',[M_DESCAB+uFuncoes.Replicate(' ',1)]));
                 If not uFuncoes.Empty(M_CDUNID) Then
                    Write(M_NMARQU, Format('%2s', [M_CDUNID+' ']))
                 Else
                    Write(M_NMARQU, Format('%2s', [uFuncoes.Replicate(' ',2)+' ']));
                 //
                 Write(M_NMARQU, Format('%-13s',[M_CDPROD+' ']));
                 If not uFuncoes.Empty(M_CDTRIB) Then
                     Write(M_NMARQU, Format('%-15s',[M_CDTRIB+' ']))
                 Else
                     Write(M_NMARQU, Format('%-15s',[uFuncoes.Replicate(' ',15)+' ']));
                 If (cmbMostrarEstoque.Text = 'SIM') Then
                     Write(M_NMARQU, Format('%10s',[FormatFloat('#,##0.000',M_ESTOQU)+'   ']));
                 Write(M_NMARQU, Format('%11s',[FormatFloat('###,###,##0.#0',M_VALOR)+'  ']));
                 Writeln(M_NMARQU, Format('%10s',[FormatFloat('###,###,##0.#0',M_SUBTOT)+' ']));
             //
             M_SOMAQT := M_SOMAQT + M_ESTOQU;
             //
             M_LINHA := M_LINHA + 1;
             M_ITENS := M_ITENS + 1;
             //
             If (M_NRPAGI = 0) Then
                 M_QTLINH := 62
             Else
                 M_QTLINH := 60;
             If (M_LINHA > M_QTLINH) then
              begin
                   M_LINHA := 2;
                   M_NRPAGI := M_NRPAGI + 1;
                   // rodape
                   Writeln(M_NMARQU, uFuncoes.Replicate('=',137));
                   If (cmbMostrarEstoque.Text = 'SIM') Then
                   begin
                       Writeln(M_NMARQU, Format('%-101s',[uFuncoes.Replicate(' ',85)+'TOTAL ITENS....:'])
                                     +Format('%8s',  [InttoStr(M_ITENS)])+
                                     Format('%17s',[formatfloat('#,##0.00',M_PARVAL)])+ Format('%11s',[formatfloat('#,##0.00',M_PARSUB)]));
                       Writeln(M_NMARQU, Format('%-20s',[uFuncoes.Replicate(' ',85)+'TOTAL ESTOQUE..: '+FormatFloat('###,##0.#00', M_SOMAQT)]));
                   End
                   Else
                   begin
                        Write(M_NMARQU, Format('%98s',[uFuncoes.Replicate(' ',98)]));
                        Writeln(M_NMARQU, Format('%17s',[formatfloat('#,##0.00',M_PARVAL)])+ Format('%11s',[formatfloat('#,##0.00',M_PARSUB)]));
                   End;
                   //
                   Write(M_NMARQU, uFuncoes.Replicate(' ',125));
                   Writeln(M_NMARQU, Format('%-17s',['Pagina : '+ InttoStr(M_NRPAGI)]));
                   Writeln(M_NMARQU, uFuncoes.Replicate('=',137));
              End;
             cdsProdutos.Next;
         End;
         // rodape
         M_NRPAGI := M_NRPAGI + 1;
         Writeln(M_NMARQU, uFuncoes.Replicate('=',137));
         If (cmbMostrarEstoque.Text = 'SIM') Then
         begin
               Writeln(M_NMARQU, Format('%-101s',[uFuncoes.Replicate(' ',85)+'TOTAL ITENS....:'])
                          +Format('%8s',  [InttoStr(M_ITENS)])+
                           Format('%17s',[formatfloat('#,##0.00',M_PARVAL)])+ Format('%11s',[formatfloat('#,##0.00',M_PARSUB)]));
               Writeln(M_NMARQU, Format('%-20s',[uFuncoes.Replicate(' ',85)+'TOTAL ESTOQUE..: '+FormatFloat('###,##0.#00', M_SOMAQT)]));
         End
         Else
         begin
               Write(M_NMARQU, Format('%-79',   [uFuncoes.Replicate(' ',79)]));
               Write(M_NMARQU, Format('%-8s',   ['TOTAL ITENS....:'+InttoStr(M_ITENS)])+Format('%-87s',[uFuncoes.Replicate(' ',87)]));
               Writeln(M_NMARQU, Format('%-12s', [formatfloat('#,##0.00',M_PARVAL)])+ Format('%-10s',  [formatfloat('#,##0.00',M_PARSUB)]));
         End;
         //
         Write(M_NMARQU, uFuncoes.Replicate(' ',125));
         Writeln(M_NMARQU, Format('%-17s',['Pagina : '+ InttoStr(M_NRPAGI)]));
         Writeln(M_NMARQU, uFuncoes.Replicate('=',137));
         //
         CloseFile(M_NMARQU);
         // Grava
         Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
         btArquivo.Enabled := True;
         //
         Try
                Application.CreateForm(TfrmPreviewMatr, frmPreviewMatr);
                frmPreviewMatr.mmoArquivo.Lines.LoadFromFile(M_CAMINH);
                frmPreviewMatr.ShowModal;
         Finally
                frmPreviewMatr.Release;
                frmPreviewMatr := nil;
         End;
         //Close;
     Except
        on Exc:Exception do
        begin
              Application.MessageBox(PChar('Error ao tentar gerar relatorio!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                //  Cancelar transação no BD.
                Dm.SqlAdmin.Rollback(TD);
                btArquivo.Enabled := True;
        End;
     End;
end;

procedure TfrmRelProdutos2.BitBtn1Click(Sender: TObject);
begin
     MATRICIAL;
end;

procedure TfrmRelProdutos2.MATRICIAL_NOVO;
Var
    M_NMARQU : textfile;
    W_NMARQU : String;
    M_NRITEM, M_NMDESC, M_DESCAB, M_CDUNID, M_CDPROD, M_CDTRIB : String;
    M_ESTOQU, M_VALOR, M_SUBTOT, M_SOMAQT,M_PARVAL, M_PARSUB : double;
    M_LINHA, M_ITENS, M_NRPAGI, M_QTLINH : integer;
    M_CAMINH, M_NMFILE : String;
    //
    VDOImpressora : TVDODmPrinter;
    Linha : string;
    LinCab1, LinCab2, M_ESPACO : String;
    M_NUMMES, M_QTCARA : Integer;
    M_UNIDAD, M_QUANT, M_VLUNIT, M_VALISS : String;
    LINHA1, VALOR, M_POSINI : integer;
begin
     //
     Try
          btArquivo.Enabled := False;
          // Inicia um transação no BD
           {TD.TransactionID  := StrtoInt(UFrmAdmin.M_CDUSUA);
           TD.IsolationLevel := xilREADCOMMITTED;
           Dm.SqlAdmin.StartTransaction(TD);}
           Dm.Start;
           //
           VDOImpressora := TVDODmPrinter.Create(nil);
           VDOImpressora.Title := 'Visualizar Impressão';
           VDOImpressora.Paper.AutoNewPage := True;
           VDOImpressora.ShowPreview       := True;
           VDOImpressora.ShowProgress      := True;
           VDOImpressora.Font.Size         := fsCondensed;
           M_QTCARA := 159;
           //
           M_SOMAQT := 0;
           M_NRPAGI := 0;
           //
           cdsProdutos.Close;
           With dstProdutos do
           Begin
                Active := False;
                If (cmbSomEstoque.Text = 'SIM') Then
                Begin
                   Commandtext := 'Select P.PRO_CODIGO, P.PRO_DESCRICAO, P.PRO_VLCOMPRA, '+
                               ' (select F.FOR_FANTASIA from FORNECEDORES F Where (F.FOR_CODIGO = P.FOR_CODIGO)) as FOR_FANTASIA, ' +
                               ' (select T.TRI_CODIGO from TRIBUTACAO T Where (T.TRI_CODIGO = P.TRI_CODIGO)) as TRI_CODIGO, ' +
                               ' (select T.TRI_DESCRICAO from TRIBUTACAO T Where (T.TRI_CODIGO = P.TRI_CODIGO)) as TRI_DESCRICAO, ' +
                               'P.PRO_VLVENDA, P.UNI_CODIGO, '+
                               'E.EST_QUANTIDADE, E.EST_CODIGOLOJA '+
                               'from PRODUTOS P '+
                               'INNER join ESTOQUE E ON P.PRO_CODIGO = E.PRO_CODIGO '+
                               'Where (E.EST_CODIGOLOJA = :pLOJA) AND (E.EST_QUANTIDADE > 0)';
                End
                Else
                Begin
                   Commandtext := 'Select P.PRO_CODIGO, P.PRO_DESCRICAO, P.PRO_VLCOMPRA, '+
                               ' (select F.FOR_FANTASIA from FORNECEDORES F Where (F.FOR_CODIGO = P.FOR_CODIGO)) as FOR_FANTASIA, ' +
                               ' (select T.TRI_CODIGO from TRIBUTACAO T Where (T.TRI_CODIGO = P.TRI_CODIGO)) as TRI_CODIGO, ' +                               
                               ' (select T.TRI_DESCRICAO from TRIBUTACAO T Where (T.TRI_CODIGO = P.TRI_CODIGO)) as TRI_DESCRICAO, ' +
                               'P.PRO_VLVENDA, P.UNI_CODIGO,  '+  // P.TRI_CODIGO, T.TRI_DESCRICAO,
                               'E.EST_QUANTIDADE, E.EST_CODIGOLOJA '+
                               'from PRODUTOS P '+
                               'INNER join ESTOQUE E ON P.PRO_CODIGO = E.PRO_CODIGO '+
                               'Where (E.EST_CODIGOLOJA = :pLOJA)';
                End;
                //
                Params.ParamByName('pLOJA').AsInteger  := uFuncoes.CDLOJA(cmbNMLOJA.Text);
                Active := True;
           End;
           cdsProdutos.Open;
           cdsProdutos.First;
           //
           DADOS_LOJA;
           //
           With VDOImpressora do
           Begin
                BeginDoc;
                //
                Font.Size  := fsCondensed;
                Font.Style := [];
                //
                M_POSINI := 0;
                NewLine(2);
                // Cabeçalho
                Print(M_POSINI, Format('%-1s',  ['RAZAO SOCIAL : '+uFuncoes.RemoveAcentos(M_NMRAZA)]),true);
                Print(M_POSINI, Format('%-2s',  ['ENDERECO     : '+uFuncoes.RemoveAcentos(M_ENDERE)]),true);
                Print(M_POSINI, Format('%-8s',  ['MUNICIPIO    : '+uFuncoes.RemoveAcentos(M_NMMUNI)]),true);
                Print(M_POSINI, Format('%-1s',  ['CNPJ         : '+uFuncoes.FormataCNPJ(M_NRCNPJ)]),true);
                //
                Print(M_POSINI, Format('%-1s',[uFuncoes.Replicate('=',137)]),true);
                //
                Print(M_POSINI, Format('%-6s', ['ITEM  '+' '])+
                                Format('%-40s',['DESCRICAO'+' '])+
                                Format('%-21s',['FORNECEDOR  '+' '])+
                                Format('%2s',  ['UN'+' '])+
                                Format('%-13s',['CODIGO        '])+
                                Format('%-21s',['TRIBUTACAO']),false);
                If (cmbMostrarEstoque.Text = 'SIM') Then
                    Print(M_POSINI, Format('%-8s', ['ESTOQUE']),false)
                Else
                    Print(M_POSINI, Format('%-8s', [uFuncoes.Replicate('',8)]),false);
                If (cmbValor.Text = 'VENDA') Then
                    Print(M_POSINI, Format('%-11s', ['VALOR VENDA']),false)
                Else
                    Print(M_POSINI, Format('%-11s', ['  VL.COMPRA']),false);
                Print(M_POSINI, Format('%12s',  ['  SUB-TOTAL']),true);
                Print(M_POSINI, Format('%-137s',[uFuncoes.Replicate('-',137)]),true);
                //
                M_LINHA := 11;
                M_ITENS := 0;
                M_PARVAL := 0;
                M_PARSUB := 0;
                //
                While not (cdsProdutos.Eof) do
                Begin
                     M_NRITEM := InttoStr(cdsProdutos.RecNo);
                     M_NMDESC := copy(cdsProdutos.FieldByName('PRO_DESCRICAO').AsString,1,38);
                     M_DESCAB := copy(cdsProdutos.FieldByName('FOR_FANTASIA').AsString,1,20);
                     M_CDUNID := cdsProdutos.FieldByName('UNI_CODIGO').AsString;
                     M_CDPROD := cdsProdutos.FieldByName('PRO_CODIGO').AsString;
                     M_CDTRIB := cdsProdutos.FieldByName('TRI_DESCRICAO').AsString;
                     M_ESTOQU := cdsProdutos.FieldByName('EST_QUANTIDADE').AsCurrency;
                     //
                     If (cmbValor.Text = 'VENDA') Then
                     begin
                        M_VALOR  := cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency;
                        M_SUBTOT := cdsProdutos.FieldByName('PRO_SUBTOTVENDA').AsCurrency;
                        //
                        M_PARVAL := M_PARVAL + M_VALOR;
                        M_PARSUB := M_PARSUB + M_SUBTOT;
                     End
                     Else
                     begin
                        M_VALOR  := cdsProdutos.FieldByName('PRO_VLCOMPRA').AsCurrency;
                        M_SUBTOT := cdsProdutos.FieldByName('PRO_SUBTOTCOMPRA').AsCurrency;
                        //
                        M_PARVAL := M_PARVAL + M_VALOR;
                        M_PARSUB := M_PARSUB + M_SUBTOT;
                     End;
                     //
                     //If (cmbMostrarEstoque.Text = 'SIM') Then
                     Print(M_POSINI, Format('%-6s', [uFuncoes.StrZero(M_NRITEM,6)+' '])+
                                     Format('%-40s',[M_NMDESC+' '])+
                     //Write(M_NMARQU, Format('%-20s',[M_DESCAB+uFuncoes.Replicate(' ',20-length(M_DESCAB))+' ']));
                                     Format('%-21s',[M_DESCAB+uFuncoes.Replicate(' ',1)]),false);
                    If not uFuncoes.Empty(M_CDUNID) Then
                        Print(M_POSINI, Format('%2s', [M_CDUNID+' ']),false)
                    Else
                        Print(M_POSINI, Format('%2s', [uFuncoes.Replicate(' ',2)+' ']),false);
                    //
                    Print(M_POSINI, Format('%-13s',[M_CDPROD+' ']), false);
                    //
                    If not uFuncoes.Empty(M_CDTRIB) Then
                        Print(M_POSINI, Format('%-15s',[M_CDTRIB+' ']),false)
                    Else
                        Print(M_POSINI, Format('%-15s',[uFuncoes.Replicate(' ',15)+' ']),false);
                    //
                    If (cmbMostrarEstoque.Text = 'SIM') Then
                        Print(M_POSINI, Format('%10s',[FormatFloat('#,##0.000',M_ESTOQU)+'   ']),false)
                    Else
                        Print(M_POSINI, Format('%10s',[uFuncoes.Replicate('',10)]),false);
                    //
                    Print(M_POSINI, Format('%11s',[FormatFloat('###,###,##0.#0',M_VALOR)+'  ']),false);
                    Print(M_POSINI, Format('%10s',[FormatFloat('###,###,##0.#0',M_SUBTOT)+' ']),true);
                    //
                    M_SOMAQT := M_SOMAQT + M_ESTOQU;
                    //
                    M_LINHA := M_LINHA + 1;
                    M_ITENS := M_ITENS + 1;
                    //
                    If (M_NRPAGI = 0) Then
                       M_QTLINH := 59
                     //M_QTLINH := 62
                    Else
                       M_QTLINH := 57;
                      //M_QTLINH := 60;
                    If (M_LINHA > M_QTLINH) then
                    begin
                         M_LINHA := 2;
                         M_NRPAGI := M_NRPAGI + 1;
                        // rodape
                        Print(M_POSINI, uFuncoes.Replicate('=',137),true);
                        If (cmbMostrarEstoque.Text = 'SIM') Then
                        begin
                            Print(M_POSINI, Format('%-101s',[uFuncoes.Replicate(' ',85)+'TOTAL ITENS....:'])
                                     +Format('%8s',  [InttoStr(M_ITENS)])+
                                     Format('%17s',[formatfloat('#,##0.00',M_PARVAL)])+ Format('%11s',[formatfloat('#,##0.00',M_PARSUB)]),true);
                            Print(M_POSINI, Format('%-20s',[uFuncoes.Replicate(' ',85)+'TOTAL ESTOQUE..: '+FormatFloat('###,##0.#00', M_SOMAQT)]),true);
                        End
                        Else
                        begin
                            Print(M_POSINI, Format('%98s',[uFuncoes.Replicate(' ',108)])+
                                        Format('%17s',[formatfloat('#,##0.00',M_PARVAL)])+ Format('%11s',[formatfloat('#,##0.00',M_PARSUB)]),true);
                            NewLine();
                        End;
                        //
                        Print(M_POSINI, uFuncoes.Replicate(' ',125)+
                                   Format('%-17s',['Pagina : '+ InttoStr(M_NRPAGI)]),true);
                        Print(M_POSINI, uFuncoes.Replicate('=',137),true);
                        //
                         NewLine(2);
                    End;
                    // proximo
                    cdsProdutos.Next;
                End;
         // rodape
         M_NRPAGI := M_NRPAGI + 1;
         Print(M_POSINI, uFuncoes.Replicate('=',137),true);
         If (cmbMostrarEstoque.Text = 'SIM') Then
         begin
               //Print(M_POSINI, Format('%-101s',[uFuncoes.Replicate(' ',85)+'TOTAL ITENS....:'])
               Print(M_POSINI, Format('%-91s',[uFuncoes.Replicate(' ',85)+'TOTAL ITENS....:'])
                          +Format('%8s',  [InttoStr(M_ITENS)]),true);
               Print(M_POSINI, Format('%17s',[formatfloat('#,##0.00',M_PARVAL)])+ Format('%11s',[formatfloat('#,##0.00',M_PARSUB)]),true);
               Print(M_POSINI, Format('%-20s',[uFuncoes.Replicate(' ',85)+'TOTAL ESTOQUE..: '+FormatFloat('###,##0.#00', M_SOMAQT)]),true);
         End
         Else
         begin
               Print(M_POSINI, Format('%-79',   [uFuncoes.Replicate(' ',79)])+
                               Format('%-137s', ['TOTAL ITENS....:'+InttoStr(M_ITENS)]) + Format('%-10s',[uFuncoes.Replicate(' ',10)]),True);
               Print(M_POSINI, Format('%-12s',  [formatfloat('#,##0.00',M_PARVAL)])+ Format('%-10s',  [formatfloat('#,##0.00',M_PARSUB)]),true);
         End;
         //
         Print(M_POSINI, uFuncoes.Replicate(' ',125)+
                         Format('%-17s',['Pagina : '+ InttoStr(M_NRPAGI)]),true);
         Print(M_POSINI, uFuncoes.Replicate('=',137),true);
         //
         EndDoc;
         FreeAndNil(VDOImpressora);
       End; // fim- with VDOImpressora
         // Grava
         //Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
         Dm.Comit(Dm.Transc);
         btArquivo.Enabled := True;
         //
         {Try
                Application.CreateForm(TfrmPreviewMatr, frmPreviewMatr);
                frmPreviewMatr.mmoArquivo.Lines.LoadFromFile(M_CAMINH);
                frmPreviewMatr.ShowModal;
         Finally
                frmPreviewMatr.Release;
                frmPreviewMatr := nil;
         End;}
         //
     Except
        on Exc:Exception do
        begin
              Application.MessageBox(PChar('Error ao tentar gerar relatorio!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                //  Cancelar transação no BD.
                //Dm.SqlAdmin.Rollback(TD);
                btArquivo.Enabled := True;
                Dm.Rollback;
        End;
     End;
end;

end.
