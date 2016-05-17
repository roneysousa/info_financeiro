unit uFrmCadPromocoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls;

type
  TfrmCadPromocoes = class(TfrmCadastro)
    Label1: TLabel;
    dbeCodigo: TDBEdit;
    dsPromocoes: TDataSource;
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    gbDias: TGroupBox;
    cdsConsultarPRM_IDPRODUTO: TStringField;
    cdsConsultarPRO_DESCRICAO: TStringField;
    sbLocProduto: TSpeedButton;
    dbeVlSegunda: TDBEdit;
    dbeVlTerca: TDBEdit;
    dbeVlQuarta: TDBEdit;
    dbeVlQuinta: TDBEdit;
    dbeVlSexta: TDBEdit;
    dbeVlSabado: TDBEdit;
    dbeVlDomingo: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    Label10: TLabel;
    procedure dbeCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure BtAdicionarClick(Sender: TObject);
    procedure dsPromocoesDataChange(Sender: TObject; Field: TField);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dbeCodigoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbLocProdutoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
     novo, alterar, apagar : String;
     procedure tratabotoes;
     procedure buscar(aCodigo: String);
     procedure registro;
  public
    { Public declarations }
  end;

var
  frmCadPromocoes: TfrmCadPromocoes;

implementation

uses udmDados, Udm, uFuncoes, uFrmBuscaProdutos, uFrmBuscaDados,
  udmConsulta, UFrmAdmin;

{$R *.dfm}

procedure TfrmCadPromocoes.buscar(aCodigo: String);
begin
     Dm.FilterCDS(dmDados.cdsPromocoes, fsString, aCodigo);
end;

