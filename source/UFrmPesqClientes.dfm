object FrmPesqClientes: TFrmPesqClientes
  Left = 85
  Top = 152
  Width = 626
  Height = 375
  Caption = 'FrmPesqClientes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 104
    Width = 45
    Height = 13
    Caption = 'Localizar:'
    FocusControl = Edit2
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 149
    Width = 600
    Height = 177
    DataSource = DmCon.DsClientes
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'EMP_CNPJ'
        Title.Caption = 'CNPJ'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMP_FANTASIA'
        Title.Caption = 'Nome Fantasia'
        Width = 201
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMP_RAZAO'
        Title.Caption = 'Raz'#227'o Social'
        Width = 265
        Visible = True
      end>
  end
  object Edit2: TEdit
    Left = 7
    Top = 120
    Width = 600
    Height = 21
    CharCase = ecUpperCase
    Color = clInfoBk
    TabOrder = 1
    OnChange = Edit2Change
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 56
    Width = 280
    Height = 41
    TabOrder = 2
    object RadioButton1: TRadioButton
      Left = 16
      Top = 14
      Width = 57
      Height = 17
      Caption = 'CNPJ'
      TabOrder = 0
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 80
      Top = 14
      Width = 97
      Height = 17
      Caption = 'Nome Fantasia'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = RadioButton2Click
    end
    object RadioButton3: TRadioButton
      Left = 184
      Top = 14
      Width = 89
      Height = 17
      Caption = 'Raz'#227'o Social'
      TabOrder = 2
      OnClick = RadioButton3Click
    end
  end
  object MaskEdit1: TMaskEdit
    Left = 304
    Top = 72
    Width = 118
    Height = 21
    Color = clInfoBk
    EditMask = '99.999.999/9999-99;0;_'
    MaxLength = 18
    TabOrder = 3
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 618
    Height = 41
    Align = alTop
    Caption = 'Pesquisa de Clientes'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
end
