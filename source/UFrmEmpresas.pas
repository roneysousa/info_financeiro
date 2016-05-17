unit UFrmEmpresas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, db;

type
  TFrmEmpresas = class(TForm)
    Label1: TLabel;
    dbeNRCNPJ: TDBEdit;
    Label2: TLabel;
    dbeNMFANT: TDBEdit;
    Label3: TLabel;
    dbeNMRAZA: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Panel1: TPanel;
    BtAdicionar: TBitBtn;
    BtEditar: TBitBtn;
    BtExcluir: TBitBtn;
    BtPesquisar: TBitBtn;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    DBText1: TDBText;
    Label8: TLabel;
    procedure BtSairClick(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure BtPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeNRCNPJExit(Sender: TObject);
    procedure dbeNRCNPJKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure tratabotoes;
  public
    { Public declarations }
  end;

var
  FrmEmpresas: TFrmEmpresas;

implementation

uses Udm, UFrmPesqEmpresa, uFuncoes;

{$R *.dfm}

procedure TFrmEmpresas.BtSairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmEmpresas.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TFrmEmpresas.BtAdicionarClick(Sender: TObject);
begin
  tratabotoes;
  dm.parametros;
  dm.CdsEmpresas.Append;
  dbeNRCNPJ.SetFocus;
  dm.CdsEmpresasEMP_CODIGO.Value := dm.CdsConfigCFG_EMPRESA.Value+1;
end;

procedure TFrmEmpresas.BtEditarClick(Sender: TObject);
begin
  tratabotoes;
  dm.CdsEmpresas.Edit;
end;

procedure TFrmEmpresas.BtExcluirClick(Sender: TObject);
begin
  if dm.CdsEmpresas.RecordCount > 0 then
     if application.MessageBox('Deseja excluir este empresa','Exclusão de empresa',mb_yesno) = id_yes then
       begin
       dm.CdsEmpresas.Delete;
       dm.CdsEmpresas.ApplyUpdates(0);
       dm.CdsEmpresas.Close;
       dm.SdsEmpresas.ParamByName('pCodigo').AsInteger := uFuncoes.mvcodigo('EMP_CODIGO','EMPRESAS');
       dm.CdsEmpresas.Open;
       end
  else
      showmessage('Não ha registro a ser excluido');
end;

procedure TFrmEmpresas.BtCancelarClick(Sender: TObject);
begin
  tratabotoes;
  dm.CdsEmpresas.Cancel;
end;

procedure TFrmEmpresas.BtGravarClick(Sender: TObject);
begin
  If uFuncoes.Empty(dbeNRCNPJ.Text) Then
  Begin
       Application.MessageBox('Digite o número do CNPJ!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeNRCNPJ.SetFocus;
       Exit;
  End;
  //
  If uFuncoes.Empty(dbeNMFANT.Text) Then
  Begin
       Application.MessageBox('Digite o nome de fantasia!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeNMFANT.SetFocus;
       Exit;
  End;
  //
  If uFuncoes.Empty(dbeNMRAZA.Text) Then
  Begin
       Application.MessageBox('Digite a razão social!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeNMRAZA.SetFocus;
       Exit;
  End;
  //
  Try
    tratabotoes;
    //
    if dm.CdsEmpresas.State in [dsinsert] then
    begin
      dm.parametros;
      dm.CdsConfig.Edit;
      dm.CdsConfigCFG_EMPRESA.Value := dm.CdsConfigCFG_EMPRESA.Value+1;
      dm.CdsEmpresasEMP_CODIGO.Value := dm.CdsConfigCFG_EMPRESA.Value;
      dm.CdsConfig.ApplyUpdates(0);
      dm.CdsConfig.Close;
    end;
    dm.CdsEmpresas.ApplyUpdates(0);
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm.CdsEmpresas.Cancel;
        End;
  End;  
end;

procedure TFrmEmpresas.BtPesquisarClick(Sender: TObject);
begin
  with TFrmPesqEmpresas.create(self) do
  try
    showmodal
  finally
    free;
  end;

end;

procedure TFrmEmpresas.FormCreate(Sender: TObject);
begin
  dm.CdsEmpresas.Close;
  dm.SdsEmpresas.ParamByName('pCODIGO').AsInteger := uFuncoes.mvcodigo('EMP_CODIGO','EMPRESAS');
  dm.CdsEmpresas.Open;
  //
  dm.CdsBairros.Open;
  dm.CdsCidades.Open;
end;


procedure TFrmEmpresas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if dm.CdsEmpresas.State in [dsedit,dsinsert] then
     begin
       if application.MessageBox('Deseja cancelar edição','Saida sem confirmação',mb_yesno) = id_no then
          canclose := false
       else
         dm.CdsEmpresas.Cancel;
     end;
end;

procedure TFrmEmpresas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dm.CdsBairros.Close;
     dm.CdsCidades.Close;      
end;

procedure TFrmEmpresas.dbeNRCNPJExit(Sender: TObject);
begin
    If (dm.CdsEmpresas.State in [dsInsert])
     and not uFuncoes.Empty(dbeNRCNPJ.Text) Then
      try
        If not (uFuncoes.CGC(uFuncoes.StrZero(dbeNRCNPJ.Text,14))) Then
        Begin
            MessageDlg('CNPJ inválido!!!', mtInformation, [mbOk], 0);
            dbeNRCNPJ.Clear;
            dbeNRCNPJ.SetFocus;
            Exit;
        End;
      Except
            dbeNRCNPJ.Clear;
            dbeNRCNPJ.SetFocus;
      End;
end;

procedure TFrmEmpresas.dbeNRCNPJKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #27) and (dm.CdsEmpresas.State in [dsInsert, dsEdit] ) Then
     Begin
          Key := #0;
          BtCancelarClick(Sender);
     End;
end;

end.
