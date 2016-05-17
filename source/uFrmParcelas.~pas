unit uFrmParcelas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  TfrmParcelas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    btClonar: TBitBtn;
    Panel3: TPanel;
    dbgridParcelas: TDBGrid;
    lbl_NMMODA: TLabel;
    lbl_VLTOTAL: TLabel;
    lblCodigo: TLabel;
    edtCDCLIE: TEdit;
    spLocCliente: TSpeedButton;
    lblNome: TLabel;
    edtNMCLIE: TEdit;
    procedure BtCancelarClick(Sender: TObject);
    procedure dbgridParcelasEnter(Sender: TObject);
    procedure dbgridParcelasColEnter(Sender: TObject);
    procedure dbgridParcelasColExit(Sender: TObject);
    procedure dbgridParcelasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btClonarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCDCLIEChange(Sender: TObject);
    procedure edtCDCLIEExit(Sender: TObject);
    procedure edtCDCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure spLocClienteClick(Sender: TObject);
  private
    procedure VALOR_VENDA;
    procedure ALTUALIZAR_PARCELAS;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParcelas: TfrmParcelas;
  W_NRPARC, M_CDMODA : Integer;
  M_VLCONT, M_TOMODA, M_TOENTR : Real;
  M_TPMODA : String;
  fecha: Boolean;
  
implementation

uses uDm2, uFuncoes, udmConsulta, uLocCliente;

{$R *.dfm}

Function GetStateK (Key: integer): boolean;
begin
  Result := Odd (GetKeyState (Key));
end;

procedure TfrmParcelas.BtCancelarClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmParcelas.dbgridParcelasEnter(Sender: TObject);
begin
     if uFuncoes.Empty(dm2.cdsParcelasPAR_VENCIMENTO.AsString) Then
     begin
          dbgridParcelas.SelectedIndex := 1;
          Exit
     End;
     //
     if uFuncoes.Empty(dm2.cdsParcelasPAR_BANCO.AsString) Then
     begin
         dbgridParcelas.SelectedIndex := 3;
         Exit;
     End;
     if uFuncoes.Empty(dm2.cdsParcelasPAR_AGENCIA.AsString) Then
     begin
        dbgridParcelas.SelectedIndex := 4;
         Exit;
     End;
     if uFuncoes.Empty(dm2.cdsParcelasPAR_CONTA.AsString) Then
     begin
        dbgridParcelas.SelectedIndex := 5;
         Exit;
     End;
     if uFuncoes.Empty(dm2.cdsParcelasPAR_CHEQUE.AsString) Then
     begin
         dbgridParcelas.SelectedIndex := 6;
         Exit;
     End;
end;

