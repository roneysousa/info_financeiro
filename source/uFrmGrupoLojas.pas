unit uFrmGrupoLojas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, FMTBcd, Grids, DBGrids, DB, DBClient,
  Provider, SqlExpr, Buttons;

type
  TfrmGrupoLojas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    cmbGrupos: TComboBox;
    dstConsultar: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    dsConsultar: TDataSource;
    DBGrid1: TDBGrid;
    dstConsultarCLI_CODIGO: TIntegerField;
    dstConsultarCLI_FANTASIA: TStringField;
    dstConsultarCLI_CGC: TStringField;
    dstConsultarCLI_NRBOX: TStringField;
    dstConsultarCLI_TIPOPESSOA: TStringField;
    dstConsultarCLI_CDGRUPO: TIntegerField;
    cdsConsultarCLI_CODIGO: TIntegerField;
    cdsConsultarCLI_FANTASIA: TStringField;
    cdsConsultarCLI_CGC: TStringField;
    cdsConsultarCLI_NRBOX: TStringField;
    cdsConsultarCLI_TIPOPESSOA: TStringField;
    cdsConsultarCLI_CDGRUPO: TIntegerField;
    BtGravar: TBitBtn;
    BtCancelar: TBitBtn;
    BitBtn1: TBitBtn;
    lblRegistros: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
    procedure BtEditarClick(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dspConsultarGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure cmbGruposEnter(Sender: TObject);
  private
    { Private declarations }
    procedure Carregar_Grupos;
    Procedure Consulta_Clientes;
  public
    { Public declarations }
  end;

var
  frmGrupoLojas: TfrmGrupoLojas;

implementation

uses Udm, udmConsulta, uFuncoes;

{$R *.dfm}

{ TfrmGrupoLojas }

procedure TfrmGrupoLojas.Carregar_Grupos;
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

procedure TfrmGrupoLojas.Consulta_Clientes;
Var
   aTexto, aCampo : String;
   iGrupo : Integer;
begin
     aTexto := 'select CL.CLI_CODIGO, CLI_TIPOPESSOA, CL.CLI_FANTASIA, CL.CLI_CGC, CL.CLI_NRBOX, CL.CLI_CDGRUPO, ';
     aTexto := aTexto + 'CL.SIT_CODIGO from CLIENTES CL';
     aTexto := aTexto + ' Where (CL.CLI_CDGRUPO = :pCDGRUPO) ';
     aCampo := 'CL.CLI_NRBOX';
     aTexto := aTexto + ' order by '+aCampo;
     //
     iGrupo := dm.GetCodigoGrupo(cmbGrupos.Text);
     //
     With cdsConsultar do
      begin
           DisableControls;
           Close;
           //
           CommandText := aTexto;
           Params.ParamByName('pCDGRUPO').AsInteger :=  iGrupo;
           //
           Open;
           //
           If not (IsEmpty) Then
               BtGravar.Enabled  := True
           Else
               BtGravar.Enabled  := False;
           //
           EnableControls;
      End;
end;

procedure TfrmGrupoLojas.FormShow(Sender: TObject);
begin
    Carregar_Grupos;
end;

procedure TfrmGrupoLojas.BtSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmGrupoLojas.dsConsultarDataChange(Sender: TObject;
  Field: TField);
begin
    //BtGravar.Enabled  := dsConsultar.DataSet.State in [dsEdit];
    //BtCancelar.Enabled := dsConsultar.DataSet.State in [dsEdit];
    //
    If not (cdsConsultar.IsEmpty) Then
       lblRegistros.Caption := 'Registro(s) :' +
                   InttoStr(dsConsultar.DataSet.RecNo)+'/'+
                   InttoStr(dsConsultar.DataSet.RecordCount);
end;

procedure TfrmGrupoLojas.BtEditarClick(Sender: TObject);
begin
     if not (cdsConsultar.IsEmpty) and
        (cdsConsultar.State in [dsBrowse]) Then
      begin
           cdsConsultar.edit;
           DBGrid1.SetFocus;
      End;
end;

procedure TfrmGrupoLojas.DBGrid1Enter(Sender: TObject);
begin
     DBGrid1.SelectedIndex := 2;
end;

procedure TfrmGrupoLojas.BtCancelarClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmGrupoLojas.BtGravarClick(Sender: TObject);
begin
    if not (cdsConsultar.IsEmpty) Then
       //(cdsConsultar.State in [dsEdit]) Then
       begin
            dm.Start;
            try
                cdsConsultar.ApplyUpdates(0);
                Dm.Comit(Dm.Transc);
                //
                Application.MessageBox('Registro(s) gravados com sucesso.',
                   'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            Except;
                Dm.Rollback;
            End;
       End;
end;

procedure TfrmGrupoLojas.BitBtn1Click(Sender: TObject);
begin
     if not uFuncoes.Empty(cmbGrupos.Text) Then
          Consulta_Clientes
      Else
         cmbGrupos.SetFocus;
end;

procedure TfrmGrupoLojas.dspConsultarGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'CLIENTES';
end;

procedure TfrmGrupoLojas.cmbGruposEnter(Sender: TObject);
begin
      lblRegistros.Caption := 'Registro(s) :';
      if not (cdsConsultar.IsEmpty) Then
         cdsConsultar.close;
end;

end.
