unit frmGerarArquivosXML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, Grids, DBGrids,
  FMTBcd, DB, DBClient, Provider, SqlExpr, BmsXPProgressBar, ComCtrls;

type
  TfrmImportaXML = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    btnFechar: TBitBtn;
    Label1: TLabel;
    edtDTINIC: TDateEdit;
    edtDTFINA: TDateEdit;
    Label2: TLabel;
    dstTabela: TSQLDataSet;
    dspTabela: TDataSetProvider;
    cdsTabela: TClientDataSet;
    dsTabela: TDataSource;
    btnGerar: TBitBtn;
    cdsXML: TClientDataSet;
    dsXML: TDataSource;
    SaveDialog1: TSaveDialog;
    cdsLimites: TClientDataSet;
    DataSource1: TDataSource;
    cdsLimitesFINAL: TIntegerField;
    cdsLimitesINICIO: TIntegerField;
    cdsLimitesCOUNT: TIntegerField;
    BmsXPProgressBar1: TBmsXPProgressBar;
    lblPerc: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Panel5: TPanel;
    lstTabelas: TListBox;
    Panel6: TPanel;
    grdConsultar: TDBGrid;
    Panel7: TPanel;
    lstExportacao: TListBox;
    Panel8: TPanel;
    DBGrid1: TDBGrid;
    procedure btnFecharClick(Sender: TObject);
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINAExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lstTabelasClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lstExportacaoClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Abrir_Tabela(aNomeTabela : String);
    Procedure Abrir_Tabela_XML(aNomeTabela : String);
    Procedure Produtos_Pedido(iInicio, iFim : Integer);
    procedure ListarArquivos(Diretorio: string; Sub:Boolean);
    function TemAtributo(Attr, Val: Integer): Boolean;
  public
    { Public declarations }
  end;

var
  frmImportaXML: TfrmImportaXML;
  aPasta : String;
  iOpcao : Integer;


implementation

uses Udm, DateUtils, uFuncoes;

{$R *.dfm}

procedure TfrmImportaXML.btnFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmImportaXML.edtDTINICExit(Sender: TObject);
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

procedure TfrmImportaXML.edtDTFINAExit(Sender: TObject);
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

procedure TfrmImportaXML.FormShow(Sender: TObject);
begin
     edtDTINIC.Date := Date();
     edtDTFINA.Date := edtDTINIC.Date;
     //
     aPasta := 'C:\tmp\XML\';
     lblPerc.Caption := '0%';
     //
     If (iOpcao = 1) Then
     begin
         Caption := 'Gerar arquivos para importação';
         btnGerar.Caption := '&Gerar';
         btnGerar.Hint := 'Clique aqui para gerar arquivos para importação.';
     End
     Else
     begin
         Caption := 'Exportação de dados';
         btnGerar.Caption := '&Exportar';
         btnGerar.Hint := 'Clique aqui exportar dados.';
         //
         lstExportacao.Clear;
         ListarArquivos('C:\tmp\XML', false);
     End;
end;

procedure TfrmImportaXML.Abrir_Tabela(aNomeTabela: String);
Var
    Texto : String;
