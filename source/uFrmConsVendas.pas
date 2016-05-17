unit uFrmConsVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, ToolEdit,
  RpBase, RpFiler, RpDefine, RpRave, RpSystem;

type
  TfrmConsultaVendas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BtSair: TBitBtn;
    grdConsultar: TDBGrid;
    Label1: TLabel;
    edtDTVEND: TDateEdit;
    btConfirma: TBitBtn;
    btImprimir: TBitBtn;
    btEnviarEmail: TBitBtn;
    BitBtn1: TBitBtn;
    btnVisualizar: TBitBtn;
    BitBtn2: TBitBtn;
    rvPedido: TRvProject;
    RvNDRWriter1: TRvNDRWriter;
    RvSystem1: TRvSystem;
    procedure BtSairClick(Sender: TObject);
    procedure edtDTVENDExit(Sender: TObject);
    procedure btConfirmaClick(Sender: TObject);
    procedure edtDTVENDChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDTVENDKeyPress(Sender: TObject; var Key: Char);
    procedure btImprimirClick(Sender: TObject);
    procedure edtDTVENDEnter(Sender: TObject);
    procedure btEnviarEmailClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    procedure CONSULTA;
    procedure tratabotoes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaVendas: TfrmConsultaVendas;

implementation

uses udmConsulta, uFuncoes, uFrmEnviarEmail, uFrmPreviewMatricial,
  UFrmAdmin, Udm, UFrmEmailFornecedor, uDmRelatorios, untFrmPreview;

{$R *.dfm}

procedure TfrmConsultaVendas.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmConsultaVendas.edtDTVENDExit(Sender: TObject);
begin
    If (edtDTVEND.Text <> '  /  /    ') Then
      try
          StrToDate(edtDTVEND.Text);
          edtDTVEND.Date := StrToDate(edtDTVEND.Text);
      except
          on EConvertError do
          Begin
              ShowMessage ('Data Inválida!');
              edtDTVEND.Date := Date();
              Exit;
          End;
      end;
end;

procedure TfrmConsultaVendas.btConfirmaClick(Sender: TObject);
begin
     If (edtDTVEND.Text <> '  /  /    ') Then
        CONSULTA;
end;

