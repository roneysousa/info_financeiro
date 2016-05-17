object frmOrcamentos: TfrmOrcamentos
  Left = 183
  Top = 142
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Selecione um Or'#231'amento'
  ClientHeight = 277
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 33
    Align = alTop
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 536
    Height = 203
    Align = alClient
    TabOrder = 1
    object grdConsultar: TDBGrid
      Left = 1
      Top = 1
      Width = 534
      Height = 201
      Align = alClient
      Ctl3D = False
      DataSource = dsOrcamentos
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = grdConsultarDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ORC_PEDIDO'
          Title.Caption = 'OR'#199'AMENTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ORC_NOMECLIENTE'
          Title.Caption = 'CLIENTE'
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'ORC_DATAVENDA'
          Title.Alignment = taRightJustify
          Title.Caption = 'DATA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ORC_VALOR'
          Title.Alignment = taRightJustify
          Title.Caption = 'VALOR'
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 236
    Width = 536
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 2
    object btnOk: TBitBtn
      Left = 352
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkOK
    end
    object btnCancelar: TBitBtn
      Left = 440
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
      Kind = bkCancel
    end
  end
  object dsOrcamentos: TDataSource
    AutoEdit = False
    DataSet = dmConsultas.cdsOrcamentos
    Left = 424
    Top = 8
  end
end
