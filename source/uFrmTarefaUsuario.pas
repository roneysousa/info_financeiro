unit uFrmTarefaUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, FMTBcd, DB, SqlExpr,
  DBCtrls, DBClient, Provider;

type
  TfrmTarefaUsuarios = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    grdConsultar: TDBGrid;
    BtSair: TBitBtn;
    dsConsultar: TDataSource;
    datasetConsultar: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    cdsConsultarTAR_USUARIO: TIntegerField;
    cdsConsultarTAR_DTMOVI: TDateField;
    DBNavigator1: TDBNavigator;
    mmoTarefas: TMemo;
    cdsDetalhes: TClientDataSet;
    cdsDetalhesTAR_USUARIO: TIntegerField;
    cdsDetalhesTAR_DTMOVI: TDateField;
    lblUsuario: TLabel;
    cdsDetalhesTAR_ACAO: TStringField;
    cdsDetalhesTAR_COMPUTADOR: TStringField;
    procedure BtSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    procedure Consulta(Id_Usuario : integer);
    procedure Detalhes_Tarefa(Id_Usuario : integer; aData : TDate);
  public
    { Public declarations }
  end;

var
  frmTarefaUsuarios: TfrmTarefaUsuarios;

implementation

uses udm, uFuncoes;

{$R *.dfm}

procedure TfrmTarefaUsuarios.BtSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmTarefaUsuarios.Consulta(Id_Usuario: integer);
begin
      With cdsConsultar do
        begin
             DisableControls;
             Close;
             CommandText := 'Select TU.tar_usuario, TU.tar_dtmovi from TAREFAS_USUARIOS TU Where (TU.TAR_USUARIO = :pUSUARIO) Group by TU.tar_usuario, TU.tar_dtmovi Order by TU.TAR_DTMOVI Desc ';
             Params.ParamByName('pUSUARIO').AsInteger := Id_Usuario;
             Open;
             EnableControls;
        End;
end;

procedure TfrmTarefaUsuarios.Detalhes_Tarefa(Id_Usuario : integer; aData: TDate);
begin
     With cdsDetalhes do
      begin
             DisableControls;
             Close;
             Params.ParamByName('pUSUARIO').AsInteger := Id_Usuario;
             Params.ParamByName('pdtmovi').AsDate     := aData;
             Open;
             EnableControls;
             //
             If not (IsEmpty) Then
              begin
                   mmoTarefas.Lines.Clear;
                   First;
                   While not (Eof) do
                    begin
                         mmoTarefas.Lines.Add(FieldByName('TAR_ACAO').AsString + ' - PC : ' + FieldByName('TAR_COMPUTADOR').AsString);
                         //
                         next;
                    End;
              End;
      End;
end;

procedure TfrmTarefaUsuarios.FormShow(Sender: TObject);
begin
     Consulta(dm.cdsUsuariosSEN_CODIGO.AsInteger);
     //
     lblUsuario.Caption := 'Usuário : ' + dm.cdsUsuariosSEN_NOME.AsString;
end;

procedure TfrmTarefaUsuarios.dsConsultarDataChange(Sender: TObject;
  Field: TField);
begin
     Detalhes_Tarefa(cdsConsultarTAR_USUARIO.AsInteger, cdsConsultarTAR_DTMOVI.AsDateTime);
end;

End.