begin
     If (aNomeTabela = 'BAIRROS') Then
          Texto := 'select * from BAIRROS';
     If (aNomeTabela = 'CIDADES') Then
          Texto := 'Select * from CIDADES';
     If (aNomeTabela = 'CLIENTES') Then
     begin
          Texto := 'Select * from CLIENTES ';
          Texto := Texto + 'Where (CLI_DATACAD >= :pDTINIC) and (CLI_DATACAD <= :pDTFINA) ';
     End;
     If (aNomeTabela = 'FORNECEDORES') Then
          Texto := 'Select * from FORNECEDORES Where (FOR_DTCADA >= :pDTINIC) and (FOR_DTCADA <= :pDTFINA)';
     If (aNomeTabela = 'PLANO_PAGAMENTO') Then
          Texto := 'Select * from PLANO_PAGAMENTO';
     If (aNomeTabela = 'PRODUTOS') Then
          Texto := 'Select * from PRODUTOS Where (PRO_DTCADASTRO >= :pDTINIC) and (PRO_DTCADASTRO <= :pDTFINA)';
     If (aNomeTabela = 'TAB_PRECOS') Then
          Texto := 'Select * from TAB_PRECOS';
     If (aNomeTabela = 'TRANSPORTADORA') Then
          texto := 'Select * from TRANSPORTADORA';
     If (aNomeTabela = 'VENDAS') Then
          texto := 'Select * from VENDAS Where (MOV_DATAVENDA >= :pDTINIC) and (MOV_DATAVENDA <= :pDTFINA)';
     //
     With cdsTabela do
      begin
           DisableControls;
           Close;
           CommandText := Texto;
           If (aNomeTabela = 'CLIENTES') Then
           begin
                Params.ParamByName('pDTINIC').AsDateTime := edtDTINIC.Date;
                Params.ParamByName('pDTFINA').AsDateTime := edtDTFINA.Date;
                FetchParams;
           End;
           //
           If (aNomeTabela = 'FORNECEDORES') Then
           begin
                Params.ParamByName('pDTINIC').AsDateTime := edtDTINIC.Date;
                Params.ParamByName('pDTFINA').AsDateTime := edtDTFINA.Date;
                FetchParams;
           End;
           //
           If (aNomeTabela = 'PRODUTOS') Then
           begin
                Params.ParamByName('pDTINIC').AsDateTime := edtDTINIC.Date;
                Params.ParamByName('pDTFINA').AsDateTime := edtDTFINA.Date;
                FetchParams;
           End;
           //
           If (aNomeTabela = 'VENDAS') Then
           begin
                Params.ParamByName('pDTINIC').AsDateTime := edtDTINIC.Date;
                Params.ParamByName('pDTFINA').AsDateTime := edtDTFINA.Date;
                FetchParams;
           End;
           //
           Open;
           EnableControls;
      End;
end;

procedure TfrmImportaXML.lstTabelasClick(Sender: TObject);
begin
     Abrir_Tabela(lstTabelas.Items.Strings[lstTabelas.ItemIndex]);
end;

procedure TfrmImportaXML.btnGerarClick(Sender: TObject);
Var
     i, iPedIncial, iPedFinal : integer;
