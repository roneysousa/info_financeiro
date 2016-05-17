unit uFrmCadCedentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, DBCtrls, Mask, ExtDlgs;

type
  TfrmCadCedentes = class(TfrmCadastro)
    cdsConsultarCODIGO: TIntegerField;
    cdsConsultarCEDENTE_NOME: TStringField;
    cdsConsultarBANCO_NOME: TStringField;
    dsCedente: TDataSource;
    gpbIdentificacao: TGroupBox;
    Label2: TLabel;
    dbeNMCEDE: TDBEdit;
    Label3: TLabel;
    dbeInscricao: TDBEdit;
    gpbDadosBancarios: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    EditCarteira: TDBEdit;
    EditCedenteCodigoDigito: TDBEdit;
    EditCedenteCodigo: TDBEdit;
    EditBancoNome: TDBEdit;
    EditBancoCodigo: TDBEdit;
    EditContaNumeroDigito: TDBEdit;
    EditContaNumero: TDBEdit;
    EditAgenciaNome: TDBEdit;
    EditAgenciaDigito: TDBEdit;
    EditAgenciaCodigo: TDBEdit;
    EditProximoNossoNumero: TDBEdit;
    gpbEndereco: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    EditRua: TDBEdit;
    EditNumero: TDBEdit;
    EditComplemento: TDBEdit;
    EditBairro: TDBEdit;
    EditCidade: TDBEdit;
    EditCEP: TDBEdit;
    EditEMail: TDBEdit;
    Label1: TLabel;
    DBText1: TDBText;
    rbnTipo: TDBRadioGroup;
    cmbUFCLIE: TDBComboBox;
    Label4: TLabel;
    imgLogo: TDBImage;
    OpenPictureDialog1: TOpenPictureDialog;
    lblProximoNossoNumero: TLabel;
    Label6: TLabel;
    dbeNrConvenio: TDBEdit;
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure imgLogoClick(Sender: TObject);
    procedure dbeInscricaoEnter(Sender: TObject);
    procedure EditBancoCodigoExit(Sender: TObject);
    procedure EditBancoCodigoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbeNrConvenioKeyPress(Sender: TObject; var Key: Char);
    procedure EditContaNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure EditContaNumeroExit(Sender: TObject);
  private
    { Private declarations }
     novo, alterar, apagar : String;
     procedure tratabotoes;
     procedure buscar;
     procedure REGISTRO;
     procedure Formatar_Campo;
  public
    { Public declarations }
  end;

var
  frmCadCedentes: TfrmCadCedentes;

implementation

uses udmDados, Udm, uFuncoes, udmConsulta, UFrmAdmin;

{$R *.dfm}

{ TfrmCadCedentes }

procedure TfrmCadCedentes.buscar;
begin
  With dmDados.cdsCedente do
  Begin
       Active := False;
       Params.ParamByName('pCODIGO').AsInteger := cdsConsultar.FieldByName('CODIGO').AsInteger;
       Active := True;
  End;
  //
  Formatar_Campo;
end;

procedure TfrmCadCedentes.REGISTRO;
Var
   codigo : integer;
begin
     Dm.RefreshCDS(Dm.CdsConfig);
       With dmDados.cdsCedente  do
       begin
            Active := False;
            //
            codigo := uFuncoes.mvcodigo('CODIGO','CEDENTES');
            If (Dm.CdsConfigCFG_CEDENTE.AsInteger = 0) Then
                 Params.ParamByName('pCODIGO').AsInteger := 0
            Else
                Params.ParamByName('pCODIGO').AsInteger := uFuncoes.mvcodigo('CODIGO','CEDENTES');
            //
            Active := True;
       End;
       //
      Formatar_Campo;
end;

procedure TfrmCadCedentes.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadCedentes.BtAdicionarClick(Sender: TObject);
begin
  inherited;
    tratabotoes;
    Dm.RefreshCDS(Dm.CdsConfig);
    dmDados.cdsCedente.Append;
    dmDados.cdsCedenteCODIGO.AsInteger := dm.CdsConfigCFG_CEDENTE.AsInteger+1;
    dbeNMCEDE.SetFocus;
end;

procedure TfrmCadCedentes.BtEditarClick(Sender: TObject);
begin
  if not (dmDados.cdsCedente.IsEmpty) then
  Begin
        tratabotoes;
        dmDados.cdsCedente.Edit;
        Formatar_Campo;
        dbeNMCEDE.SetFocus;
  End;
  //
  inherited;
end;

procedure TfrmCadCedentes.BtCancelarClick(Sender: TObject);
begin
  inherited;
   tratabotoes;
   dmDados.cdsCedente.Cancel;
   //
   If (dmDados.cdsCedente.IsEmpty) Then
      close;
end;

