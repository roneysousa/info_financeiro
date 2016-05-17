object frmTarefaUsuarios: TfrmTarefaUsuarios
  Left = 180
  Top = 115
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tarefa de Usu'#225'rios'
  ClientHeight = 457
  ClientWidth = 764
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
    Width = 764
    Height = 49
    Align = alTop
    TabOrder = 0
    object lblUsuario: TLabel
      Left = 16
      Top = 16
      Width = 15
      Height = 16
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 137
    Top = 49
    Width = 627
    Height = 367
    Align = alClient
    TabOrder = 1
    object mmoTarefas: TMemo
      Left = 1
      Top = 1
      Width = 625
      Height = 365
      Align = alClient
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 416
    Width = 764
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 2
    object BtSair: TBitBtn
      Left = 677
      Top = 10
      Width = 75
      Height = 25
      Hint = 'Fechar janela'
      Caption = '&Fechar'
      TabOrder = 0
      OnClick = BtSairClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E1FFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4BA64B4BA9
        4D4D4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        824B4B824B4BB64F50C24F50C54D4EB24D4E4E1E1F824B4B824B4B824B4B824B
        4B824B4B824B4BFF00FFFF00FFFF00FF824B4BD45859CB5556C95455C95253B7
        4F524E1E1FFE8B8CFB9A9CF8AAABF7B5B6F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BD75C5DD05A5BCF595ACF5758BD53564E1E1F23B54A13C14816BD480CBC
        41F7B5B6824B4BFF00FFFF00FFFF00FF824B4BDD6364D75F60D55E5FD55C5DC2
        575A4E1E1F2AB44D1CBF4C1EBC4C13BC45F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BE36869DD6566DA6364DE6667C6595B4E1E1F26B14916BC481BBB4910BB
        43F7B5B6824B4BFF00FFFF00FFFF00FF824B4BEB6D6EE26768E67E7FFAD3D4CC
        6E704E1E1FA5D89750D16F42C9662DC758F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BF27374E96C6DEB8182FCD1D3CF6E704E1E1FFFF2CCFFFFD7FFFFD4E6FC
        C7F7B5B6824B4BFF00FFFF00FFFF00FF824B4BF87879F07576EE7273F07374D1
        65664E1E1FFCEFC7FFFFD5FFFFD3FFFFD7F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BFE7F80F77A7BF6797AF77779D76B6B4E1E1FFCEFC7FFFFD5FFFFD3FFFF
        D5F7B5B6824B4BFF00FFFF00FFFF00FF824B4BFF8384FC7F80FB7E7FFE7F80DA
        6E6F4E1E1FFCEFC7FFFFD5FFFFD3FFFFD5F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BFF8889FF8283FF8182FF8283E073744E1E1FFCEFC7FFFFD5FFFFD3FFFF
        D5F7B5B6824B4BFF00FFFF00FFFF00FF824B4B824B4BE27576FE8182FF8687E5
        76774E1E1FFAEBC5FCFBD1FCFBCFFCFBD1F7B5B6824B4BFF00FFFF00FFFF00FF
        FF00FFFF00FF824B4B9C5657CB6C6DCF6E6E4E1E1F824B4B824B4B824B4B824B
        4B824B4B824B4BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B82
        4B4B4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 49
    Width = 137
    Height = 367
    Align = alLeft
    TabOrder = 3
    object grdConsultar: TDBGrid
      Left = 1
      Top = 26
      Width = 135
      Height = 340
      Align = alClient
      Ctl3D = False
      DataSource = dsConsultar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Verdana'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'TAR_DTMOVI'
          Title.Caption = 'Data'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 84
          Visible = True
        end>
    end
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 1
      Width = 135
      Height = 25
      DataSource = dsConsultar
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alTop
      TabOrder = 1
    end
  end
  object dsConsultar: TDataSource
    DataSet = cdsConsultar
    OnDataChange = dsConsultarDataChange
    Left = 196
    Top = 82
  end
  object datasetConsultar: TSQLDataSet
    CommandText = 
      'Select TU.tar_usuario, TU.tar_dtmovi, tu.tar_acao, TU.TAR_COMPUT' +
      'ADOR from TAREFAS_USUARIOS TU Where (TU.TAR_USUARIO = :pUSUARIO)' +
      ' and (TU.tar_dtmovi = :pdtmovi)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pUSUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pdtmovi'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 268
    Top = 82
  end
  object dspConsultar: TDataSetProvider
    DataSet = datasetConsultar
    Options = [poAllowCommandText]
    Left = 356
    Top = 82
  end
  object cdsConsultar: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select TU.tar_usuario, TU.tar_dtmovi from TAREFAS_USUARIOS TU Wh' +
      'ere (TU.TAR_USUARIO = :pUSUARIO) Group by TU.tar_usuario, TU.tar' +
      '_dtmovi Order by TU.TAR_DTMOVI Desc'
    Params = <
      item
        DataType = ftInteger
        Name = 'pUSUARIO'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsultar'
    Left = 428
    Top = 82
    object cdsConsultarTAR_USUARIO: TIntegerField
      FieldName = 'TAR_USUARIO'
    end
    object cdsConsultarTAR_DTMOVI: TDateField
      FieldName = 'TAR_DTMOVI'
    end
  end
  object cdsDetalhes: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select TU.tar_usuario, TU.tar_dtmovi, tu.tar_acao, TU.TAR_COMPUT' +
      'ADOR from TAREFAS_USUARIOS TU Where (TU.TAR_USUARIO = :pUSUARIO)' +
      ' and (TU.tar_dtmovi = :pdtmovi)'
    Params = <
      item
        DataType = ftInteger
        Name = 'pUSUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pdtmovi'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsultar'
    Left = 433
    Top = 121
    object cdsDetalhesTAR_USUARIO: TIntegerField
      FieldName = 'TAR_USUARIO'
    end
    object cdsDetalhesTAR_DTMOVI: TDateField
      FieldName = 'TAR_DTMOVI'
    end
    object cdsDetalhesTAR_ACAO: TStringField
      FieldName = 'TAR_ACAO'
      Size = 120
    end
    object cdsDetalhesTAR_COMPUTADOR: TStringField
      FieldName = 'TAR_COMPUTADOR'
      FixedChar = True
    end
  end
end
