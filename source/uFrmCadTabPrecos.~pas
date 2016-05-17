unit uFrmCadTabPrecos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, Mask, DBCtrls, DBClient, Provider, DB,
  SqlExpr, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls;

type
  TfrmCadTabelaPrecos = class(TfrmCadastro)
    Label1: TLabel;
    dbeDescricao: TDBEdit;
    dsTabPrecos: TDataSource;
    Label2: TLabel;
    DBText1: TDBText;
    cdsConsultarPRC_CODIGO: TIntegerField;
    cdsConsultarPRC_DESCRICAO: TStringField;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
     novo, alterar, apagar : String;    
     procedure tratabotoes;
     procedure buscar;
     procedure Registro;
  public
    { Public declarations }
  end;

var
  frmCadTabelaPrecos: TfrmCadTabelaPrecos;

implementation

uses uDm2, Udm, uFuncoes, UFrmAdmin;

{$R *.dfm}

{ TfrmCadTabelaPrecos }

procedure TfrmCadTabelaPrecos.buscar;
begin
  With dm2.cdsTabPreco do
  Begin
       Close;
       Params.ParamByName('pCODIGO').AsString := cdsConsultar.FieldByName('PRC_CODIGO').AsString;
       Open;
  End;
end;

procedure TfrmCadTabelaPrecos.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadTabelaPrecos.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.parametros;
  dm2.cdsTabPreco.Append;
  dm2.cdsTabPreco.FieldByName('PRC_CODIGO').AsInteger :=
     Dm.CdsConfigCFG_TABPRECO.AsInteger + 1;
  //
  dm2.cdsTabPreco.FieldByName('PRC_DESC1').AsFloat := 0;
  dm2.cdsTabPreco.FieldByName('PRC_DESC2').AsFloat := 0;
  dm2.cdsTabPreco.FieldByName('PRC_DESC3').AsFloat := 0;
  dm2.cdsTabPreco.FieldByName('PRC_DESC4').AsFloat := 0;
  dm2.cdsTabPreco.FieldByName('PRC_DESC5').AsFloat := 0;
  dm2.cdsTabPreco.FieldByName('PRC_DESC6').AsFloat := 0;
  dm2.cdsTabPreco.FieldByName('PRC_ACRE1').AsFloat := 0;
  dm2.cdsTabPreco.FieldByName('PRC_ACRE2').AsFloat := 0;
  //
  dbeDescricao.SetFocus;
end;

procedure TfrmCadTabelaPrecos.BtEditarClick(Sender: TObject);
begin
  inherited;
  if (dm2.cdsTabPreco.RecordCount > 0) then
  Begin
      tratabotoes;
      dm2.cdsTabPreco.Edit;
      dbeDescricao.SetFocus;
  End;
end;

procedure TfrmCadTabelaPrecos.Registro;
begin
  With dm2.cdsTabPreco do
  Begin
       Close;
       Params.ParamByName('pCODIGO').AsInteger := uFuncoes.mvcodigo('PRC_CODIGO','TAB_PRECOS') ;
       Open;
  End;
end;

procedure TfrmCadTabelaPrecos.FormShow(Sender: TObject);
begin
  inherited;
     dm.parametros;
     If (Dm.CdsConfigCFG_TABPRECO.AsInteger = 0) Then
     begin
          dm2.cdsTabPreco.Open;
          BtAdicionarClick(Self);
     End
     Else
          Registro;
end;

procedure TfrmCadTabelaPrecos.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm2.cdsTabPreco.Cancel;
  If (dm2.cdsTabPreco.RecordCount = 0) Then
     Close;
end;

procedure TfrmCadTabelaPrecos.BtGravarClick(Sender: TObject);
begin
  If uFuncoes.Empty(dbeDescricao.Text) Then
  Begin
       Application.MessageBox('Digite a descrição!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeDescricao.SetFocus;
       Exit;
  End;
  //
  Try
    //
    tratabotoes;
    if (dm2.cdsTabPreco.State in [dsinsert]) then
    begin
      dm.parametros;
      dm.CdsConfig.Edit;
      dm.CdsConfigCFG_TABPRECO.AsInteger   := dm.CdsConfigCFG_TABPRECO.AsInteger+1;
      dm2.cdsTabPrecoPRC_CODIGO.AsInteger  := dm.CdsConfigCFG_TABPRECO.AsInteger;
      dm.CdsConfig.ApplyUpdates(0);
    end;
    //
    dm2.cdsTabPreco.Post;
    dm2.cdsTabPreco.ApplyUpdates(0);
    //
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm2.cdsTabPreco.Cancel;
        End;
  End;
  //
  inherited;
end;

procedure TfrmCadTabelaPrecos.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
  begin
        with cdsConsultar do
        begin
             Close;
             CommandText := 'Select PRC_CODIGO, PRC_DESCRICAO from TAB_PRECOS ';
             case rgConsultar.ItemIndex of
               0: CommandText := CommandText + ' where PRC_CODIGO = '+ edtConsultar.Text;
               1: CommandText := CommandText + ' where UPPER(PRC_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
             end;
             CommandText := CommandText + 'order by PRC_DESCRICAO';
             Open;
        end;  // fim-with
  end       // fim-se
  Else
     cdsConsultar.Close;
end;

procedure TfrmCadTabelaPrecos.btnAlterarClick(Sender: TObject);
begin
  inherited;
  If not (cdsConsultar.IsEmpty) Then
  begin
       buscar;
       PageControl1.ActivePageIndex := 0;
       dbeDescricao.SetFocus;
  End;
end;

procedure TfrmCadTabelaPrecos.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Preços...'));
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

end.
