unit uFrmImportaDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, FMTBcd, DBClient,
  Provider, DB, SqlExpr, DBTables;

type
  TfrmImportaDados = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    lbl_QTREGI: TLabel;
    BmsXPProgressBar1: TProgressBar;
    lblPercentual: TLabel;
    rgTabelas: TRadioGroup;
    btnImporta: TBitBtn;
    BtSair: TBitBtn;
    BitBtn1: TBitBtn;
    dstAux: TSQLDataSet;
    dspAux: TDataSetProvider;
    cdsCliente: TClientDataSet;
    tbTabela: TTable;
    dsTabela: TDataSource;
    qryLimpar: TSQLQuery;
    cdsProdutos: TClientDataSet;
    cdsDebitos: TClientDataSet;
    procedure BitBtn1Click(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure btnImportaClick(Sender: TObject);
  private
    { Private declarations }
    procedure Limpar_Clientes;
    procedure Limpar_Produtos;
    procedure Limpar_Debitos;
    Function MaxClientes() : Integer;
    Function MaxProdutos() : Integer;
    Function MaxDebitos() : Integer;
    Function MaxCredito() : Integer;
  public
    { Public declarations }
  end;

var
  frmImportaDados: TfrmImportaDados;
  M_FLCANC : boolean;

implementation

uses Udm, uFuncoes, UFrmAdmin;

{$R *.dfm}

procedure TfrmImportaDados.BitBtn1Click(Sender: TObject);
begin
      Close;
end;

procedure TfrmImportaDados.BtSairClick(Sender: TObject);
begin
     If Application.MessageBox('Confirma cancelamento de importa��o?',
         'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
     begin
         M_FLCANC := True;
         ShowMessage('Cancelado pelo usuario.');
     End;
end;

procedure TfrmImportaDados.btnImportaClick(Sender: TObject);
Var
   I, Cont, Total, iSequencia, iCredito : Integer;
begin
   // Clientes
   if (rgTabelas.ItemIndex = 0) Then
    begin
     try
          M_FLCANC := False;
          Screen.Cursor := crHourGlass;
          BmsXPProgressBar1.Visible := True;
          lblPercentual.Visible     := True;
          btnImporta.Enabled     := False;
          //
          tbTabela.TableName := 'SACCLI.DBF';
          tbTabela.Open;
          tbTabela.First;
          //
          try
             Total := tbTabela.RecordCount;
             BmsXPProgressBar1.Position := 0;
             Cont  := 0;
             //
              with tbTabela do
                begin
                     DisableControls;
                     //
                     Limpar_Clientes;
                     // 
                     While not (Eof) and (M_FLCANC = False) do
                      begin
                           Dm.FilterCDS(cdsCliente, fsInteger, tbTabela.FieldBYname('CLI_CDCLIE').AsString);
                           if not (IsEmpty) Then
                           begin
                               Dm.Start;
                               try
                                   //
                                   With cdsCliente do
                                    begin
                                         Append;
                                         //
                                         FieldByName('CLI_CODIGO').AsInteger    := tbTabela.FieldbyName('CLI_CDCLIE').AsInteger;
                                         FieldByName('CLI_TIPOPESSOA').AsString := tbTabela.FieldbyName('CLI_TPPESS').AsString;
                                         FieldByName('CLI_CGC').AsString        := tbTabela.FieldbyName('CLI_CPFCGC').AsString;
                                         FieldByName('CLI_FANTASIA').AsString   := tbTabela.FieldbyName('CLI_APELID').AsString;
                                         FieldByName('CLI_RAZAO').AsString      := tbTabela.FieldbyName('CLI_NMCLIE').AsString;
                                         FieldByName('CLI_ENDERECO').AsString   := tbTabela.FieldbyName('CLI_ENCLIE').AsString;
                                         FieldByName('CLI_CEP').AsString        := tbTabela.FieldbyName('CLI_CEPCLI').AsString;
                                         {FieldByName('BAI_CODIGO').AsString     := tbTabela.FieldbyName('CLI_BAIRRO').AsString;
                                         FieldByName('CID_CODIGO').AsString     := tbTabela.FieldbyName('CLI_CDCIDA').AsString;}
                                         FieldByName('CLI_FONE1').AsString      := tbTabela.FieldbyName('CLI_NRFONE').AsString;
                                         FieldByName('CLI_FAX').AsString        := tbTabela.FieldbyName('CLI_NUMFAX').AsString;
                                         FieldByName('CLI_INSCESTADUAL').AsString := tbTabela.FieldbyName('CLI_IDEINS').AsString;
                                         FieldByName('CLI_DATACAD').AsString    := uFuncoes.FormataData(tbTabela.FieldbyName('CLI_DTATUA').AsString);
                                         FieldByName('CLI_ORGAOEMISSOR').AsString := tbTabela.FieldbyName('CLI_OREMIS').AsString;
                                         FieldByName('CLI_UFEMISSOR').AsString  := tbTabela.FieldbyName('CLI_UFEMIS').AsString;
                                         FieldByName('CLI_DTANIVERSARIO').AsString := uFuncoes.FormataData(tbTabela.FieldbyName('CLI_DTNASC').AsString);
                                         FieldByName('CLI_UFCLIENTE').AsString  := tbTabela.FieldbyName('CLI_UFCLIE').AsString;
                                         //
                                         ApplyUpdates(0);
                                    End;
                                   //
                                   Dm.Comit(dm.Transc);
                               Except
                                  on E: Exception do
                                    begin
                                         // Caso ocorra um erro, da um RoolBack e atualiza o arquivo de log
                                         dm.Rollback;
                                         Continue;
                                    End;
                               End;
                           End;
                           //
                           If (M_FLCANC) Then
                            begin
                                Application.MessageBox('Importa��o cancelada.',
                                  'Aten��o', MB_OK+MB_ICONSTOP++MB_APPLMODAL);
                                //
                                Break;
                            End;
                           //
                           Cont := Cont + 1;
                           BmsXPProgressBar1.Position := (Cont * 100) div Total;
                           lblPercentual.Caption := InttoStr(BmsXPProgressBar1.Position)+'%';
                           Application.ProcessMessages;
                           // Proximo
                           Next;
                      End;
                     //
                     Dm.parametros;
                     Dm.CdsConfig.Edit;
                     Dm.CdsConfigCFG_CLIENTE.AsInteger := MaxClientes();
                     Dm.CdsConfig.ApplyUpdates(0); 
                     //
                     EnableControls;
                End;
          Except

          End;
          //
           Application.MessageBox('Importa��o conclu�da com sucesso.',
                 'Concluido', MB_OK+MB_ICONINFORMATION);
          //
     finally
          tbTabela.Close;
          Screen.Cursor := crDefault;
          btnImporta.Enabled     := True;
     End;
       //
       Application.ProcessMessages;
    End;
   // Produto
   if (rgTabelas.ItemIndex = 1) Then
    begin
     try
          M_FLCANC := False;
          Screen.Cursor := crHourGlass;
          BmsXPProgressBar1.Visible := True;
          lblPercentual.Visible     := True;
          btnImporta.Enabled     := False;
          //
          tbTabela.TableName := 'SACPRO.DBF';
          tbTabela.Open;
          tbTabela.First;
          //
          try
             Total := tbTabela.RecordCount;
             BmsXPProgressBar1.Position := 0;
             Cont  := 0;
             //
              with tbTabela do
                begin
                     DisableControls;
                     //
                     Limpar_Produtos;
                     //
                     While not (Eof) and (M_FLCANC = False) do
                      begin
                           Dm.FilterCDS(cdsProdutos, fsInteger, tbTabela.FieldBYname('PRO_CDPROD').AsString);
                           if not (IsEmpty) Then
                           begin
                               Dm.Start;
                               try
                                   //
                                   With cdsProdutos do
                                    begin
                                         Append;
                                         //
                                         FieldByName('PRO_CODIGO').AsString     := tbTabela.FieldbyName('PRO_CDPROD').AsString;
                                         FieldByName('PRO_BARRAS').AsString     := tbTabela.FieldbyName('PRO_CDBARR').AsString;
                                         FieldByName('PRO_REFERENCIA').AsString := tbTabela.FieldbyName('PRO_CDBARR').AsString;
                                         FieldByName('PRO_DESCRICAO').AsString  := UpperCase(tbTabela.FieldbyName('PRO_NMPROD').AsString);
                                         FieldByName('PRO_APLICACAO').AsString  := UpperCase(tbTabela.FieldbyName('PRO_NMAPLI').AsString);
                                         If not uFuncoes.Empty(tbTabela.FieldbyName('PRO_CDFABR').AsString) Then
                                             FieldByName('FOR_CODIGO').AsInteger    := tbTabela.FieldbyName('PRO_CDFABR').AsInteger;
                                         //FieldByName('PRO_FRACAO').AsString     := tbTabela.FieldbyName('').AsString;
                                         If not uFuncoes.Empty(tbTabela.FieldbyName('PRO_CDSECA').AsString) Then
                                              FieldByName('SEC_CODIGO').AsInteger    := tbTabela.FieldbyName('PRO_CDSECA').AsInteger;
                                         If not uFuncoes.Empty(tbTabela.FieldbyName('PRO_CDGRUP').AsString) Then
                                              FieldByName('SUB_CODIGO').AsInteger    := tbTabela.FieldbyName('PRO_CDGRUP').AsInteger;
                                         FieldByName('PRO_VLCOMPRA').AsFloat    := tbTabela.FieldbyName('PRO_VLCOMP').AsFloat;
                                         FieldByName('PRO_VLCUSTO').AsFloat     := tbTabela.FieldbyName('PRO_VLCUST').AsFloat;
                                         FieldByName('PRO_VLVENDA').AsFloat     := tbTabela.FieldbyName('PRO_VLVEND').AsFloat;
                                         FieldByName('PRO_VLFRACAO').AsFloat    := tbTabela.FieldbyName('PRO_VLFRAC').AsFloat;
                                         If not uFuncoes.Empty(tbTabela.FieldbyName('PRO_CDTRIB').AsString) Then
                                              FieldByName('TRI_CODIGO').AsInteger    := tbTabela.FieldbyName('PRO_CDTRIB').AsInteger;
                                         FieldByName('PRO_REDUCAOICMS').AsFloat := tbTabela.FieldbyName('PRO_PEICMS').AsFloat;
                                         FieldByName('PRO_TAXAS').AsFloat       := tbTabela.FieldbyName('PRO_PETAXA').Asfloat ;
                                         FieldByName('PRO_IPI').Asfloat         := tbTabela.FieldbyName('PRO_PERIPI').Asfloat;
                                         FieldByName('PRO_FRETE').Asfloat       := tbTabela.FieldbyName('PRO_PEFRET').Asfloat;
                                         FieldByName('PRO_LIMDESCONTO').AsFloat := tbTabela.FieldbyName('PRO_LIDESC').AsFloat;
                                         //FieldByName('PRO_COMISSIONADO').as
                                         If not uFuncoes.Empty(tbTabela.FieldbyName('PRO_DTCADA').AsString) Then
                                             FieldByName('PRO_DTCADASTRO').AsString := uFuncoes.FormataData( tbTabela.FieldbyName('PRO_DTCADA').AsString) ;
                                         If not uFuncoes.Empty(tbTabela.FieldbyName('PRO_DTATUA').AsString) Then
                                             FieldByName('PRO_DTALTERACAO').AsString := uFuncoes.FormataData( tbTabela.FieldbyName('PRO_DTATUA').AsString) ;
                                         If not uFuncoes.Empty(tbTabela.FieldbyName('PRO_CDUNID').AsString) Then
                                             FieldByName('UNI_CODIGO').AsString := tbTabela.FieldbyName('PRO_CDUNID').AsString;
                                         If not uFuncoes.Empty(tbTabela.FieldbyName('PRO_FMARMA').AsString) Then
                                             FieldByName('UNI_ARMAZENAMENTO').AsString := tbTabela.FieldbyName('PRO_FMARMA').AsString;
                                         {FieldByName('PRO_LUCROBRUTO')
                                         FieldByName('PRO_LUCROLIQUIDO
                                         FieldByName('PRO_CONTROLELOTE}
                                         FieldByName('PRO_CODIGOBAIXA').AsString  := FieldByName('PRO_CODIGO').AsString;
                                         FieldByName('PRO_USUARIO_CAD').AsInteger := StrtoInt(uFrmAdmin.M_CDUSUA);
                                         FieldByName('PRO_HOCADA').AsString       := Copy(TimetoStr(Time()),1,5);
                                         //
                                         ApplyUpdates(0);
                                    End;
                                   //
                                   Dm.Comit(dm.Transc);
                               Except
                                  on E: Exception do
                                    begin
                                         // Caso ocorra um erro, da um RoolBack e atualiza o arquivo de log
                                         dm.Rollback;
                                         Continue;
                                    End;
                               End;
                           End;
                           //
                           If (M_FLCANC) Then
                            begin
                                Application.MessageBox('Importa��o cancelada.',
                                  'Aten��o', MB_OK+MB_ICONSTOP++MB_APPLMODAL);
                                //
                                Break;
                            End;
                           //
                           Cont := Cont + 1;
                           BmsXPProgressBar1.Position := (Cont * 100) div Total;
                           lblPercentual.Caption := InttoStr(BmsXPProgressBar1.Position)+'%';
                           Application.ProcessMessages;
                           // Proximo
                           Next;
                      End;
                     //
                     Dm.parametros;
                     Dm.CdsConfig.Edit;
                     Dm.CdsConfigCFG_PRODUTO.AsInteger := MaxProdutos();
                     Dm.CdsConfig.ApplyUpdates(0); 
                     //
                     EnableControls;
                End;
          Except

          End;
          //
           Application.MessageBox('Importa��o conclu�da com sucesso.',
                 'Concluido', MB_OK+MB_ICONINFORMATION);
          //
     finally
          tbTabela.Close;
          Screen.Cursor := crDefault;
          btnImporta.Enabled     := True;
     End;
       //
       Application.ProcessMessages;
    End;
   // Debitos
   if (rgTabelas.ItemIndex = 2) Then
    begin
     try
          M_FLCANC := False;
          Screen.Cursor := crHourGlass;
          BmsXPProgressBar1.Visible := True;
          lblPercentual.Visible     := True;
          btnImporta.Enabled     := False;
          //
          tbTabela.TableName := 'SACDEB.DBF';
          tbTabela.Open;
          tbTabela.First;
          //
          try
             Total := tbTabela.RecordCount;
             BmsXPProgressBar1.Position := 0;
             Cont  := 0;
             //
              with tbTabela do
                begin
                     DisableControls;
                     //
                     Limpar_Debitos;
                     //
                     Dm.RefreshCDS(Dm.CdsConfig);
                     dm.CdsConfig.Edit;
                     dm.CdsConfigCFG_SEQRECEBER.AsInteger := 0;
                     dm.CdsConfig.ApplyUpdates(0);
                     //
                     While not (Eof) and (M_FLCANC = False) do
                      begin
                           dm.CdsConfig.Edit;
                           dm.CdsConfigCFG_SEQRECEBER.Value    := dm.CdsConfigCFG_SEQRECEBER.Value+1;
                           iSequencia := dm.CdsConfigCFG_SEQRECEBER.AsInteger;
                           dm.CdsConfig.ApplyUpdates(0);
                           //
                           Dm.FilterCDS(cdsDebitos, fsInteger, InttoStr(iSequencia));
                           if not (IsEmpty) Then
                           begin
                               Dm.Start;
                               try
                                   //
                                   With cdsDebitos do
                                    begin
                                         Append;
                                         //
                                         FieldByName('REC_SEQUENCIA').AsInteger := iSequencia;
                                         FieldByName('REC_LOJA').AsInteger      := tbTabela.FieldbyName('DEB_CDLOJA').AsInteger;
                                         FieldByName('REC_CREDITO').AsInteger   := tbTabela.FieldbyName('DEB_NRCRED').AsInteger;
                                         FieldByName('REC_PARCELA').AsInteger   := tbTabela.FieldbyName('DEB_NRPARC').AsInteger;
                                         FieldByName('REC_QTPARCELAS').AsInteger := tbTabela.FieldbyName('DEB_QTPARC').AsInteger;
                                         FieldByName('REC_CLIENTE').AsInteger   := tbTabela.FieldbyName('DEB_CDCLIE').AsInteger;
                                         If not uFuncoes.Empty(tbTabela.FieldbyName('DEB_NRVEND').AsString) Then
                                              FieldByName('REC_NRVENDA').AsInteger   := tbTabela.FieldbyName('DEB_NRVEND').AsInteger;
                                         FieldByName('REC_DESCRICAO').AsString  := tbTabela.FieldbyName('DEB_NMDESC').AsString;
                                         If not uFuncoes.Empty(tbTabela.FieldbyName('DEB_DTMOVI').AsString) Then
                                            FieldByName('REC_DATAEMISSAO').AsString := uFuncoes.FormataData(tbTabela.FieldbyName('DEB_DTMOVI').AsString) ;
                                         If not uFuncoes.Empty(tbTabela.FieldbyName('DEB_DTVENC').AsString) Then
                                            FieldByName('REC_DATAVENCIMENTO').AsString := uFuncoes.FormataData(tbTabela.FieldbyName('DEB_DTVENC').AsString);
                                         If not uFuncoes.Empty(tbTabela.FieldbyName('DEB_DTPAGA').AsString) Then
                                            FieldByName('REC_DATAPAGAMENTO').AsString := uFuncoes.FormataData(tbTabela.FieldbyName('DEB_DTPAGA').AsString);
                                         FieldByName('REC_VALORPARCELA').AsFloat := tbTabela.FieldbyName('DEB_VLPARC').AsFloat;
                                         FieldByName('REC_SITUACAO').AsString   := tbTabela.FieldbyName('DEB_FLSITU').AsString;
                                         FieldByName('REC_VALORACRESIMO').AsFloat := 0;
                                         FieldByName('REC_VALORJUROS').AsFloat    := tbTabela.FieldbyName('DEB_VLJURO').AsFloat;
                                         FieldByName('REC_VALORDESCONTO').AsFloat := tbTabela.FieldbyName('DEB_VLDESC').AsFloat;
                                         FieldByName('REC_PAGO').AsFloat := tbTabela.FieldbyName('DEB_TOPAGO').AsFloat;
                                         FieldByName('REC_RESTANTE').AsFloat := tbTabela.FieldbyName('DEB_VLREST').AsFloat;
                                         If not uFuncoes.Empty(tbTabela.FieldbyName('DEB_CDMODA').AsString) Then
                                            FieldByName('REC_TIPOMODALIDADE').AsInteger := tbTabela.FieldbyName('DEB_CDMODA').AsInteger;
                                         FieldByName('REC_BANCO').AsString      := uFuncoes.StrZero(tbTabela.FieldbyName('DEB_CDBANC').AsString,3);
                                         FieldByName('REC_AGENCIA').AsString    := uFuncoes.StrZero(tbTabela.FieldbyName('DEB_NRAGEN').AsString,4);
                                         FieldByName('REC_NRCONTA').AsString    := uFuncoes.StrZero(tbTabela.FieldbyName('DEB_NRCONT').AsString,12);
                                         FieldByName('REC_NRCHEQUE').AsString   := uFuncoes.StrZero(tbTabela.FieldbyName('DEB_NRCHEQ').AsString,8);
                                         If not uFuncoes.Empty(tbTabela.FieldbyName('DEB_CDUSUA').AsString) Then
                                              FieldByName('REC_USUARIO').AsInteger   := tbTabela.FieldbyName('DEB_CDUSUA').AsInteger;
                                         //FieldByName('REC_NATUREZA').AsInteger  :=
                                         //
                                         ApplyUpdates(0);
                                    End;
                                   //
                                   Dm.Comit(dm.Transc);
                               Except
                                  on E: Exception do
                                    begin
                                         // Caso ocorra um erro, da um RoolBack e atualiza o arquivo de log
                                         dm.Rollback;
                                         Continue;
                                    End;
                               End;
                           End;
                           //
                           If (M_FLCANC) Then
                            begin
                                Application.MessageBox('Importa��o cancelada.',
                                  'Aten��o', MB_OK+MB_ICONSTOP++MB_APPLMODAL);
                                //
                                Break;
                            End;
                           //
                           Cont := Cont + 1;
                           BmsXPProgressBar1.Position := (Cont * 100) div Total;
                           lblPercentual.Caption := InttoStr(BmsXPProgressBar1.Position)+'%';
                           Application.ProcessMessages;
                           // Proximo
                           Next;
                      End;
                     //
                     Dm.parametros;
                     Dm.CdsConfig.Edit;
                     Dm.CdsConfigCFG_SEQRECEBER.AsInteger := MaxDebitos();
                     Dm.CdsConfigCFG_CREDITO.AsInteger    := MaxCredito();
                     Dm.CdsConfig.ApplyUpdates(0); 
                     //
                     EnableControls;
                End;
          Except

          End;
          //
           Application.MessageBox('Importa��o conclu�da com sucesso.',
                 'Concluido', MB_OK+MB_ICONINFORMATION);
          //
     finally
          tbTabela.Close;
          Screen.Cursor := crDefault;
          btnImporta.Enabled     := True;
     End;
       //
       Application.ProcessMessages;
    End;
end;

procedure TfrmImportaDados.Limpar_Clientes;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Delete from CLIENTES';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      ExecSQL();
    finally
      free;
    end;
end;

procedure TfrmImportaDados.Limpar_Debitos;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Delete from CONTASRECEBER';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      ExecSQL();
    finally
      free;
    end;
end;

procedure TfrmImportaDados.Limpar_Produtos;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Delete from PRODUTOS';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      ExecSQL();
    finally
      free;
    end;
end;

function TfrmImportaDados.MaxClientes: Integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select Max(CL.CLI_CODIGO) as TOTAL from Clientes CL';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      open;
      //
      Result := FieldByName('TOTAL').AsInteger;
    finally
      free;
    end;
end;

function TfrmImportaDados.MaxDebitos: Integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select Max(CR.rec_sequencia) AS total from contasreceber CR';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      open;
      //
      Result := FieldByName('TOTAL').AsInteger;
    finally
      free;
    end;
end;

function TfrmImportaDados.MaxProdutos: Integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select Max(p.pro_codigo) AS total from produtos p';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      open;
      //
      Result := FieldByName('TOTAL').AsInteger;
    finally
      free;
    end;
end;

function TfrmImportaDados.MaxCredito: Integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select Max(CR.REC_CREDITO) AS total from contasreceber CR';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      open;
      //
      Result := FieldByName('TOTAL').AsInteger;
    finally
      free;
    end;
end;

end.
