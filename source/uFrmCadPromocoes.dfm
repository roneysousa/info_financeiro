inherited frmCadPromocoes: TfrmCadPromocoes
  Left = 209
  Top = 142
  Caption = 'Cadastro de Promo'#231#245'es'
  ClientHeight = 393
  ClientWidth = 632
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 632
    Height = 364
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 16
        Top = 16
        Width = 88
        Height = 13
        Caption = 'C'#243'digo do Produto'
        FocusControl = dbeCodigo
        Transparent = True
      end
      object Label2: TLabel [1]
        Left = 16
        Top = 56
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeDescricao
        Transparent = True
      end
      object sbLocProduto: TSpeedButton [2]
        Left = 158
        Top = 30
        Width = 23
        Height = 22
        Hint = 'Localiza produto'
        Flat = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777777770077777777777770FF077777777777077FF07777
          7777770777FF077777777770777FFF00777777790777F1111077777790771117
          0B77777770799170B77777777709990B77777777770990B77777777777090B77
          777777777770B777777777777777777777777777777777777777}
        OnClick = sbLocProdutoClick
      end
      object Label10: TLabel [3]
        Left = 252
        Top = 16
        Width = 58
        Height = 13
        Caption = 'Valor Venda'
      end
      inherited Panel1: TPanel
        Top = 294
        Width = 624
      end
      object dbeCodigo: TDBEdit
        Left = 16
        Top = 32
        Width = 145
        Height = 21
        DataField = 'PRM_IDPRODUTO'
        DataSource = dsPromocoes
        TabOrder = 1
        OnExit = dbeCodigoExit
        OnKeyPress = dbeCodigoKeyPress
      end
      object dbeDescricao: TDBEdit
        Left = 16
        Top = 72
        Width = 500
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'PRM_NMPROD'
        DataSource = dsPromocoes
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object gbDias: TGroupBox
        Left = 16
        Top = 99
        Width = 500
        Height = 182
        Caption = '[ Dias / Valor]'
        TabOrder = 3
        object Label3: TLabel
          Left = 16
          Top = 16
          Width = 43
          Height = 13
          Caption = 'Segunda'
          Transparent = True
        end
        object Label4: TLabel
          Left = 16
          Top = 56
          Width = 28
          Height = 13
          Caption = 'Ter'#231'a'
          Transparent = True
        end
        object Label5: TLabel
          Left = 16
          Top = 96
          Width = 32
          Height = 13
          Caption = 'Quarta'
          Transparent = True
        end
        object Label6: TLabel
          Left = 16
          Top = 136
          Width = 31
          Height = 13
          Caption = 'Quinta'
          Transparent = True
        end
        object Label7: TLabel
          Left = 156
          Top = 15
          Width = 27
          Height = 13
          Caption = 'Sexta'
          Transparent = True
        end
        object Label8: TLabel
          Left = 156
          Top = 55
          Width = 37
          Height = 13
          Caption = 'S'#225'bado'
          Transparent = True
        end
        object Label9: TLabel
          Left = 156
          Top = 95
          Width = 42
          Height = 13
          Caption = 'Domingo'
          Transparent = True
        end
        object dbeVlSegunda: TDBEdit
          Left = 16
          Top = 32
          Width = 121
          Height = 21
          DataField = 'PRM_VLSEGU'
          DataSource = dsPromocoes
          TabOrder = 0
        end
        object dbeVlTerca: TDBEdit
          Left = 16
          Top = 72
          Width = 121
          Height = 21
          DataField = 'PRM_VLTERC'
          DataSource = dsPromocoes
          TabOrder = 1
        end
        object dbeVlQuarta: TDBEdit
          Left = 16
          Top = 112
          Width = 121
          Height = 21
          DataField = 'PRM_VLQUAR'
          DataSource = dsPromocoes
          TabOrder = 2
        end
        object dbeVlQuinta: TDBEdit
          Left = 16
          Top = 152
          Width = 121
          Height = 21
          DataField = 'PRM_VLQUIN'
          DataSource = dsPromocoes
          TabOrder = 3
        end
        object dbeVlSexta: TDBEdit
          Left = 156
          Top = 31
          Width = 121
          Height = 21
          DataField = 'PRM_VLSEXT'
          DataSource = dsPromocoes
          TabOrder = 4
        end
        object dbeVlSabado: TDBEdit
          Left = 156
          Top = 71
          Width = 121
          Height = 21
          DataField = 'PRM_VLSABA'
          DataSource = dsPromocoes
          TabOrder = 5
        end
        object dbeVlDomingo: TDBEdit
          Left = 156
          Top = 111
          Width = 121
          Height = 21
          DataField = 'PRM_VLDOMI'
          DataSource = dsPromocoes
          TabOrder = 6
        end
      end
      object DBEdit1: TDBEdit
        Left = 192
        Top = 32
        Width = 121
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'PRM_VLUNIT'
        DataSource = dsPromocoes
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        Width = 624
        inherited btnConsultar: TBitBtn
          Left = 404
          Top = 36
          Visible = False
        end
        inherited btnAlterar: TBitBtn
          Top = 16
        end
      end
      inherited Panel3: TPanel
        Left = 590
        Height = 276
      end
      inherited grdConsultar: TDBGrid
        Width = 590
        Height = 276
        Columns = <
          item
            Expanded = False
            FieldName = 'PRM_IDPRODUTO'
            Title.Caption = 'C'#211'DIGO'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRO_DESCRICAO'
            Title.Caption = 'DESCRI'#199#195'O'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 429
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor Venda'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Visible = False
          end>
      end
    end
  end
  inherited Panel4: TPanel
    Width = 632
  end
  inherited dsConsultar: TDataSource
    Left = 332
    Top = 58
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 
      'select PM.PRM_IDPRODUTO, P.PRO_DESCRICAO,PM.PRM_VLPROM from PROM' +
      'OCAO PM'#13#10'INNER JOIN  PRODUTOS P ON P.PRO_CODIGO = PM.PRM_IDPRODU' +
      'TO order by P.PRO_DESCRICAO'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
    Left = 412
    Top = 58
  end
  inherited dspConsultar: TDataSetProvider
    Left = 492
    Top = 58
  end
  inherited cdsConsultar: TClientDataSet
    Left = 564
    Top = 58
    object cdsConsultarPRM_IDPRODUTO: TStringField
      FieldName = 'PRM_IDPRODUTO'
      Required = True
      Size = 13
    end
    object cdsConsultarPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 60
    end
  end
  object dsPromocoes: TDataSource
    AutoEdit = False
    DataSet = dmDados.cdsPromocoes
    OnDataChange = dsPromocoesDataChange
    Left = 400
    Top = 104
  end
end