procedure TfrmParcelas.dbgridParcelasColEnter(Sender: TObject);
begin
    If (dm2.cdsParcelasPAR_NRPARCELA.AsInteger > 0) Then
      dbgridParcelas.Options := dbgridParcelas.Options + [dgEditing]
    else
    begin
        dbgridParcelas.Options := dbgridParcelas.Options - [dgEditing];
        BtGravar.SetFocus;
    End;
    //
     If (uFuncoes.Empty(dm2.cdsParcelasPAR_NRPARCELA.AsString)) Then
     begin
           dm2.cdsParcelas.Delete;
           dm2.cdsParcelas.First;
     End;
    //
    If (dbgridParcelas.SelectedField = dm2.cdsParcelas.FieldByName('PAR_NRPARCELA')) Then
        dbgridParcelas.SelectedIndex := 1;
    //
   If (dbgridParcelas.SelectedField = dm2.cdsParcelas.FieldByName('PAR_AGENCIA'))
     and not uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_BANCO').AsString) then
   begin
        dm2.cdsParcelas.Edit;
        dm2.cdsParcelas.FieldByName('PAR_BANCO').AsString :=
            uFuncoes.StrZero(dm2.cdsParcelas.FieldByName('PAR_BANCO').AsString,3);
        //
        If (uFuncoes.LOCALIZAR_BANCO(dm2.cdsParcelas.FieldByName('PAR_BANCO').AsString) = False) Then
        begin
             Application.MessageBox('Código de banco não cadastrado!!!','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             dm2.cdsParcelas.FieldByName('PAR_BANCO').Clear;
             dbgridParcelas.SelectedIndex := 3;
             Exit;
        End;
   End;
   //
   If (dbgridParcelas.SelectedField = dm2.cdsParcelas.FieldByName('PAR_BANCO'))
     and not uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_VALOR').AsString) then
         VALOR_VENDA;
   //
   If (dbgridParcelas.SelectedField = dm2.cdsParcelas.FieldByName('PAR_VALOR'))
     and not uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_VALOR').AsString) then
         VALOR_VENDA;
   //
   If (dbgridParcelas.SelectedField = dm2.cdsParcelas.FieldByName('PAR_CHEQUE'))
      and not uFuncoes.Empty(dm2.cdsParcelas.FieldByName('PAR_CONTA').AsString) Then
   Begin
        dm2.cdsParcelas.Edit;
        dm2.cdsParcelas.FieldByName('PAR_CONTA').AsString :=
            uFuncoes.StrZero(dm2.cdsParcelas.FieldByName('PAR_CONTA').AsString,10);
   End;
   //
   If (dbgridParcelas.SelectedField = dm2.cdsParcelas.FieldByName('PAR_VENCIMENTO'))
      and not uFuncoes.Empty(dm2.cdsParcelas.FieldByName('PAR_CHEQUE').AsString) Then
   Begin
        dm2.cdsParcelas.Edit;
        dm2.cdsParcelas.FieldByName('PAR_CHEQUE').AsString :=
            uFuncoes.StrZero(dm2.cdsParcelas.FieldByName('PAR_CHEQUE').AsString,10);
   End;
   //
end;

procedure TfrmParcelas.VALOR_VENDA;
begin
   If (dm2.cdsParcelas.Active  = True) Then
   Begin
     W_NRPARC := dm2.cdsParcelas.FieldByname('PAR_NRPARCELA').AsInteger;
     //
     dm2.cdsParcelas.DisableControls;
     dm2.cdsParcelas.First;
     M_VLCONT := 0;
     While not (dm2.cdsParcelas.Eof) do
     begin
         dm2.cdsParcelas.Edit;
         //
         M_VLCONT := M_VLCONT + dm2.cdsParcelas.FieldByname('PAR_VALOR').AsCurrency;
         dm2.cdsParcelas.Next;
     End;
     //
     dm2.cdsParcelas.Locate('PAR_NRPARCELA',W_NRPARC,[]);
     dm2.cdsParcelas.EnableControls;
     //
     //lbl_VLTOTAL.Caption := FormatFloat('###,###,##0.#0', M_VLCONT);
  End;
end;

procedure TfrmParcelas.dbgridParcelasColExit(Sender: TObject);
begin
    If (dbgridParcelas.SelectedField = dm2.cdsParcelas.FieldByName('PAR_VENCIMENTO'))
      and not uFuncoes.Empty(dm2.cdsParcelas.FieldByName('PAR_VENCIMENTO').AsString) Then
    Begin
      If (dm2.cdsParcelas.FieldByName('PAR_VENCIMENTO').AsDateTime < Date()) Then
      Begin
           Application.MessageBox(PChar('Data de vencimento deve ser '+#13'maior ou igual a do movimento!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm2.cdsParcelas.FieldByName('PAR_VENCIMENTO').AsDateTime := Date();
           dbgridParcelas.SelectedIndex := 1;
           Exit;
      End;
   End;
   //
   If (dbgridParcelas.SelectedField <> dm2.cdsParcelas.FieldByName('PAR_CHEQUE'))
      and not uFuncoes.Empty(dm2.cdsParcelas.FieldByName('PAR_CHEQUE').AsString) Then
   Begin
        dm2.cdsParcelas.Edit;
        dm2.cdsParcelas.FieldByName('PAR_CHEQUE').AsString :=
            uFuncoes.StrZero(dm2.cdsParcelas.FieldByName('PAR_CHEQUE').AsString,10);
   End;
end;

procedure TfrmParcelas.dbgridParcelasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (Shift = [ssCtrl]) and (Key = 46) Then
          KEY := 0;
     //
     If (DM2.cdsParcelas.Active = True) Then
     Begin
         IF (KEY = 38) or (key = 40) then // avalio se é seta para cima ou para baixo;
         Begin
             VALOR_VENDA;
             //
             If (dm2.cdsParcelas.Eof) Then
                dm2.cdsParcelas.First;
         End;
     End;
     //
     case key of
        13 : Key := 9;
     end;
end;

procedure TfrmParcelas.BtGravarClick(Sender: TObject);
Var
    V_NRPARC : Integer;
begin
     //
     If (M_TPMODA = 'P') and Empty(edtCDCLIE.Text) Then
      begin
           edtCDCLIE.SetFocus;
           raise Exception.Create('Digite o código do cliente.');
      End;
     //
  Try
     dm2.cdsParcelas.DisableControls;
     dm2.cdsParcelas.First;
     M_VLCONT := 0;
     While not (dm2.cdsParcelas.Eof) do
     begin
         dm2.cdsParcelas.Edit;
         //
         If (uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_VALOR').AsString)
           or (dm2.cdsParcelas.FieldByname('PAR_VALOR').AsCurrency = 0))
           or (uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_VENCIMENTO').AsString)) Then
         begin
              V_NRPARC := dm2.cdsParcelas.FieldByname('PAR_NRPARCELA').AsInteger;
              dm2.cdsParcelas.EnableControls;
              dm2.cdsParcelas.Locate('PAR_NRPARCELA',V_NRPARC,[]);
              dbgridParcelas.SetFocus;
              Exit;
              break;
         End;
         //
         If not (uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_BANCO').AsString)) Then
         Begin
              If (uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_AGENCIA').AsString))
                or (uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_CONTA').AsString))
                or (uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_CHEQUE').AsString)) then
              begin
                    V_NRPARC := dm2.cdsParcelas.FieldByname('PAR_NRPARCELA').AsInteger;
                    dm2.cdsParcelas.EnableControls;
                    dm2.cdsParcelas.Locate('PAR_NRPARCELA',V_NRPARC,[]);
                    dbgridParcelas.SetFocus;
                    Exit;
                    break;
              End;
         End;
         //
         M_VLCONT := M_VLCONT + dm2.cdsParcelas.FieldByname('PAR_VALOR').AsCurrency;
         //
         dm2.cdsParcelas.Next;
     End;
     //
     dm2.cdsParcelas.EnableControls;
     // testa se os valores das modalidades são maiores que zero
     M_TOENTR := 0;
     dm2.cdsParcelas.DisableControls;
     dm2.cdsParcelas.First;
     //
     While not (dm2.cdsParcelas.Eof) do
     begin
          dm2.cdsParcelas.Edit;
          M_TOENTR := M_TOENTR+dm2.cdsParcelas.FieldByName('PAR_VALOR').AsCurrency;
          // proximo
          dm2.cdsParcelas.Next;
     End;
     dm2.cdsParcelas.EnableControls;
     //  Se valor digitado menor que o valor da modalidade
     //If (M_TOENTR < M_TOMODA) Then
     //If (uFuncoes.Arredondar(M_TOENTR,2) < uFuncoes.Arredondar(StrtoFloat(lbl_VLTOTAL.Caption),2) ) Then
     If (uFuncoes.Arredondar(M_TOENTR,2) < uFuncoes.Arredondar(dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency,2) ) Then
     begin
          Application.MessageBox(PChar('O valor de entrada está menor que'+#13
                                   +'o valor total da modalidade!!!'),'ATENÇÃO', MB_OK+MB_ICONSTOP);
          dm2.cdsParcelas.Last;
          dbgridParcelas.SetFocus;
          dbgridParcelas.SelectedIndex := 2;
          exit;                     // sair da procedure.
     end;
     //  Se valor digitado maior que o valor da modalidade
     //If (M_TOENTR > M_TOMODA) Then
     If (uFuncoes.Arredondar(M_TOENTR,2) > uFuncoes.Arredondar(dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency,2) ) Then
     begin
          Application.MessageBox(PChar('O valor de entrada está maior que'+#13
                                   +'o valor total da modalidade!!!'),'ATENÇÃO', MB_OK+MB_ICONSTOP);
          dm2.cdsParcelas.Last;
          dbgridParcelas.SetFocus;
          dbgridParcelas.SelectedIndex := 2;
          exit;                     // sair da procedure.
     end;
     //
     If (M_TPMODA = 'H') Then
     begin
          dm2.cdsParcelas.DisableControls;
          dm2.cdsParcelas.First;
          //
          While not (dm2.cdsParcelas.Eof) do
          begin
               // Banco
               If uFuncoes.Empty(dm2.cdsParcelas.FieldByName('PAR_BANCO').AsString) Then
               Begin
                    V_NRPARC := dm2.cdsParcelas.FieldByname('PAR_NRPARCELA').AsInteger;
                    dm2.cdsParcelas.EnableControls;
                    dm2.cdsParcelas.Locate('PAR_NRPARCELA',V_NRPARC,[]);
                    dbgridParcelas.SetFocus;
                    Exit;
                    break;
               End;
               // agencia
               If uFuncoes.Empty(dm2.cdsParcelas.FieldByName('PAR_AGENCIA').AsString) Then
               Begin
                    V_NRPARC := dm2.cdsParcelas.FieldByname('PAR_NRPARCELA').AsInteger;
                    dm2.cdsParcelas.EnableControls;
                    dm2.cdsParcelas.Locate('PAR_NRPARCELA',V_NRPARC,[]);
                    dbgridParcelas.SetFocus;
                    Exit;
                    break;
               End;
               // Nº Conta
               If uFuncoes.Empty(dm2.cdsParcelas.FieldByName('PAR_CONTA').AsString) Then
               Begin
                    V_NRPARC := dm2.cdsParcelas.FieldByname('PAR_NRPARCELA').AsInteger;
                    dm2.cdsParcelas.EnableControls;
                    dm2.cdsParcelas.Locate('PAR_NRPARCELA',V_NRPARC,[]);
                    dbgridParcelas.SetFocus;
                    Exit;
                    break;
               End;
               // Nº Cheque
               If uFuncoes.Empty(dm2.cdsParcelas.FieldByName('PAR_CHEQUE').AsString) Then
               Begin
                    V_NRPARC := dm2.cdsParcelas.FieldByname('PAR_NRPARCELA').AsInteger;
                    dm2.cdsParcelas.EnableControls;
                    dm2.cdsParcelas.Locate('PAR_NRPARCELA',V_NRPARC,[]);
                    dbgridParcelas.SetFocus;
                    Exit;
                    break;
               End;

               //
               dm2.cdsParcelas.Next;
          End;
     End;   //
     //
     dm2.cdsParcelas.EnableControls;
     //
     If (dm2.cdsParcelasVenda.Active = False) Then
        dm2.cdsParcelasVenda.Open;
     //
     //dm2.cdsParcelasVenda.EmptyDataSet;
     dm2.cdsParcelas.DisableControls;
     dm2.cdsParcelas.First;
     //
     While not (dm2.cdsParcelas.Eof) do
     begin
          //
          With dm2.cdsParcelasVenda do
          begin
               // Incluir
               Append;
               FieldByName('PAR_MODALIDADE').AsInteger  := M_CDMODA;
               FieldByName('PAR_QTPARCELAS').AsInteger  := dm2.cdsParcelas.RecordCount;
               FieldByName('PAR_NRPARCELA').AsInteger   := dm2.cdsParcelas.FieldByName('PAR_NRPARCELA').AsInteger;
               FieldByName('PAR_VENCIMENTO').AsDateTime := dm2.cdsParcelas.FieldByName('PAR_VENCIMENTO').AsDateTime;
               FieldByName('PAR_VALOR').AsCurrency      := dm2.cdsParcelas.FieldByName('PAR_VALOR').AsCurrency;
               FieldByName('PAR_BANCO').AsString        := dm2.cdsParcelas.FieldByName('PAR_BANCO').AsString;
               FieldByName('PAR_AGENCIA').AsString      := dm2.cdsParcelas.FieldByName('PAR_AGENCIA').AsString;
               FieldByName('PAR_CONTA').AsString        := dm2.cdsParcelas.FieldByName('PAR_CONTA').AsString;
               FieldByName('PAR_CHEQUE').AsString       := dm2.cdsParcelas.FieldByName('PAR_CHEQUE').AsString;
               // Grava
               Post;
          End;
          //
          dm2.cdsParcelas.Next;
     End;
     //
     dm2.cdsParcelas.EnableControls;
     //
     fecha := True;
     Close;
   Except
        on Exc:Exception do
        begin
              Application.MessageBox(PChar('Erro ao tentar gravar parcelas!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              //
             Close;
        End;
   End;
end;

procedure TfrmParcelas.FormShow(Sender: TObject);
begin
     If (M_TPMODA = 'H') Then
     begin
          dbgridParcelas.Columns[3].Visible := True;
          dbgridParcelas.Columns[4].Visible := True;
          dbgridParcelas.Columns[5].Visible := True;
          dbgridParcelas.Columns[6].Visible := True;
          //
          lblCodigo.Visible := False;
          lblNome.Visible   := False;
          edtCDCLIE.Visible := False;
          edtNMCLIE.Visible := False;
          spLocCliente.Visible := False;
     End;
     If (M_TPMODA = 'P') Then
     begin
          dbgridParcelas.Columns[3].Visible := False;
          dbgridParcelas.Columns[4].Visible := False;
          dbgridParcelas.Columns[5].Visible := False;
          dbgridParcelas.Columns[6].Visible := False;
          //
          lblCodigo.Visible := True;
          lblNome.Visible   := True;
          edtCDCLIE.Visible := True;
          edtNMCLIE.Visible := True;
          spLocCliente.Visible := True;
     End;
     //
     If (M_TPMODA = 'C') Then
     begin
          dbgridParcelas.Columns[3].Visible := False;
          dbgridParcelas.Columns[4].Visible := False;
          dbgridParcelas.Columns[5].Visible := False;
          dbgridParcelas.Columns[6].Visible := False;
          //
          lblCodigo.Visible := False;
          lblNome.Visible   := False;
          edtCDCLIE.Visible := False;
          edtNMCLIE.Visible := False;
          spLocCliente.Visible := False;
     End;
end;

procedure TfrmParcelas.btClonarClick(Sender: TObject);
begin
     If (dm2.cdsParcelas.Active = True) Then
     begin
         ALTUALIZAR_PARCELAS;
         VALOR_VENDA;
     End;
end;

procedure TfrmParcelas.ALTUALIZAR_PARCELAS;
Var
   W_DTVENC : tdate;
   W_VLPARC : REAL;
   W_NRBANC, W_NRAGEN, W_NRCONT : String;
   W_NRCHEQ, W_PCATUA, N_RGATUA : Integer;
begin
     M_VLCONT := 0;
     N_RGATUA := dm2.cdsParcelas.FieldByName('PAR_NRPARCELA').AsInteger;
     //
     If uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_VENCIMENTO').AsString)
         or  uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_VALOR').AsString)
         or (dm2.cdsParcelas.FieldByname('PAR_VALOR').AsCurrency = 0) Then
     begin
          dm2.cdsParcelas.Locate('PAR_NRPARCELA', N_RGATUA,[]);
          dbgridParcelas.SetFocus;
          Exit;
     End;
     //
     dm2.cdsParcelas.DisableControls;
     //
     W_DTVENC := dm2.cdsParcelas.FieldByname('PAR_VENCIMENTO').AsDateTime;
     W_VLPARC := dm2.cdsParcelas.FieldByname('PAR_VALOR').AsCurrency;
     W_NRBANC := dm2.cdsParcelas.FieldByname('PAR_BANCO').AsString;
     W_NRAGEN := dm2.cdsParcelas.FieldByname('PAR_AGENCIA').AsString;
     W_NRCONT := dm2.cdsParcelas.FieldByname('PAR_CONTA').AsString;
     If not uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_CHEQUE').AsString) Then
         W_NRCHEQ := dm2.cdsParcelas.FieldByname('PAR_CHEQUE').AsInteger;
     W_PCATUA := 0;
     //
     M_VLCONT := W_VLPARC * (dm2.cdsParcelas.RecordCount-dm2.cdsParcelas.RecNo);
     //
     While not (dm2.cdsParcelas.Eof) do
     begin
         dm2.cdsParcelas.Edit;
         //
         dm2.cdsParcelas.FieldByname('PAR_VENCIMENTO').AsDateTime := IncMonth(W_DTVENC,W_PCATUA);
         dm2.cdsParcelas.FieldByname('PAR_VALOR').AsCurrency      := W_VLPARC;
         If not uFuncoes.Empty(W_NRBANC) Then
             dm2.cdsParcelas.FieldByname('PAR_BANCO').AsString        := uFuncoes.StrZero(W_NRBANC,3);
         If not uFuncoes.Empty(W_NRAGEN) Then
             dm2.cdsParcelas.FieldByname('PAR_AGENCIA').AsString      := uFuncoes.StrZero(W_NRAGEN,5);
         If not uFuncoes.Empty(W_NRCONT) Then
             dm2.cdsParcelas.FieldByname('PAR_CONTA').AsString        := uFuncoes.StrZero(W_NRCONT,10);
         If (W_NRCHEQ > 0) Then
             dm2.cdsParcelas.FieldByname('PAR_CHEQUE').AsString       := uFuncoes.StrZero(InttoStr(W_NRCHEQ+W_PCATUA),10);
         //
         W_PCATUA := W_PCATUA + 1;
         dm2.cdsParcelas.Next;
     End;
     //
     dm2.cdsParcelas.Locate('PAR_NRPARCELA', N_RGATUA,[]);
     //
     dm2.cdsParcelas.EnableControls;
     dbgridParcelas.SelectedIndex := 1;
     //
     //lbl_VLTOTAL.Caption := FormatFloat('###,###,##0.#0',M_VLCONT);
end;

procedure TfrmParcelas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    If Not fecha Then
        Action := caNone
    Else
        Action := caFree;
end;

procedure TfrmParcelas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If GetStateK (VK_LMENU) And (Key = VK_F4) Then
        fecha := False;
end;

procedure TfrmParcelas.edtCDCLIEChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDCLIE.Text) Then
         edtNMCLIE.Clear;
end;

procedure TfrmParcelas.edtCDCLIEExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDCLIE.Text) Then
        If not dmConsultas.GetCliente(StrtoInt(edtCDCLIE.Text)) Then
          begin
               Application.MessageBox(PChar('Código de cliente não cadastrado!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               edtCDCLIE.Clear;
               edtCDCLIE.SetFocus;
               Exit;
          End
         Else
         Begin
              edtCDCLIE.Text := StrZero(edtCDCLIE.Text,7);
              edtCDCLIE.SetFocus;
              edtNMCLIE.text := dmConsultas.qryConsulta.FieldByName('CLI_FANTASIA').AsString;
              BtGravar.SetFocus;
         End;
end;

procedure TfrmParcelas.edtCDCLIEKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
     //
     If (Key = #13) and uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          Key := #0;
          spLocClienteClick(Sender);
     End;
     //
     {If (Key = #13) and not uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          Key := #0;
          edtDESVAL.SetFocus;
     End;}
end;

procedure TfrmParcelas.spLocClienteClick(Sender: TObject);
begin
    edtCDCLIE.SetFocus;
    frmLocCliente := TfrmLocCliente.create(application);
    try
        frmLocCliente.showmodal;
    finally
        If not (frmLocCliente.cdsConsultaCliente.IsEmpty) Then
        begin
            edtNMCLIE.Text := frmLocCliente.cdsConsultaClienteCLI_FANTASIA.AsString;
            edtCDCLIE.Text := StrZero(frmLocCliente.cdsConsultaClienteCLI_CODIGO.AsString,7);  
            dbgridParcelas.SetFocus;
        End;
        //
        frmLocCliente.Release;
        frmLocCliente := nil;
    end;

{  with TfrmLocCliente.create(self) do
  try
    showmodal;
  finally
    free;
    edtDESVAL.SetFocus;
  end;}
end;

end.