procedure TfrmConsultaVendas.CONSULTA;
begin
     If (btImprimir.Enabled) Then
         tratabotoes;
     //
     With dmConsultas.cdsVendas do
     Begin
          Close;
          Params.ParamByName('pDATA').AsDate := edtDTVEND.Date;
          Open;
          //
          If (IsEmpty) Then
          Begin
               Application.MessageBox('Não há venda na data indicada!!!','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               edtDTVEND.SetFocus;
               Exit;
          End
          Else
              tratabotoes;
     End;
     //
end;

procedure TfrmConsultaVendas.edtDTVENDChange(Sender: TObject);
begin
     If (edtDTVEND.Text = '  /  /    ') Then
        dmConsultas.cdsVendas.Close;
end;

procedure TfrmConsultaVendas.FormShow(Sender: TObject);
begin
     dmRelatorios.CarregaRel;
     //
     dm.RefreshCDS(dm.CdsConfig);
     //
     If (Dm.CdsConfigCFG_TELA_PEDIDO.AsInteger = 1) Then
         btImprimir.Visible := False
     Else
         btImprimir.Visible := True;
     //
     dmConsultas.cdsVendas.Close;
     //
     if (Dm.CdsConfigCFG_FLVENDEDOR_ITEM_VENDA.AsString = 'S') Then
      begin
            btEnviarEmail.Visible := false;
            BitBtn2.Visible := false;
      End;
     //
     tratabotoes;
     // 
     edtDTVEND.Date := Date();
end;

procedure TfrmConsultaVendas.edtDTVENDKeyPress(Sender: TObject;
  var Key: Char);
begin
      If (key = #13) and (edtDTVEND.Text <> '  /  /    ') Then
      Begin
           Key := #0;
           btConfirma.SetFocus; 
      End;
end;

procedure TfrmConsultaVendas.btImprimirClick(Sender: TObject);
Var
     M_CAMINH : String;
begin
 If not (dmConsultas.cdsVendas.IsEmpty) Then
 begin
  If Application.MessageBox('Confirma impressão de 2ª via?',
     'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1+MB_APPLMODAL) = idYes then
     If not (dmConsultas.cdsVendas.IsEmpty) Then
      begin
          uFuncoes.NotaFiscal_2Via(
            dmConsultas.cdsVendas.FieldByName('MOV_LOJA').AsInteger,
           dmConsultas.cdsVendas.FieldByName('MOV_PEDIDO').AsInteger);
          {uFuncoes.NotaFiscal('TELA',
            dmConsultas.cdsVendas.FieldByName('MOV_LOJA').AsInteger,
           dmConsultas.cdsVendas.FieldByName('MOV_PEDIDO').AsInteger);}
          //
          {M_CAMINH := uFuncoes.PASTA_CUPOM(StrtoInt(UFrmAdmin.M_CDUSUA));
          //                        not uFuncoes.Empty(M_CAMINH) Or
          M_CAMINH := ExtractFilePath( Application.ExeName ) + '\CUPOM.TXT';
              //
              If (FileExists(M_CAMINH)) Then
               Begin
                   Try
                      Application.CreateForm(TfrmPreviewMatr, frmPreviewMatr);
                      frmPreviewMatr.mmoArquivo.Lines.LoadFromFile(M_CAMINH);
                      frmPreviewMatr.ShowModal;
                   Finally
                      frmPreviewMatr.Release;
                      frmPreviewMatr := nil;
                   End;
               End;}
      End;
  End;
end;

procedure TfrmConsultaVendas.edtDTVENDEnter(Sender: TObject);
begin
     dmConsultas.cdsVendas.Close;
end;

procedure TfrmConsultaVendas.btEnviarEmailClick(Sender: TObject);
begin
  Dm.parametros;
  //
  If Empty(Dm.CdsConfigCFG_EMAIL.AsString)
    or Empty(Dm.CdsConfigCFG_SMTP_EMAIL.AsString) then
       raise Exception.Create('Campos "Email" ou "Servidor SMTP do email" inválidos.');
 //
 FrmAdmin.AbreForm(TfrmEmailForn, FrmAdmin);

 {If not (dmConsultas.cdsVendas.IsEmpty) Then
 begin
  If Application.MessageBox('Confirma geração de arquivo para email?',
     'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1+MB_APPLMODAL) = idYes then
     try
        If not (dmConsultas.cdsVendas.IsEmpty) Then
          Begin
              uFuncoes.GERAR_ARQUIVO_EMAIL(
                dmConsultas.cdsVendas.FieldByName('MOV_PEDIDO').AsInteger,
                dmConsultas.cdsVendas.FieldByName('MOV_LOJA').AsInteger);
              //
              with TfrmEnviarEmail.create(self) do
                try
                     showmodal;
                finally
                     free;
                end;
          End;
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Erro ao tentar gerar arquivo!!!'+#13
                      + Exc.Message), 'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
        End;
     End;
  End;     }
end;

procedure TfrmConsultaVendas.BitBtn1Click(Sender: TObject);
begin
  If Application.MessageBox('Confirma geração de arquivo para email?',
     'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1+MB_APPLMODAL) = idYes then
     try
        If not (dmConsultas.cdsVendas.IsEmpty) Then
          Begin
              uFuncoes.GERAR_ARQUIVO_WORD(
                dmConsultas.cdsVendas.FieldByName('MOV_PEDIDO').AsInteger,
                dmConsultas.cdsVendas.FieldByName('MOV_LOJA').AsInteger);
              //
          End;
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Erro ao tentar gerar arquivo!!!'+#13
                      + Exc.Message), 'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
        End;
     End;

end;

procedure TfrmConsultaVendas.btnVisualizarClick(Sender: TObject);
Begin
     {If not (dmConsultas.cdsVendas.IsEmpty) Then
      Begin
           uFuncoes.CARREGAR_ITENS(dmConsultas.cdsVendasMOV_PEDIDO.AsInteger);
           uFuncoes.VIA_PEDIDO(dmConsultas.cdsVendasMOV_PEDIDO.AsInteger,
                               uFuncoes.GetModaPedido(dmConsultas.cdsVendasMOV_PEDIDO.AsInteger)
                               ,'S', '');
      End;}
      //
      If not (dmConsultas.cdsVendas.IsEmpty) Then
      Begin
           uFuncoes.CARREGAR_ITENS(dmConsultas.cdsVendasMOV_PEDIDO.AsInteger);
           dmRelatorios.VIA_PEDIDO_NOVO(dmConsultas.cdsVendasMOV_PEDIDO.AsInteger,
                               uFuncoes.GetModaPedido(dmConsultas.cdsVendasMOV_PEDIDO.AsInteger)
                               ,'S', '', 'N');
      End;
end;

procedure TfrmConsultaVendas.tratabotoes;
begin
    btEnviarEmail.Enabled := not btEnviarEmail.Enabled;
    btnVisualizar.Enabled := not btnVisualizar.Enabled;
    btImprimir.Enabled    := not btImprimir.Enabled;
end;

procedure TfrmConsultaVendas.BitBtn2Click(Sender: TObject);
begin
  Dm.parametros;
  //
  If Empty(Dm.CdsConfigCFG_EMAIL.AsString)
    or Empty(Dm.CdsConfigCFG_SMTP_EMAIL.AsString) then
       raise Exception.Create('Campos "Email" ou "Servidor SMTP do email" inválidos.');
 //
 FrmAdmin.AbreForm(TfrmEmailForn, frmEmailForn);
end;

end.
