unit uFrmListaClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons, Grids, DBGrids, DB,
  ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppPrnabl,
  ppCtrls, ppBands, ppCache, ppVar, OleServer, ExcelXP, comObj;

type
  TfrmListaClientes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    edtDTINIC: TDateEdit;
    edtDTFINA: TDateEdit;
    Label12: TLabel;
    cmbGrupos: TComboBox;
    btnConsulta: TBitBtn;
    grdConsultar: TDBGrid;
    dsDados: TDataSource;
    lblRegistros: TLabel;
    btnFechar: TBitBtn;
    btnVisualizar: TBitBtn;
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText4: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBImage1: TppDBImage;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLabel6: TppLabel;
    ppLine3: TppLine;
    ppDBCalc2: TppDBCalc;
    ppLine4: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    btnExcel: TBitBtn;
    ExcelApplication1: TExcelApplication;
    SaveDialog1: TSaveDialog;
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINAExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure dsDadosDataChange(Sender: TObject; Field: TField);
    procedure btnFecharClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure cmbGruposEnter(Sender: TObject);
    procedure edtDTINICEnter(Sender: TObject);
    procedure edtDTFINAEnter(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
    procedure Carregar_Grupos;
    procedure LimparRotulo;
  public
    { Public declarations }
  end;

var
  frmListaClientes: TfrmListaClientes;

implementation

uses Udm, udmConsulta, udmDados, uFuncoes;

{$R *.dfm}

procedure TfrmListaClientes.edtDTINICExit(Sender: TObject);
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

procedure TfrmListaClientes.edtDTFINAExit(Sender: TObject);
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

procedure TfrmListaClientes.Carregar_Grupos;
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

procedure TfrmListaClientes.FormShow(Sender: TObject);
begin
     Carregar_Grupos;
     //
     If (dmDados.cdsListaClientes.Active) Then
         dmDados.cdsListaClientes.EmptyDataSet;
     //
     btnVisualizar.Enabled := false;
     btnExcel.Enabled := btnVisualizar.Enabled; 
end;

procedure TfrmListaClientes.btnConsultaClick(Sender: TObject);
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
        dmDados.ConsultaClientes(iGrupo, edtDTINIC.Date, edtDTFINA.Date);
     Finally
           btnConsulta.Enabled := true;
           Screen.Cursor := crDefault;
     End;
     Application.ProcessMessages;
     //
     If (dmDados.cdsListaClientes.IsEmpty) Then
        Application.MessageBox(PChar('Não há dados para os parametros especificado.'),
                'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmListaClientes.dsDadosDataChange(Sender: TObject;
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
end;

procedure TfrmListaClientes.btnFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmListaClientes.btnVisualizarClick(Sender: TObject);
begin
     If not (dsDados.DataSet.IsEmpty) Then
      begin
           With ppReport1 do
            begin
                 PrintReport;
            End;
      End;
end;

procedure TfrmListaClientes.cmbGruposEnter(Sender: TObject);
begin
     LimparRotulo;
end;

procedure TfrmListaClientes.edtDTINICEnter(Sender: TObject);
begin
     LimparRotulo;
end;

procedure TfrmListaClientes.edtDTFINAEnter(Sender: TObject);
begin
     LimparRotulo;
end;

procedure TfrmListaClientes.LimparRotulo;
begin
     dmDados.cdsListaClientes.close;
     lblRegistros.Caption := 'Registro(s): ';
end;

procedure TfrmListaClientes.btnExcelClick(Sender: TObject);
Var
     Excel : Variant;
     Linha : Integer;
     M_ARQEXC : String;
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
          Excel := CreateOleObject('Excel.Application');
          {Excel.Workbooks.Add;}
          Excel.WorkBooks.Open(ExtractFilePath( Application.ExeName )+'temp.xls');
          //
          Excel.WorkBooks[1].Sheets[1].Cells[1,1]:= 'LISTA DE ADIMPLENTES ';
          Excel.WorkBooks[1].Sheets[1].Cells[2,1]:= 'PERÍODO : '+edtDTINIC.Text + ' À '+edtDTFINA.Text;
          Excel.WorkBooks[1].Sheets[1].Cells[3,1]:= 'EMISSÃO : '+DatetoStr(Date());
          //
          Linha := 4;
          //
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,1]:= 'NOME';
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,2]:= 'CPF/CNPJ';
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,3]:= 'Nº. BOX';
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,4]:= 'GRUPO';
          //
          Linha     := 5;
          dmDados.cdsListaClientes.DisableControls;
          dmDados.cdsListaClientes.First;
          While not (dmDados.cdsListaClientes.eof) do
            begin
                 Excel.WorkBooks[1].Sheets[1].Cells[Linha,1]:= dmDados.cdsListaClientes.FieldByName('CDS_NOME').AsString;
                 Excel.WorkBooks[1].Sheets[1].Cells[Linha,2]:= dmDados.cdsListaClientes.FieldByName('CDS_CGCCPF').AsString;
                 Excel.WorkBooks[1].Sheets[1].Cells[Linha,3]:= dmDados.cdsListaClientes.FieldByName('CDS_NRBOX').AsString;
                 Excel.WorkBooks[1].Sheets[1].Cells[Linha,4] := dmDados.cdsListaClientes.FieldByName('CDS_NMGRUPO').AsString;
                 //
                 Linha     := Linha + 1;
                 //
                 dmDados.cdsListaClientes.Next;
            End;
            //
            Linha     := Linha + 1;
          //
          Excel.WorkBooks[1].SaveAs(M_ARQEXC);
          Excel.WorkBooks[1].Close;
          dmDados.cdsListaClientes.First;
          dmDados.cdsListaClientes.EnableControls;
          //
       Finally
             Screen.Cursor := crDefault;
       End;
       Application.ProcessMessages;
          Application.MessageBox('Arquivo gerado com sucesso!!!',
               'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       Except
           on Exc:Exception do
           begin
                dmDados.cdsListaClientes.EnableControls;
                Application.MessageBox(PChar('Error ao tentar gerar arquivo.'+#13
                    + Exc.Message),
                  'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           End;
       End;
  End;     
end;

end.