procedure TfrmCadPromocoes.dbeCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
      If not( key in['0'..'9',#8, #13] ) then
          key:=#0;
      //
     if (Dmdados.cdsPromocoes.State in [dsInsert] ) Then
       if (key = #13) and uFuncoes.Empty(dbeCodigo.Text) Then
        begin
             key:=#0;
             sbLocProdutoClick(Sender);
        End;
      //
    if (Dmdados.cdsPromocoes.State in [dsInsert, dsEdit] ) Then
      If (key = #13) and not uFuncoes.Empty(dbeCodigo.Text) Then
        begin
             Key := #0;
             dbeVlSegunda.SetFocus;
        End;
end;

procedure TfrmCadPromocoes.registro;
begin
     Dm.FilterCDS( dmDados.cdsPromocoes, fsString, uFuncoes.mscodigo('PRM_IDPRODUTO','PROMOCAO'));
end;

procedure TfrmCadPromocoes.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadPromocoes.BtAdicionarClick(Sender: TObject);
begin
  tratabotoes;
  //
  dmDados.cdsPromocoes.Append;
  dmDados.cdsPromocoesPRM_DTCADA.AsDateTime := Date();
  dmDados.cdsPromocoesPRM_CADUSU.AsInteger  := StrtoInt(UFrmAdmin.M_CDUSUA);
  //
  dmDados.cdsPromocoesPRM_VLSEGU.AsFloat := 0;
  dmDados.cdsPromocoesPRM_VLTERC.AsFloat := 0;
  dmDados.cdsPromocoesPRM_VLQUAR.AsFloat := 0;
  dmDados.cdsPromocoesPRM_VLQUIN.AsFloat := 0;
  dmDados.cdsPromocoesPRM_VLSEXT.AsFloat := 0;
  dmDados.cdsPromocoesPRM_VLSABA.AsFloat := 0;
  dmDados.cdsPromocoesPRM_VLDOMI.AsFloat := 0;    
  //
  dbeCodigo.SetFocus;
//  inherited;
end;

procedure TfrmCadPromocoes.dsPromocoesDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
       dbeCodigo.Enabled := dsPromocoes.DataSet.State in [dsInsert];
       gbDias.Enabled    := dsPromocoes.DataSet.State in [dsInsert, dsEdit];
       sbLocProduto.Enabled := dsPromocoes.DataSet.State in [dsInsert];
       //
end;

procedure TfrmCadPromocoes.BtEditarClick(Sender: TObject);
begin
  inherited;
  if (dmDados.cdsPromocoes.Active) AND (dmDados.cdsPromocoes.RecordCount > 0) then
  Begin
       tratabotoes;
       dmDados.cdsPromocoes.Edit;
       dmDados.cdsPromocoesPRM_DTALTE.AsDateTime := Date();
       dmDados.cdsPromocoesPRM_CADUSU.AsInteger  := StrtoInt(UFrmAdmin.M_CDUSUA);
       //
       dbeVlSegunda.SetFocus;
  End;

end;

procedure TfrmCadPromocoes.BtExcluirClick(Sender: TObject);
Var
   iUsuario : Integer;
   aCodigo : String;
begin
  if (dmDados.cdsPromocoes.Active) AND (dmDados.cdsPromocoes.RecordCount > 0) then
     If Application.MessageBox('Deseja excluir este registro?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       aCodigo  := uFuncoes.StrZero(dmDados.cdsPromocoesPRM_IDPRODUTO.AsString,7);
       iUsuario := StrtoInt(UFrmAdmin.M_CDUSUA);
       //
       dmDados.cdsPromocoes.Delete;
       dmDados.cdsPromocoes.ApplyUpdates(0);
       //
       If not (dm.IncluirTarefaUsuario(iUsuario,
          'Excluiu Produto Promoção : '+aCodigo+' *F*')) Then
            ShowMessage('Erro ao adicionar tarefa do usuário.');
       //
       REGISTRO;
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
  inherited;
end;


procedure TfrmCadPromocoes.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dmDados.cdsPromocoes.Cancel;
  //
  If (dmDados.cdsPromocoes.IsEmpty) Then
      Close;
end;

procedure TfrmCadPromocoes.BtGravarClick(Sender: TObject);
Var
     iUsuario : Integer;
begin
  {If uFuncoes.Empty(dbeValor.Text) Then
  Begin
       Application.MessageBox('Digite o valor promocional.','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeDescricao.SetFocus;
       Exit;
  End;}
  iUsuario := StrtoInt(UFrmAdmin.M_CDUSUA);
  //
  Try
     //
     tratabotoes;
     If (dmDados.cdsPromocoes.State in [dsInsert]) Then
      begin
        If not (dm.IncluirTarefaUsuario( iUsuario,
            'Incluiu Produto Promoção : '+uFuncoes.StrZero(dmDados.cdsPromocoesPRM_IDPRODUTO.AsString,7)+' *F*')) Then
               ShowMessage('Erro ao adicionar tarefa do usuário.');
      End
      Else
      begin
        If not (dm.IncluirTarefaUsuario( iUsuario,
            'Alterou Produto Promoção : '+uFuncoes.StrZero(dmDados.cdsPromocoesPRM_IDPRODUTO.AsString,7)+' *F*')) Then
              ShowMessage('Erro ao adicionar tarefa do usuário.');
      End;


     //
     dmDados.cdsPromocoes.ApplyUpdates(0);
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            dmDados.cdsMesas.Cancel;
        End;
  End;
  //
  inherited;

end;


procedure TfrmCadPromocoes.edtConsultarChange(Sender: TObject);
begin
  If not uFuncoes.Empty(edtConsultar.Text) Then
  begin
        with cdsConsultar do
        begin
             Close;
             CommandText := 'Select PM.PRM_IDPRODUTO, P.PRO_DESCRICAO from PROMOCAO PM ';
             CommandText := CommandText + ' INNER JOIN  PRODUTOS P ON P.PRO_CODIGO = PM.PRM_IDPRODUTO ';
             case rgConsultar.ItemIndex of
               0: CommandText := CommandText + ' where PM.PRM_IDPRODUTO = ' + edtConsultar.Text;
               1: CommandText := CommandText + ' where UPPER(P.PRO_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
             end;
             CommandText := CommandText + 'order by P.PRO_DESCRICAO';
             Open;
        End;  //fim-with
  End;     // fim-se
  inherited;
end;

procedure TfrmCadPromocoes.btnAlterarClick(Sender: TObject);
begin
  inherited;
  If not (cdsConsultar.IsEmpty) Then
  begin
       buscar(cdsConsultarPRM_IDPRODUTO.AsString);
       PageControl1.ActivePageIndex := 0;
  End;
end;

procedure TfrmCadPromocoes.dbeCodigoExit(Sender: TObject);
begin
  inherited;
   if (dmDados.cdsPromocoes.State in [dsInsert]) Then
    begin
      If not uFuncoes.Empty(dbeCodigo.Text) Then
      Begin
           //
           If not (dmConsultas.GetVerificaProduto(dmDados.cdsPromocoesPRM_IDPRODUTO.AsString)) Then
           Begin
                Application.MessageBox (PChar('Código de produto não cadastrado !'),
                    'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
                dbeCodigo.Clear;
                dbeCodigo.SetFocus;
                Exit;
           End
           Else
           begin
                If (dmDados.cdsPromocoes.State in [dsInsert] ) Then
                  if (dmDados.GetProdutoPromocao(dmDados.cdsPromocoesPRM_IDPRODUTO.AsString)) Then
                   begin
                       Application.MessageBox('Produto já cadastrado na promoção !','ATENÇÃO',
                       MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                       dbeCodigo.Clear;
                       dbeCodigo.SetFocus;
                       Exit;
                   End
                   Else
                       dmDados.cdsPromocoesPRM_IDPRODUTO.AsString :=
                         uFuncoes.StrZero(dmDados.cdsPromocoesPRM_IDPRODUTO.AsString,13);

           End;
      End;
    End;
end;

procedure TfrmCadPromocoes.FormShow(Sender: TObject);
begin
  inherited;
     Dm.RefreshCDS(Dm.CdsConfig);
     //
     registro;
     If (dmDados.cdsPromocoes.Active) and (dmDados.cdsPromocoes.IsEmpty) Then
      begin
         Dm.FilterCDS(dmDados.cdsPromocoes, fsString, '0');
         BtAdicionarClick(Sender);
     End;
     //Else


end;

procedure TfrmCadPromocoes.sbLocProdutoClick(Sender: TObject);
begin
  inherited;
     //
     dbeCodigo.SetFocus;
      with TfrmBuscaProduto.create(self) do
        try
            if (showmodal = mrOK) Then
             begin
               if not (cdsBusca.IsEmpty ) Then
                begin
                    dmDados.cdsPromocoesPRM_IDPRODUTO.AsString :=
                      cdsBuscaPRO_CODIGO.AsString;
                    dbeVlSegunda.SetFocus;    
                End;
             End
             Else
                dbeCodigo.SetFocus;
        finally
            free;
        End;
end;


procedure TfrmCadPromocoes.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Promoções...'));
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
     //

end;

end.
