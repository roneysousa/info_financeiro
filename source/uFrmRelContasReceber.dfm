object frmRelContReceber: TfrmRelContReceber
  Left = 248
  Top = 170
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relatorio Contas a Receber'
  ClientHeight = 354
  ClientWidth = 453
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
  object Panel2: TPanel
    Left = 0
    Top = 313
    Width = 453
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 0
    object BtSair: TBitBtn
      Left = 363
      Top = 10
      Width = 75
      Height = 25
      Caption = '&Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtSairClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000010000006400004242
        42008C6363009A666600B9666600BB686800B0717200C3686900C66A6B00C76A
        6D00CF6C6E00D2686900D16D6E00CC6E7100C0797A00D2707200D4707100D572
        7300D0727500D3747600D9757600D8767700E37D7E000080000000960000DC7F
        8000FF00FF00D7868700DA888800D8888A00DA888A00DF898A00E6808100E085
        8500E9818200EE868700E3888900E78C8D00F0878800F18B8C00F28B8C00F18D
        8E00F48C8D00F48E8F00EB8F9000EC969700E49A9800F3919200F7909100F791
        9200F2939400F9909200F9949500FA949500F9969700F0999A00FC999A00FF9D
        9E00F7B58400F5A7A500FACCAA00FBD6BB00FADCDC00FFFFFF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001A1A1A1A1A1A
        1A02011A1A1A1A1A1A1A1A1A1A1A02030405011A1A1A1A1A1A1A1A1A0203080B
        0B07010303030303031A1A1A030C0C0C0A09010E1F323B3B031A1A1A030C0C10
        0F0D01181818183B031A1A1A03111114151201181818183B031A1A1A03161616
        201301181717173B031A1A1A0326222D3E1D01171700003B031A1A1A03262337
        3F1E013C3A3A3A3B031A1A1A03272B282A19013C3D3D3D3B031A1A1A03273031
        2921013C3D3D3D3B031A1A1A032734352F24013C3D3D3D3B031A1A1A03273338
        3625013C3D3D3D3B031A1A1A03032E33392C013C3D3D3D3B031A1A1A1A1A0306
        1B1C010303030303031A1A1A1A1A1A1A0303011A1A1A1A1A1A1A}
    end
    object btImprimir: TBitBtn
      Left = 275
      Top = 9
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 0
      OnClick = btImprimirClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000004000
        000080000000FF000000002000004020000080200000FF200000004000004040
        000080400000FF400000006000004060000080600000FF600000008000004080
        000080800000FF80000000A0000040A0000080A00000FFA0000000C0000040C0
        000080C00000FFC0000000FF000040FF000080FF0000FFFF0000000020004000
        200080002000FF002000002020004020200080202000FF202000004020004040
        200080402000FF402000006020004060200080602000FF602000008020004080
        200080802000FF80200000A0200040A0200080A02000FFA0200000C0200040C0
        200080C02000FFC0200000FF200040FF200080FF2000FFFF2000000040004000
        400080004000FF004000002040004020400080204000FF204000004040004040
        400080404000FF404000006040004060400080604000FF604000008040004080
        400080804000FF80400000A0400040A0400080A04000FFA0400000C0400040C0
        400080C04000FFC0400000FF400040FF400080FF4000FFFF4000000060004000
        600080006000FF006000002060004020600080206000FF206000004060004040
        600080406000FF406000006060004060600080606000FF606000008060004080
        600080806000FF80600000A0600040A0600080A06000FFA0600000C0600040C0
        600080C06000FFC0600000FF600040FF600080FF6000FFFF6000000080004000
        800080008000FF008000002080004020800080208000FF208000004080004040
        800080408000FF408000006080004060800080608000FF608000008080004080
        800080808000FF80800000A0800040A0800080A08000FFA0800000C0800040C0
        800080C08000FFC0800000FF800040FF800080FF8000FFFF80000000A0004000
        A0008000A000FF00A0000020A0004020A0008020A000FF20A0000040A0004040
        A0008040A000FF40A0000060A0004060A0008060A000FF60A0000080A0004080
        A0008080A000FF80A00000A0A00040A0A00080A0A000FFA0A00000C0A00040C0
        A00080C0A000FFC0A00000FFA00040FFA00080FFA000FFFFA0000000C0004000
        C0008000C000FF00C0000020C0004020C0008020C000FF20C0000040C0004040
        C0008040C000FF40C0000060C0004060C0008060C000FF60C0000080C0004080
        C0008080C000FF80C00000A0C00040A0C00080A0C000FFA0C00000C0C00040C0
        C00080C0C000FFC0C00000FFC00040FFC00080FFC000FFFFC0000000FF004000
        FF008000FF00FF00FF000020FF004020FF008020FF00FF20FF000040FF004040
        FF008040FF00FF40FF000060FF004060FF008060FF00FF60FF000080FF004080
        FF008080FF00FF80FF0000A0FF0040A0FF0080A0FF00FFA0FF0000C0FF0040C0
        FF0080C0FF00FFC0FF0000FFFF0040FFFF0080FFFF00FFFFFF00DBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDB0000000000000000000000DBDBDBDB00DBDBDBDB
        DBDBDBDBDB00DB00DBDB00000000000000000000000000DB00DB00DBDBDBDBDB
        DBFCFCFCDBDB000000DB00DBDBDBDBDBDB929292DBDB00DB00DB000000000000
        00000000000000DBDB0000DBDBDBDBDBDBDBDBDBDB00DB00DB00DB0000000000
        0000000000DB00DB0000DBDB00FFFFFFFFFFFFFFFF00DB00DB00DBDBDB00FF00
        00000000FF00000000DBDBDBDB00FFFFFFFFFFFFFFFF00DBDBDBDBDBDBDB00FF
        0000000000FF00DBDBDBDBDBDBDB00FFFFFFFFFFFFFFFF00DBDBDBDBDBDBDB00
        0000000000000000DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB}
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 453
    Height = 313
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = '&Dados'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 445
        Height = 285
        Align = alClient
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 102
          Width = 41
          Height = 13
          Caption = 'Per'#237'odo '
          Transparent = True
        end
        object Label3: TLabel
          Left = 16
          Top = 190
          Width = 136
          Height = 13
          Caption = '&Loja\Comodat'#225'rio\Locat'#225'rio:'
          FocusControl = edtCDCLIE
        end
        object spLocClientes: TSpeedButton
          Left = 106
          Top = 206
          Width = 23
          Height = 22
          Hint = 'Localizar loja'
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
          OnClick = spLocClientesClick
        end
        object Label2: TLabel
          Left = 16
          Top = 147
          Width = 55
          Height = 13
          Caption = '&Condominio'
          FocusControl = cmbNMLOJA
          Transparent = True
        end
        object Label4: TLabel
          Left = 152
          Top = 124
          Width = 6
          Height = 13
          Caption = #224
          Transparent = True
        end
        object edtDTINIC: TDateEdit
          Left = 16
          Top = 120
          Width = 121
          Height = 21
          NumGlyphs = 2
          TabOrder = 2
          OnExit = edtDTINICExit
          OnKeyPress = edtDTINICKeyPress
        end
        object edtDTFINA: TDateEdit
          Left = 174
          Top = 120
          Width = 121
          Height = 21
          NumGlyphs = 2
          TabOrder = 3
          OnExit = edtDTFINAExit
          OnKeyPress = edtDTFINAKeyPress
        end
        object edtCDCLIE: TEdit
          Left = 16
          Top = 206
          Width = 89
          Height = 21
          MaxLength = 7
          TabOrder = 5
          OnChange = edtCDCLIEChange
          OnExit = edtCDCLIEExit
          OnKeyPress = edtCDCLIEKeyPress
        end
        object rgPeriodos: TRadioGroup
          Left = 14
          Top = 10
          Width = 283
          Height = 39
          Caption = '[ Tipo de Per'#237'odo ]'
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            '&Emiss'#227'o'
            '&Vencimento'
            '&Pagamento')
          TabOrder = 0
        end
        object rbSituacao: TRadioGroup
          Left = 14
          Top = 57
          Width = 283
          Height = 39
          Caption = '[ Situa'#231#227'o ]'
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            '&Abertas'
            '&Pagas'
            '&Todas')
          TabOrder = 1
        end
        object cmbNMLOJA: TComboBox
          Left = 16
          Top = 163
          Width = 283
          Height = 22
          Style = csOwnerDrawFixed
          ItemHeight = 16
          TabOrder = 4
          OnKeyPress = cmbNMLOJAKeyPress
        end
        object rbOrdem: TRadioGroup
          Left = 14
          Top = 234
          Width = 395
          Height = 37
          Caption = '[ Ordenar por ]'
          Columns = 4
          ItemIndex = 1
          Items.Strings = (
            'Dt.Emiss'#227'o'
            'Dt.Vencimento'
            'Dt.Pagamento')
          TabOrder = 6
          TabStop = True
        end
        object lbl_NMCLIE: TEdit
          Left = 129
          Top = 206
          Width = 281
          Height = 21
          TabStop = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&Recebidas'
      ImageIndex = 1
      TabVisible = False
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 445
        Height = 285
        Align = alClient
        TabOrder = 0
        object Label5: TLabel
          Left = 16
          Top = 57
          Width = 108
          Height = 13
          Caption = 'Per'#237'odo de Movimento'
          Transparent = True
        end
        object Label6: TLabel
          Left = 16
          Top = 104
          Width = 32
          Height = 13
          Caption = 'Cliente'
        end
        object spLocClientes2: TSpeedButton
          Left = 138
          Top = 120
          Width = 23
          Height = 22
          Hint = 'Localizar cliente'
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
          OnClick = spLocClientes2Click
        end
        object lbl_NMCLIE2: TLabel
          Left = 165
          Top = 126
          Width = 13
          Height = 13
          Caption = '...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtDTINIC2: TDateEdit
          Left = 16
          Top = 75
          Width = 121
          Height = 21
          NumGlyphs = 2
          TabOrder = 1
          OnExit = edtDTINIC2Exit
        end
        object edtDTFINA2: TDateEdit
          Left = 152
          Top = 75
          Width = 121
          Height = 21
          NumGlyphs = 2
          TabOrder = 2
          OnExit = edtDTFINA2Exit
        end
        object edtCDCLIE2: TEdit
          Left = 16
          Top = 120
          Width = 121
          Height = 21
          MaxLength = 7
          TabOrder = 3
          OnChange = edtCDCLIE2Change
          OnKeyPress = edtCDCLIE2KeyPress
        end
        object rbTipo: TRadioGroup
          Left = 14
          Top = 10
          Width = 259
          Height = 39
          Caption = '[ Tipo ]'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            '&Pagamento'
            '&Vencimento')
          TabOrder = 0
        end
      end
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 304
    Top = 40
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35190
      mmPrintPosition = 0
      object ppDBImage2: TppDBImage
        UserName = 'DBImage2'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'CFG_IMAGEMLOGO'
        DataPipeline = Dm.ppDBParametros
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDBParametros'
        mmHeight = 23283
        mmLeft = 1852
        mmTop = 2117
        mmWidth = 41540
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'RELAT'#211'RIO : CONTAS A RECEBER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 102659
        mmTop = 7144
        mmWidth = 59944
        BandType = 0
      end
      object txtPeriodo: TppLabel
        UserName = 'txtPeriodo1'
        Caption = 'txtPeriodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102659
        mmTop = 11642
        mmWidth = 16140
        BandType = 0
      end
      object lblSituacao: TppLabel
        UserName = 'lblSituacao'
        Caption = 'lblSituacao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 102659
        mmTop = 16140
        mmWidth = 17441
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'DT.EMISS.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 28575
        mmWidth = 17949
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'DT.VENC.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 20902
        mmTop = 28575
        mmWidth = 16679
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'CREDITO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 39952
        mmTop = 28840
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'PC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 59796
        mmTop = 28839
        mmWidth = 4911
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 66939
        mmTop = 28839
        mmWidth = 15325
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'PARCELA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 151871
        mmTop = 28839
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'USU'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 187590
        mmTop = 28839
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'LOJA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 173832
        mmTop = 28839
        mmWidth = 9398
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 27252
        mmWidth = 197380
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 265
        mmTop = 33867
        mmWidth = 197380
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'REC_DATAEMISSAO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4064
        mmLeft = 1323
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'REC_DATAVENCIMENTO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4064
        mmLeft = 20902
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'REC_CREDITO'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '0000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4064
        mmLeft = 39952
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'REC_PARCELA'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4064
        mmLeft = 59531
        mmTop = 529
        mmWidth = 5556
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'CLI_FANTASIA'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 66940
        mmTop = 529
        mmWidth = 74877
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'REC_VALORPARCELA'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 143668
        mmTop = 529
        mmWidth = 26195
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'REC_LOJA'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 173567
        mmTop = 529
        mmWidth = 10320
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'REC_USUARIO'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 185209
        mmTop = 529
        mmWidth = 10320
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine6: TppLine
        UserName = 'Line6'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 197380
        BandType = 8
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Data/Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 143669
        mmTop = 2381
        mmWidth = 17198
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 161661
        mmTop = 2381
        mmWidth = 32279
        BandType = 8
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 178330
        mmTop = 6879
        mmWidth = 11906
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 191823
        mmTop = 6879
        mmWidth = 1852
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Registro(s):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 2646
        mmWidth = 19897
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4064
        mmLeft = 21167
        mmTop = 2911
        mmWidth = 17198
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 794
        mmWidth = 197380
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'REC_VALORPARCELA'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4233
        mmLeft = 143669
        mmTop = 2911
        mmWidth = 26194
        BandType = 7
      end
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsContas
    UserName = 'DBPipeline1'
    Left = 336
    Top = 40
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_LOJA'
      FieldName = 'REC_LOJA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'EMP_FANTASIA'
      FieldName = 'EMP_FANTASIA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'CLI_FANTASIA'
      FieldName = 'CLI_FANTASIA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_CREDITO'
      FieldName = 'REC_CREDITO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_PARCELA'
      FieldName = 'REC_PARCELA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_QTPARCELAS'
      FieldName = 'REC_QTPARCELAS'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_CLIENTE'
      FieldName = 'REC_CLIENTE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_NRVENDA'
      FieldName = 'REC_NRVENDA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = 'REC_DATAEMISSAO'
      FieldName = 'REC_DATAEMISSAO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = 'REC_DATAVENCIMENTO'
      FieldName = 'REC_DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_VALORPARCELA'
      FieldName = 'REC_VALORPARCELA'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      FieldAlias = 'REC_SITUACAO'
      FieldName = 'REC_SITUACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 11
    end
    object ppDBPipeline1ppField13: TppField
      FieldAlias = 'REC_DATAPAGAMENTO'
      FieldName = 'REC_DATAPAGAMENTO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 12
    end
    object ppDBPipeline1ppField14: TppField
      FieldAlias = 'REC_DESCRICAO'
      FieldName = 'REC_DESCRICAO'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_PAGO'
      FieldName = 'REC_PAGO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 14
    end
    object ppDBPipeline1ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_USUARIO'
      FieldName = 'REC_USUARIO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 15
    end
    object ppDBPipeline1ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIAS'
      FieldName = 'DIAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppDBPipeline1ppField18: TppField
      FieldAlias = 'CLI_NRBOX'
      FieldName = 'CLI_NRBOX'
      FieldLength = 20
      DisplayWidth = 20
      Position = 17
    end
  end
  object dstContas: TSQLDataSet
    CommandText = 
      'Select R.REC_LOJA, EP.EMP_FANTASIA, C.CLI_FANTASIA, C.cli_nrbox,' +
      ' R.REC_CREDITO, R.REC_PARCELA, R.REC_QTPARCELAS, R.REC_CLIENTE, ' +
      'R.REC_NOSSO_NUMERO, R.REC_NRVENDA, R.REC_DATAEMISSAO, R.REC_DATA' +
      'VENCIMENTO, R.REC_VALORPARCELA, R.REC_PAGO, R.rec_valorjuros, R.' +
      'rec_valordesconto, R.rec_restante, R.REC_SITUACAO, R.REC_DATAPAG' +
      'AMENTO, R.REC_DESCRICAO, REC_USUARIO from CONTASRECEBER R INNER ' +
      'join EMPRESAS EP ON R.REC_LOJA = EP.EMP_CODIGO INNER join CLIENT' +
      'ES C ON R.REC_CLIENTE = C.CLI_CODIGO '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 184
    Top = 160
  end
  object dspContas: TDataSetProvider
    DataSet = dstContas
    Options = [poAllowCommandText]
    Left = 216
    Top = 160
  end
  object cdsContas: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 
      'Select R.REC_LOJA, EP.EMP_FANTASIA, C.CLI_FANTASIA, C.cli_nrbox,' +
      ' R.REC_CREDITO, R.REC_PARCELA, R.REC_QTPARCELAS, R.REC_CLIENTE, ' +
      'R.REC_NRVENDA, R.REC_DATAEMISSAO, R.REC_DATAVENCIMENTO, R.REC_VA' +
      'LORPARCELA, R.REC_SITUACAO, R.REC_DATAPAGAMENTO, R.REC_DESCRICAO' +
      ', R.REC_PAGO, REC_USUARIO from CONTASRECEBER R INNER join EMPRES' +
      'AS EP ON R.REC_LOJA = EP.EMP_CODIGO INNER join CLIENTES C ON R.R' +
      'EC_CLIENTE = C.CLI_CODIGO Where (REC_SITUACAO = :pSITUACAO)'
    Params = <
      item
        DataType = ftString
        Name = 'pSITUACAO'
        ParamType = ptInput
      end>
    ProviderName = 'dspContas'
    OnCalcFields = cdsContasCalcFields
    Left = 256
    Top = 160
    object cdsContasREC_LOJA: TIntegerField
      FieldName = 'REC_LOJA'
      Required = True
      DisplayFormat = '000'
      EditFormat = '000'
    end
    object cdsContasEMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      Size = 50
    end
    object cdsContasCLI_FANTASIA: TStringField
      FieldName = 'CLI_FANTASIA'
      Size = 50
    end
    object cdsContasREC_CREDITO: TIntegerField
      FieldName = 'REC_CREDITO'
      Required = True
      DisplayFormat = '0000000'
      EditFormat = '0000000'
    end
    object cdsContasREC_PARCELA: TIntegerField
      FieldName = 'REC_PARCELA'
      Required = True
      DisplayFormat = '00'
      EditFormat = '00'
    end
    object cdsContasREC_QTPARCELAS: TIntegerField
      FieldName = 'REC_QTPARCELAS'
    end
    object cdsContasREC_CLIENTE: TIntegerField
      FieldName = 'REC_CLIENTE'
    end
    object cdsContasREC_NRVENDA: TIntegerField
      FieldName = 'REC_NRVENDA'
    end
    object cdsContasREC_DATAEMISSAO: TDateField
      FieldName = 'REC_DATAEMISSAO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsContasREC_DATAVENCIMENTO: TDateField
      FieldName = 'REC_DATAVENCIMENTO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsContasREC_VALORPARCELA: TFMTBCDField
      FieldName = 'REC_VALORPARCELA'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasREC_SITUACAO: TStringField
      FieldName = 'REC_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsContasREC_DATAPAGAMENTO: TDateField
      FieldName = 'REC_DATAPAGAMENTO'
    end
    object cdsContasREC_DESCRICAO: TMemoField
      FieldName = 'REC_DESCRICAO'
      BlobType = ftMemo
    end
    object cdsContasREC_PAGO: TFMTBCDField
      FieldName = 'REC_PAGO'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasREC_USUARIO: TIntegerField
      FieldName = 'REC_USUARIO'
      DisplayFormat = '000'
    end
    object cdsContasDIAS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'DIAS'
    end
    object cdsContasCLI_NRBOX: TStringField
      FieldName = 'CLI_NRBOX'
    end
  end
  object dsContas: TDataSource
    DataSet = cdsContas
    Left = 296
    Top = 160
  end
  object cdsRecebidas: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 
      'Select R.REC_LOJA, EP.EMP_FANTASIA, C.CLI_FANTASIA, C.cli_nrbox,' +
      ' R.REC_CREDITO, R.REC_PARCELA, R.REC_QTPARCELAS, R.REC_CLIENTE, ' +
      'R.REC_NOSSO_NUMERO, R.REC_NRVENDA, R.REC_DATAEMISSAO, R.REC_DATA' +
      'VENCIMENTO, R.REC_VALORPARCELA, R.REC_PAGO, R.rec_valorjuros, R.' +
      'rec_valordesconto, R.rec_restante, R.REC_SITUACAO, R.REC_DATAPAG' +
      'AMENTO, R.REC_DESCRICAO, REC_USUARIO from CONTASRECEBER R INNER ' +
      'join EMPRESAS EP ON R.REC_LOJA = EP.EMP_CODIGO INNER join CLIENT' +
      'ES C ON R.REC_CLIENTE = C.CLI_CODIGO '
    Params = <>
    ProviderName = 'dspContas'
    OnCalcFields = cdsRecebidasCalcFields
    Left = 300
    Top = 120
    object cdsRecebidasREC_LOJA: TIntegerField
      FieldName = 'REC_LOJA'
      Required = True
      DisplayFormat = '000'
    end
    object cdsRecebidasEMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      Size = 50
    end
    object cdsRecebidasCLI_FANTASIA: TStringField
      FieldName = 'CLI_FANTASIA'
      Size = 50
    end
    object cdsRecebidasREC_CREDITO: TIntegerField
      FieldName = 'REC_CREDITO'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsRecebidasREC_PARCELA: TIntegerField
      FieldName = 'REC_PARCELA'
      Required = True
    end
    object cdsRecebidasREC_QTPARCELAS: TIntegerField
      FieldName = 'REC_QTPARCELAS'
      DisplayFormat = '00'
    end
    object cdsRecebidasREC_CLIENTE: TIntegerField
      FieldName = 'REC_CLIENTE'
    end
    object cdsRecebidasREC_NRVENDA: TIntegerField
      FieldName = 'REC_NRVENDA'
      DisplayFormat = '0000000'
    end
    object cdsRecebidasREC_DATAEMISSAO: TDateField
      FieldName = 'REC_DATAEMISSAO'
    end
    object cdsRecebidasREC_DATAVENCIMENTO: TDateField
      FieldName = 'REC_DATAVENCIMENTO'
    end
    object cdsRecebidasREC_VALORPARCELA: TFMTBCDField
      FieldName = 'REC_VALORPARCELA'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsRecebidasREC_PAGO: TFMTBCDField
      FieldName = 'REC_PAGO'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsRecebidasREC_VALORJUROS: TFMTBCDField
      FieldName = 'REC_VALORJUROS'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsRecebidasREC_VALORDESCONTO: TFMTBCDField
      FieldName = 'REC_VALORDESCONTO'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsRecebidasREC_RESTANTE: TFMTBCDField
      FieldName = 'REC_RESTANTE'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsRecebidasREC_SITUACAO: TStringField
      FieldName = 'REC_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsRecebidasREC_DATAPAGAMENTO: TDateField
      FieldName = 'REC_DATAPAGAMENTO'
    end
    object cdsRecebidasREC_DESCRICAO: TMemoField
      FieldName = 'REC_DESCRICAO'
      BlobType = ftMemo
    end
    object cdsRecebidasREC_USUARIO: TIntegerField
      FieldName = 'REC_USUARIO'
      DisplayFormat = '000'
    end
    object cdsRecebidasDIAS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'DIAS'
    end
    object cdsRecebidasREC_NOSSO_NUMERO: TStringField
      FieldName = 'REC_NOSSO_NUMERO'
    end
    object cdsRecebidasCLI_NRBOX: TStringField
      FieldName = 'CLI_NRBOX'
    end
  end
  object dsRecebidas: TDataSource
    DataSet = cdsRecebidas
    Left = 340
    Top = 120
  end
  object ppDBPipeline2: TppDBPipeline
    DataSource = dsRecebidas
    UserName = 'DBPipeline2'
    Left = 340
    Top = 80
    object ppDBPipeline2ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_LOJA'
      FieldName = 'REC_LOJA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline2ppField2: TppField
      FieldAlias = 'EMP_FANTASIA'
      FieldName = 'EMP_FANTASIA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPipeline2ppField3: TppField
      FieldAlias = 'CLI_FANTASIA'
      FieldName = 'CLI_FANTASIA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDBPipeline2ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_CREDITO'
      FieldName = 'REC_CREDITO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPipeline2ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_PARCELA'
      FieldName = 'REC_PARCELA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPipeline2ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_QTPARCELAS'
      FieldName = 'REC_QTPARCELAS'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object ppDBPipeline2ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_CLIENTE'
      FieldName = 'REC_CLIENTE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object ppDBPipeline2ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_NRVENDA'
      FieldName = 'REC_NRVENDA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object ppDBPipeline2ppField9: TppField
      FieldAlias = 'REC_DATAEMISSAO'
      FieldName = 'REC_DATAEMISSAO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 8
    end
    object ppDBPipeline2ppField10: TppField
      FieldAlias = 'REC_DATAVENCIMENTO'
      FieldName = 'REC_DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 9
    end
    object ppDBPipeline2ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_VALORPARCELA'
      FieldName = 'REC_VALORPARCELA'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 10
    end
    object ppDBPipeline2ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_PAGO'
      FieldName = 'REC_PAGO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 11
    end
    object ppDBPipeline2ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_VALORJUROS'
      FieldName = 'REC_VALORJUROS'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 12
    end
    object ppDBPipeline2ppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_VALORDESCONTO'
      FieldName = 'REC_VALORDESCONTO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 13
    end
    object ppDBPipeline2ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_RESTANTE'
      FieldName = 'REC_RESTANTE'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 14
    end
    object ppDBPipeline2ppField16: TppField
      FieldAlias = 'REC_SITUACAO'
      FieldName = 'REC_SITUACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 15
    end
    object ppDBPipeline2ppField17: TppField
      FieldAlias = 'REC_DATAPAGAMENTO'
      FieldName = 'REC_DATAPAGAMENTO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 16
    end
    object ppDBPipeline2ppField18: TppField
      FieldAlias = 'REC_DESCRICAO'
      FieldName = 'REC_DESCRICAO'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_USUARIO'
      FieldName = 'REC_USUARIO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 18
    end
    object ppDBPipeline2ppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIAS'
      FieldName = 'DIAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppDBPipeline2ppField21: TppField
      FieldAlias = 'REC_NOSSO_NUMERO'
      FieldName = 'REC_NOSSO_NUMERO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 20
    end
    object ppDBPipeline2ppField22: TppField
      FieldAlias = 'CLI_NRBOX'
      FieldName = 'CLI_NRBOX'
      FieldLength = 20
      DisplayWidth = 20
      Position = 21
    end
  end
  object ppReport2: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline2
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\Empresa\SERVICO\DELPHI\Relatorios\rbContasRecebidas.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 300
    Top = 80
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline2'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 38629
      mmPrintPosition = 0
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'CFG_IMAGEMLOGO'
        DataPipeline = Dm.ppDBParametros
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDBParametros'
        mmHeight = 23283
        mmLeft = 1852
        mmTop = 2117
        mmWidth = 41540
        BandType = 0
      end
      object lblRelatorio: TppLabel
        UserName = 'lblRelatorio'
        Caption = 'RELAT'#211'RIO : CONTAS A RECEBER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102659
        mmTop = 3175
        mmWidth = 60061
        BandType = 0
      end
      object txtPeriodo2: TppLabel
        UserName = 'txtPeriodo2'
        Caption = 'txtPeriodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102659
        mmTop = 12435
        mmWidth = 16140
        BandType = 0
      end
      object lblSituacao2: TppLabel
        UserName = 'lblSituacao1'
        Caption = 'lblSituacao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102659
        mmTop = 16933
        mmWidth = 17463
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 0
        mmTop = 32015
        mmWidth = 284428
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'DT.PAGTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 186500
        mmTop = 33602
        mmWidth = 15706
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 37835
        mmWidth = 284428
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'DT.VCTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 170657
        mmTop = 33602
        mmWidth = 13547
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'CREDITO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 33602
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'PC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 15081
        mmTop = 33602
        mmWidth = 4498
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'COMODAT'#193'RIO\LOCAT'#193'RIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 47361
        mmTop = 33602
        mmWidth = 43349
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 204788
        mmTop = 33602
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label101'
        Caption = 'ATS.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 274638
        mmTop = 33602
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'VL. PAGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3810
        mmLeft = 226748
        mmTop = 33602
        mmWidth = 15113
        BandType = 0
      end
      object lblData: TppLabel
        UserName = 'lblData'
        Caption = 'lblData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102659
        mmTop = 21431
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'NOSSO N'#218'MERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 20108
        mmTop = 33602
        mmWidth = 26458
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'EMISS'#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 151607
        mmTop = 33602
        mmWidth = 14605
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'JUROS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3810
        mmLeft = 242359
        mmTop = 33602
        mmWidth = 15000
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'VL.DESC.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3810
        mmLeft = 258498
        mmTop = 33602
        mmWidth = 14647
        BandType = 0
      end
      object txtLoja: TppLabel
        UserName = 'txtLoja'
        Caption = 'txtLoja'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 102659
        mmTop = 7938
        mmWidth = 10372
        BandType = 0
      end
      object lblOrdem: TppLabel
        UserName = 'lblOrdem'
        Caption = 'ORDEM:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 102659
        mmTop = 26194
        mmWidth = 12615
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'N'#186'.BOX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 117475
        mmTop = 33602
        mmWidth = 11176
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'REC_DATAPAGAMENTO'
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3704
        mmLeft = 185738
        mmTop = 529
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'REC_DATAVENCIMENTO'
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3704
        mmLeft = 168275
        mmTop = 529
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'REC_CREDITO'
        DataPipeline = ppDBPipeline2
        DisplayFormat = '0000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 529
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'REC_PARCELA'
        DataPipeline = ppDBPipeline2
        DisplayFormat = '00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3704
        mmLeft = 15081
        mmTop = 529
        mmWidth = 4498
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'CLI_FANTASIA'
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3704
        mmLeft = 47361
        mmTop = 529
        mmWidth = 68792
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'REC_PAGO'
        DataPipeline = ppDBPipeline2
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3704
        mmLeft = 224103
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'DIAS'
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3704
        mmLeft = 274109
        mmTop = 529
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'REC_VALORPARCELA'
        DataPipeline = ppDBPipeline2
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3704
        mmLeft = 204788
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText101'
        DataField = 'REC_DATAEMISSAO'
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3704
        mmLeft = 150813
        mmTop = 529
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'REC_NOSSO_NUMERO'
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3969
        mmLeft = 20108
        mmTop = 529
        mmWidth = 26458
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'REC_VALORDESCONTO'
        DataPipeline = ppDBPipeline2
        DisplayFormat = '##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3598
        mmLeft = 258498
        mmTop = 529
        mmWidth = 15000
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'REC_VALORJUROS'
        DataPipeline = ppDBPipeline2
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3704
        mmLeft = 242359
        mmTop = 529
        mmWidth = 15000
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'CLI_NRBOX'
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3598
        mmLeft = 117475
        mmTop = 529
        mmWidth = 32544
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Data/Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 228071
        mmTop = 2910
        mmWidth = 17198
        BandType = 8
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 284428
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 246063
        mmTop = 2910
        mmWidth = 32279
        BandType = 8
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 262732
        mmTop = 7408
        mmWidth = 11906
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 276226
        mmTop = 7408
        mmWidth = 1852
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Registro(s):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 2646
        mmWidth = 19897
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 4064
        mmLeft = 21167
        mmTop = 2910
        mmWidth = 17198
        BandType = 7
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 794
        mmWidth = 284428
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'REC_PAGO'
        DataPipeline = ppDBPipeline2
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 4233
        mmLeft = 222780
        mmTop = 2646
        mmWidth = 19050
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'REC_VALORJUROS'
        DataPipeline = ppDBPipeline2
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 4233
        mmLeft = 242359
        mmTop = 2646
        mmWidth = 15000
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'REC_VALORDESCONTO'
        DataPipeline = ppDBPipeline2
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 4233
        mmLeft = 258498
        mmTop = 2646
        mmWidth = 15000
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'REC_VALORPARCELA'
        DataPipeline = ppDBPipeline2
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 4233
        mmLeft = 202142
        mmTop = 2646
        mmWidth = 19844
        BandType = 7
      end
    end
  end
end
