unit uFrmConfigurarBoletos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, CurrEdit;

type
  TfrmConfiguraBoletos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnConfimar: TBitBtn;
    btnCancelar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbeDesconto: TCurrencyEdit;
    dbeJuros: TCurrencyEdit;
    dbeMulta: TCurrencyEdit;
    edtMensagem: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cmbConta: TComboBox;
    Label10: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConfimarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Carregar_Contas;
  public
    { Public declarations }
  end;

var
  frmConfiguraBoletos: TfrmConfiguraBoletos;
  W_PEJURO, W_PEMULT, W_PEDESC : DOUBLE;
  W_NMCEDENTE : String;

implementation

uses Udm, udmDados, udmConsulta, uFuncoes;

{$R *.dfm}

procedure TfrmConfiguraBoletos.btnCancelarClick(Sender: TObject);
begin
      ModalResult := mrCancel;
      Close;
end;

procedure TfrmConfiguraBoletos.FormCreate(Sender: TObject);
begin
     W_PEJURO := 0;
     W_PEMULT := 0;
     W_PEDESC := 0;
end;

procedure TfrmConfiguraBoletos.btnConfimarClick(Sender: TObject);
begin
     if uFuncoes.Empty(cmbConta.Text) Then
       begin
            Application.MessageBox(PChar('Selecione o cedente.'),
               'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            cmbConta.SetFocus;
            Exit;
       End;
     W_PEJURO := dbeJuros.Value;
     W_PEMULT := dbeMulta.Value;
     W_PEDESC := dbeDesconto.Value;
     W_NMCEDENTE := cmbConta.Text;
     //
     ModalResult := mrOk;
end;

procedure TfrmConfiguraBoletos.Carregar_Contas;
begin
      dm.RefreshCDS(dmConsultas.cdsListaCedentes);
      //
      With dmConsultas.cdsListaCedentes do
        begin
             first;
             cmbConta.Clear;
             While not (Eof) do
              begin
                   cmbConta.Items.Add(FieldByName('CEDENTE_NOME').AsString);
                   //
                   Next;
              End;
        End;
end;

procedure TfrmConfiguraBoletos.FormShow(Sender: TObject);
begin
      Carregar_Contas();
end;

end.