procedure TfrmCadCedentes.BtGravarClick(Sender: TObject);
begin
    If uFuncoes.Empty(dbeNMCEDE.Text) Then
    Begin
        Application.MessageBox('Digite o nome do cedente!!!','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        dbeNMCEDE.SetFocus;
        Exit;
    End;
    //
    If (rbnTipo.ItemIndex = -1) Then
    begin
        Application.MessageBox('Selecione o tipo de pessoa!!!','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        rbnTipo.SetFocus;
        Exit;
    End;
    //
    If Empty(EditBancoCodigo.Text) Then
      begin
          Application.MessageBox('Digite o código do banco.','ATENÇÃO',
                MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          EditBancoCodigo.SetFocus;
          Exit;
      End;
    //
     try
          tratabotoes;
          //
          If (dmDados.cdsCedente.State in [dsInsert]) Then
            begin
                 Dm.RefreshCDS(Dm.CdsConfig);
                 Dm.CdsConfig.Edit;
                 Dm.CdsConfigCFG_CEDENTE.AsInteger :=
                    Dm.CdsConfigCFG_CEDENTE.AsInteger + 1;
                 Dm.CdsConfig.ApplyUpdates(0);
                 dmDados.cdsCedenteCODIGO.AsInteger :=
                     Dm.CdsConfigCFG_CEDENTE.AsInteger;
            End;
            //
            dmDados.cdsCedente.ApplyUpdates(0);   
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar grava registro!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        End;
     End;
  inherited;
end;

procedure TfrmCadCedentes.FormShow(Sender: TObject);
begin
  inherited;
      REGISTRO;
      //
      If (dmDados.cdsCedente.IsEmpty) Then
          BtAdicionarClick(Self);
end;

procedure TfrmCadCedentes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
      if not (dmDados.cdsCedente.IsEmpty) Then
         dmDados.cdsCedente.Close;
      //
end;

procedure TfrmCadCedentes.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
  begin
        with cdsConsultar do
        begin
             Close;
             CommandText := 'select CODIGO, CEDENTE_NOME, BANCO_NOME from CEDENTES ';
             case rgConsultar.ItemIndex of
               0: CommandText := CommandText + ' where CODIGO = ' + edtConsultar.Text;
               1: CommandText := CommandText + ' where UPPER(CEDENTE_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
             end;
             CommandText := CommandText + 'order by CEDENTE_NOME ';
             Open;
        End;  //fim-with
  End;     // fim-se
end;

procedure TfrmCadCedentes.btnAlterarClick(Sender: TObject);
begin
  inherited;
  If not (cdsConsultar.IsEmpty) Then
  begin
       buscar;
       PageControl1.ActivePageIndex := 0;
       //dbeNMCIDADE.SetFocus;
  End;
end;

procedure TfrmCadCedentes.imgLogoClick(Sender: TObject);
begin
  inherited;
  If (dmDados.cdsCedente .State in [dsInsert, dsEdit]) Then
  Begin
     Try
          If (OpenPictureDialog1.Execute) Then
             imgLogo.Picture.LoadFromFile(OpenPictureDialog1.FileName);
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar abrir imagem!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        End;
     End;
  End;
end;

procedure TfrmCadCedentes.dbeInscricaoEnter(Sender: TObject);
begin
  inherited;
    if not (dmDados.cdsCedente.IsEmpty) Then
      If (dmDados.cdsCedente.State in [dsInsert, dsEdit]) Then
      begin
        If (rbnTipo.ItemIndex = -1) Then
        begin
            rbnTipo.SetFocus;
            Exit;
        End;
        //
        Formatar_Campo;
        //
      End;
end;

procedure TfrmCadCedentes.EditBancoCodigoExit(Sender: TObject);
begin
      If (dmDados.cdsCedente.State in [dsInsert, dsEdit])
        and Not Empty(EditBancoCodigo.Text) Then
      begin
           If not uFuncoes.LOCALIZAR_BANCO(EditBancoCodigo.Text) Then
            begin
                 EditBancoCodigo.SetFocus;
                 raise Exception.Create('Código de banco não cadastro.')
            End
            Else
                dmDados.cdsCedenteBANCO_NOME.AsString :=
                   dmConsultas.qryBancos.FieldByName('BAN_NOME').AsString; 
      End;
     //
  inherited;
end;

procedure TfrmCadCedentes.Formatar_Campo;
begin
    If (dmDados.cdsCedente.State in [dsInsert, dsEdit]) Then
        If (rbnTipo.ItemIndex = 0) Then
           dmDados.cdsCedenteNUMERO_INSCRICAO.EditMask := '999.999.999-99;0;_'
        Else
           dmDados.cdsCedenteNUMERO_INSCRICAO.EditMask := '99.999.999/9999-99;0;_';
end;

procedure TfrmCadCedentes.EditBancoCodigoChange(Sender: TObject);
begin
  inherited;
    If (dmDados.cdsCedente.State in [dsInsert, dsEdit]) then
       If Empty(EditBancoCodigo.Text) Then
           dmDados.cdsCedenteBANCO_NOME.Clear;
end;

procedure TfrmCadCedentes.FormCreate(Sender: TObject);
begin
  inherited;
   If not (UFrmAdmin.admin) Then
   begin
     novo    := UFrmAdmin.aNovo;
     alterar := UFrmAdmin.aAlterar;
     apagar  := UFrmAdmin.aApagar;
     //
     If Empty(novo) or Empty(alterar) or Empty(apagar) Then
     begin
           dm.Verificar_Direitoa_Acesso(
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Cedentes...'));
           //
           novo    := UFrmAdmin.aNovo;
           alterar := UFrmAdmin.aAlterar;
           apagar  := UFrmAdmin.aApagar;
           //
     End;
     //
     FrmAdmin.Limpar_Acessos;
     //
     BtAdicionar.Visible := (novo = 'S');
     BtEditar.Visible    := (alterar = 'S');
     BtExcluir.Visible   := (apagar = 'S');
   End;

end;

procedure TfrmCadCedentes.dbeNrConvenioKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    if not( key in['0'..'9', #8, #13] ) then
        key:=#0;
end;

procedure TfrmCadCedentes.EditContaNumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    if not( key in['0'..'9', #8, #13] ) then
        key:=#0;
end;

procedure TfrmCadCedentes.EditContaNumeroExit(Sender: TObject);
begin
  inherited;
      If (dmDados.cdsCedente.State in [dsInsert, dsEdit])
       and  not uFuncoes.Empty(EditContaNumero.Text) Then
          EditContaNumero.Text := uFuncoes.StrZero(EditContaNumero.Text,10);
end;

end.