begin
 If (iOpcao = 1) Then
 begin
  If Application.MessageBox('Confirma a geração de arquivos?',
     'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
  begin
     //
     BmsXPProgressBar1.Position := 10;
     //
     For i := 0 to lstTabelas.Count -1 do
       begin
            try
                //
                Abrir_Tabela(lstTabelas.Items.Strings[i]);
                //
                If not (cdsTabela.IsEmpty) Then
                begin
                      cdsXML.Data := cdsTabela.Data;
                      cdsXML.SaveToFile(aPasta + lstTabelas.Items.Strings[i]+'.xml', dfXML);
                      //
                      If (lstTabelas.Items.Strings[i] = 'VENDAS') Then
                        begin
                             With cdsLimites do
                              begin
                                   Close;
                                   Params.ParamByName('pDTINIC').AsDateTime := edtDTINIC.Date;
                                   Params.ParamByName('pDTFINA').AsDateTime := edtDTFINA.Date;
                                   open;
                                   //
                                   If not (IsEmpty) Then
                                    begin
                                         iPedIncial := FieldByName('INICIO').AsInteger;
                                         iPedFinal  := FieldByName('FINAL').AsInteger;
                                         //
                                         Produtos_Pedido(iPedIncial, iPedFinal);
                                    End;
                              End;
                        End;
                End;
                //
                BmsXPProgressBar1.Position := BmsXPProgressBar1.Position + 10;
                lblPerc.Caption := InttoStr(BmsXPProgressBar1.Position) + '%';
            Except
                  Showmessage('Erro ao tentar gerar arquivo.');
            End;
       End;
       //
       ShowMessage('Arquivos gerados com sucesso.');
       Close;
   End;
 End
 Else
 begin
  If Application.MessageBox('Confirma a exportação de dados?',
     'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
  begin
     //
     BmsXPProgressBar1.Position := 10;
     //
     For i := 0 to lstExportacao.Count - 1 do
       begin
            try
                //
                Abrir_Tabela_XML(lstExportacao.Items.Strings[i]);
                //
                If not (cdsXML.IsEmpty) Then
                begin
                      // Produtos Pedidos
                      If (lstExportacao.Items.Strings[i] = aPasta +'PROVENDAS.xml') Then
                        begin
                              If not (uFuncoes.GetValidarProdutoPedido(cdsXML.FieldByName('MOP_PEDIDO').AsInteger,
                                      cdsXML.FieldByName('MOP_PRODUTO').AsString)) Then
                               begin

                               End
                               Else
                                   ShowMessage('Registro já exportado.');
                        End;
                      // Pedidos
                      If (lstExportacao.Items.Strings[i] = aPasta +'VENDAS.xml') Then
                        begin
                              If not (uFuncoes.GetValidarPedido(cdsXML.FieldByName('MOV_PEDIDO').AsInteger,
                                      cdsXML.FieldByName('MOV_CLIENTE').AsInteger)) Then
                               begin

                               End
                               Else
                                   ShowMessage('Registro já exportado.');
                        End;
                End;
                //
                BmsXPProgressBar1.Position := BmsXPProgressBar1.Position + 10;
                lblPerc.Caption := InttoStr(BmsXPProgressBar1.Position) + '%';
            Except
                  Showmessage('Erro ao tentar gerar arquivo.');
            End;
       End;
       //
       ShowMessage('Arquivos gerados com sucesso.');
       Close;
    End;
 End;
end;

procedure TfrmImportaXML.Produtos_Pedido(iInicio, iFim: Integer);
Var
    Texto : String;
begin
     Texto := 'select * from PROVENDAS PV Where (PV.mop_pedido >= :pINICIO) AND (PV.mop_pedido <= :pFIM )';
     //
     With cdsTabela do
      begin
           DisableControls;
           Close;
           CommandText := Texto;
           Params.ParamByName('pINICIO').AsInteger := iInicio;
           Params.ParamByName('pFIM').AsInteger    := iFim;
           Open;
           EnableControls;
       End;
       //
       try
             If not (cdsTabela.IsEmpty) Then
             begin
                  cdsXML.Data := cdsTabela.Data;
                  cdsXML.SaveToFile(aPasta + 'PROVENDAS.xml', dfXML);
             End;
             //
       Except
             Showmessage('Erro ao tentar gerar arquivo.');
       End;
end;

procedure TfrmImportaXML.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      cdsTabela.Close;
end;

procedure TfrmImportaXML.ListarArquivos(Diretorio: string; Sub: Boolean);
var
  F: TSearchRec;
  Ret: Integer;
  TempNome: string;
begin
  Ret := FindFirst(Diretorio+'\*.xml', faAnyFile, F);
  try
    while Ret = 0 do
    begin
      if TemAtributo(F.Attr, faDirectory) then
      begin
        if (F.Name <> '.') And (F.Name <> '..') then
          if Sub = True then
          begin
            TempNome := Diretorio+'\' + F.Name;
            ListarArquivos(TempNome, True);
          end;
      end
      else
      begin
        lstExportacao.Items.Add(Diretorio+'\'+F.Name);
      end;
        Ret := FindNext(F);
    end;
  finally
  begin
    FindClose(F);
  end;
 End;
end;

function TfrmImportaXML.TemAtributo(Attr, Val: Integer): Boolean;
begin
    Result := Attr and Val = Val;
end;

procedure TfrmImportaXML.Abrir_Tabela_XML(aNomeTabela: String);
Var
     aTabela : String;
begin
      With cdsXML do
        begin
             DisableControls;
             Close;
             LoadFromFile(aNomeTabela);
             Open;
             EnableControls;
        End;
end;

procedure TfrmImportaXML.lstExportacaoClick(Sender: TObject);
begin
     Abrir_Tabela_XML(lstExportacao.Items.Strings[lstExportacao.ItemIndex]);
end;

end.
