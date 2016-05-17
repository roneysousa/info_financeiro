object frmTabelaPrecos: TfrmTabelaPrecos
  Left = 221
  Top = 163
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tabela de Pre'#231'os'
  ClientHeight = 191
  ClientWidth = 317
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
  object pnlDados: TPanel
    Left = 0
    Top = 0
    Width = 317
    Height = 150
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 34
      Height = 13
      Caption = '&Se'#231#227'o:'
      FocusControl = cmbNMSECAO
      Transparent = True
    end
    object Label2: TLabel
      Left = 16
      Top = 60
      Width = 35
      Height = 13
      Caption = '&Op'#231#227'o:'
      FocusControl = cmbNMSECAO
      Transparent = True
    end
    object Label3: TLabel
      Left = 16
      Top = 101
      Width = 34
      Height = 13
      Caption = '&Ordem:'
      FocusControl = cmbOrdem
      Transparent = True
    end
    object cmbNMSECAO: TComboBox
      Left = 17
      Top = 34
      Width = 256
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
      OnChange = cmbNMSECAOChange
    end
    object cmbEstoque: TComboBox
      Left = 16
      Top = 78
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 1
      Items.Strings = (
        'COM ESTOQUE'
        'SEM ESTOQUE'
        'TABELA PRODUTOS')
    end
    object cmbOrdem: TComboBox
      Left = 16
      Top = 120
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 2
      Text = 'DESCRI'#199#195'O'
      Items.Strings = (
        'DESCRI'#199#195'O'
        'C'#211'DIGO')
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 150
    Width = 317
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 1
    object BtSair: TBitBtn
      Left = 225
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
      TabOrder = 0
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
      Left = 137
      Top = 9
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
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
    object btArquivo: TBitBtn
      Left = 13
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Gerar arquivo de relatorio'
      Caption = '&Arquivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
      OnClick = btArquivoClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000010000000000000101
        0100020202000303030004040400050505000606060007070700080808000909
        09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
        1100121212001313130014141400151515001616160017171700181818001919
        19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
        2100222222002323230024242400252525002626260027272700282828002929
        29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
        3100323232003333330034343400353535003636360037373700383838003939
        39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
        4100424242004343430044444400454545004646460047474700484848004949
        49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
        5100525252005353530054545400555555005656560057575700585858005959
        59005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F5F00606060006161
        61005B635B0057665700526952004E6B4E00456E450036723600277527001579
        15000A7C0A00057D0500027E0200017F0100007F000000800000008000000080
        000000800000007F0000007D0000007B0000007900000077000000730000006F
        000000680000005F000000560000004F0000004C0000004B0000004B0000004B
        0000004B0000004B0000004B0000004B0000004B0000004B0000004B0000004C
        0000004C0000004D0000004E000001500100055405000A590A00126012001D69
        1D0029722900387C380047864700548F5400629460006D996A00799B7200849B
        7A008C9C8000949A850096A0890098A38D009BA891009DAC94009EAC95009EAC
        96009EAC96009EAC96009EAD97009FAF98009FB099009FB39A00A0B69C00A1B6
        9F00A4B7A200A8B9A800ADB9AD00B3B9B300B8BAB700BABBB900BCBCBB00BDBC
        BC00BEBCBD00BEBDBE00BEBDBE00BFBDBE00BFBEBE00BFBEBE00BFBEBF00BFBD
        BF00BFBDBF00C0BBC000C2B6C200C6ADC500CC9DCB00D28BD100DA75D900E15F
        E000EA42E900F228F200F913F900FD05FD00FE01FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE00FE00FE03FE00FD09FD00F828F800F343F300EF5CEE00EB71
        EA00E787E600E499E300E2A7E000E0B2DD00DEBBDB00DDC3DA00DBCAD800DACF
        D800DAD2D800D9D4D800D9D6D800D9D8D900DBD9DA00DBDADB00DCDADC00DCDB
        DD00DDDCDE00DFDFE000E3E3E400E9E9EA00EDEDEE00F1F1F100F5F5F500F6F6
        F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600D1D1D1D1D1D1
        D1D1D1D1D1D1D1D1D1D1D1D184849B9B9B9B9B9B9B8484D1D1D1D1847272EB84
        84F3F0ECB2847B84D1D1D1847272EE8484EDF3EEB9847B84D1D1D1847272F284
        84EBF3F2B8847B84D1D1D1847272F3F2EBEBEDEDB8847B84D1D1D18472727272
        7272727272727284D1D1D18472A8A8A8A8A8A8A8A8A87284D1D1D18472FFFFFF
        FFFFFFFFFFFF7284D1D1D18472FFFFFFFFFFFFFFFFFF7284D1D1D18472FFB8B8
        B8B8B8B8B8FF7284D1D1D18472FFFFFFFFFFFFFFFFFF7284D1D1D18472FFB8B8
        B8B8B8B8B8FF7284D1D1D18472FFFFFFFFFFFFFFFFFF7284D1D1D1D184FFFFFF
        FFFFFFFFFFFF84D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1}
    end
  end
  object dstProdutos: TSQLDataSet
    CommandText = 
      'Select P.PRO_CODIGO, P.PRO_BARRAS, P.PRO_DESCRICAO, P.PRO_VLCOMP' +
      'RA, P.PRO_VLCUSTO, P.PRO_VLVENDA,'#13#10'(Select F.FOR_FANTASIA from F' +
      'ORNECEDORES F Where (F.FOR_CODIGO = P.FOR_CODIGO)) as FABRICANTE' +
      ','#13#10'(Select S.SEC_DESCRICAO from SECAO S'#13#10'Where (S.SEC_CODIGO = P' +
      '.SEC_CODIGO)) As SECAO'#13#10'from PRODUTOS P'#13#10'order by P.PRO_DESCRICA' +
      'O'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 192
    Top = 72
    object dstProdutosPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstProdutosPRO_BARRAS: TStringField
      FieldName = 'PRO_BARRAS'
      FixedChar = True
      Size = 13
    end
    object dstProdutosPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 60
    end
    object dstProdutosPRO_VLCOMPRA: TFMTBCDField
      FieldName = 'PRO_VLCOMPRA'
      Precision = 15
      Size = 2
    end
    object dstProdutosPRO_VLCUSTO: TFMTBCDField
      FieldName = 'PRO_VLCUSTO'
      Precision = 15
      Size = 2
    end
    object dstProdutosPRO_VLVENDA: TFMTBCDField
      FieldName = 'PRO_VLVENDA'
      Precision = 15
      Size = 2
    end
    object dstProdutosFABRICANTE: TStringField
      FieldName = 'FABRICANTE'
      Size = 50
    end
    object dstProdutosSECAO: TStringField
      FieldName = 'SECAO'
      Size = 30
    end
  end
  object dspProdutos: TDataSetProvider
    DataSet = dstProdutos
    Options = [poAllowCommandText]
    Left = 240
    Top = 72
  end
  object cdsProdutos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutos'
    Left = 280
    Top = 72
    object cdsProdutosPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsProdutosPRO_BARRAS: TStringField
      FieldName = 'PRO_BARRAS'
      FixedChar = True
      Size = 13
    end
    object cdsProdutosPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 60
    end
    object cdsProdutosPRO_VLCOMPRA: TFMTBCDField
      FieldName = 'PRO_VLCOMPRA'
      Precision = 15
      Size = 2
    end
    object cdsProdutosPRO_VLCUSTO: TFMTBCDField
      FieldName = 'PRO_VLCUSTO'
      Precision = 15
      Size = 2
    end
    object cdsProdutosPRO_VLVENDA: TFMTBCDField
      FieldName = 'PRO_VLVENDA'
      Precision = 15
      Size = 2
    end
    object cdsProdutosFABRICANTE: TStringField
      FieldName = 'FABRICANTE'
      Size = 50
    end
    object cdsProdutosSECAO: TStringField
      FieldName = 'SECAO'
      Size = 30
    end
  end
  object dsProdutos: TDataSource
    DataSet = cdsProdutos
    Left = 208
    Top = 111
  end
  object ppDBProdutos: TppDBPipeline
    DataSource = dsProdutos
    UserName = 'DBFichaCliente1'
    Left = 240
    Top = 112
    object ppDBProdutosppField1: TppField
      FieldAlias = 'PRO_CODIGO'
      FieldName = 'PRO_CODIGO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDBProdutosppField2: TppField
      FieldAlias = 'PRO_BARRAS'
      FieldName = 'PRO_BARRAS'
      FieldLength = 13
      DisplayWidth = 13
      Position = 1
    end
    object ppDBProdutosppField3: TppField
      FieldAlias = 'PRO_DESCRICAO'
      FieldName = 'PRO_DESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppDBProdutosppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRO_VLCOMPRA'
      FieldName = 'PRO_VLCOMPRA'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 3
    end
    object ppDBProdutosppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRO_VLCUSTO'
      FieldName = 'PRO_VLCUSTO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 4
    end
    object ppDBProdutosppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRO_VLVENDA'
      FieldName = 'PRO_VLVENDA'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 5
    end
    object ppDBProdutosppField7: TppField
      FieldAlias = 'FABRICANTE'
      FieldName = 'FABRICANTE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppDBProdutosppField8: TppField
      FieldAlias = 'SECAO'
      FieldName = 'SECAO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 7
    end
  end
  object ppRepVendedores: TppReport
    AutoStop = False
    DataPipeline = ppDBProdutos
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
    Template.FileName = 'C:\Empresa\SERVICO\DELPHI\Relatorios\rbTabProdutos.rtm'
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
    Left = 272
    Top = 112
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBProdutos'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 31750
      mmPrintPosition = 0
      object ppDBImage2: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'CFG_IMAGEMLOGO'
        DataPipeline = Dm.ppDBParametros
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDBParametros'
        mmHeight = 23283
        mmLeft = 3440
        mmTop = 529
        mmWidth = 41540
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'C'#211'DIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 25929
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'DESCRI'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 25665
        mmWidth = 21167
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 30692
        mmWidth = 197380
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 265
        mmTop = 24606
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'FABRICANTE/MARCA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 87313
        mmTop = 25929
        mmWidth = 36915
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label1'
        Caption = 'TABELA DE PRE'#199'OS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 121179
        mmTop = 3175
        mmWidth = 35560
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label2'
        Caption = 'SE'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 132557
        mmTop = 25665
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label3'
        Caption = 'VALOR VENDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 170921
        mmTop = 25929
        mmWidth = 25654
        BandType = 0
      end
      object lblSecao: TppLabel
        UserName = 'Label4'
        Caption = 'SE'#199#195'O :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 121444
        mmTop = 8467
        mmWidth = 14478
        BandType = 0
      end
      object lblOpcao: TppLabel
        UserName = 'Label6'
        Caption = 'OP'#199#195'O :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 121444
        mmTop = 13229
        mmWidth = 14901
        BandType = 0
      end
      object lblOrdem: TppLabel
        UserName = 'lblOrdem'
        Caption = 'OP'#199#195'O :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 121709
        mmTop = 17992
        mmWidth = 14901
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'PRO_CODIGO'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3725
        mmLeft = 529
        mmTop = 508
        mmWidth = 23114
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3725
        mmLeft = 25400
        mmTop = 508
        mmWidth = 57944
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'FABRICANTE'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3725
        mmLeft = 86519
        mmTop = 508
        mmWidth = 43656
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'SECAO'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3725
        mmLeft = 132557
        mmTop = 508
        mmWidth = 36513
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PRO_VLVENDA'
        DataPipeline = ppDBProdutos
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3725
        mmLeft = 170921
        mmTop = 508
        mmWidth = 25654
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 197380
        BandType = 8
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
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
      object ppLabel30: TppLabel
        UserName = 'Label30'
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
      object ppLabel3: TppLabel
        UserName = 'Label5'
        Caption = 'Registro(s):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 794
        mmTop = 1588
        mmWidth = 19897
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 4064
        mmLeft = 21431
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 197380
        BandType = 7
      end
    end
  end
  object cdsTabProdutos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTabProdutos'
    Left = 160
    Top = 8
  end
  object dspTabProdutos: TDataSetProvider
    DataSet = dstProdutos
    Options = [poAllowCommandText]
    Left = 120
    Top = 8
  end
  object dsTabProdutos: TDataSource
    DataSet = cdsTabProdutos
    Left = 192
    Top = 8
  end
  object ppRepTabProdutos: TppReport
    AutoStop = False
    DataPipeline = ppDBPipTabProdutos
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
    Template.FileName = 'C:\Empresa\SERVICO\DELPHI\Relatorios\rbTabProdutos.rtm'
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
    Left = 232
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipTabProdutos'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 31750
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
        mmLeft = 3440
        mmTop = 529
        mmWidth = 41540
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label26'
        Caption = 'C'#211'DIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 25929
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label27'
        Caption = 'DESCRI'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 28046
        mmTop = 25665
        mmWidth = 21167
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 30692
        mmWidth = 197380
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line1'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 265
        mmTop = 24606
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label28'
        Caption = 'FABRICANTE/MARCA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 93398
        mmTop = 25929
        mmWidth = 36915
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label1'
        Caption = 'TABELA DE PRE'#199'OS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 121179
        mmTop = 3175
        mmWidth = 35560
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label2'
        Caption = 'SE'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 135202
        mmTop = 25665
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label3'
        Caption = 'VALOR VENDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 171450
        mmTop = 25929
        mmWidth = 25135
        BandType = 0
      end
      object txtSecao2: TppLabel
        UserName = 'Label4'
        Caption = 'SE'#199#195'O :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 121444
        mmTop = 8467
        mmWidth = 14478
        BandType = 0
      end
      object txtOpcao: TppLabel
        UserName = 'Label6'
        Caption = 'OP'#199#195'O :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 121444
        mmTop = 13229
        mmWidth = 14901
        BandType = 0
      end
      object txtOrdem: TppLabel
        UserName = 'txtOrdem'
        Caption = 'ORDEM:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 121179
        mmTop = 17992
        mmWidth = 14224
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText6: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'PRO_CODIGO'
        DataPipeline = ppDBPipTabProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipTabProdutos'
        mmHeight = 3725
        mmLeft = 529
        mmTop = 508
        mmWidth = 24606
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText2'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = ppDBPipTabProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipTabProdutos'
        mmHeight = 3725
        mmLeft = 28046
        mmTop = 508
        mmWidth = 62442
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText3'
        DataField = 'FABRICANTE'
        DataPipeline = ppDBPipTabProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipTabProdutos'
        mmHeight = 3725
        mmLeft = 92604
        mmTop = 508
        mmWidth = 40746
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText4'
        DataField = 'SECAO'
        DataPipeline = ppDBPipTabProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipTabProdutos'
        mmHeight = 3725
        mmLeft = 135202
        mmTop = 508
        mmWidth = 36513
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText5'
        DataField = 'PRO_VLVENDA'
        DataPipeline = ppDBPipTabProdutos
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipTabProdutos'
        mmHeight = 3704
        mmLeft = 173302
        mmTop = 529
        mmWidth = 23283
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine7: TppLine
        UserName = 'Line2'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 197380
        BandType = 8
      end
      object ppLabel12: TppLabel
        UserName = 'Label29'
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
      object ppSystemVariable1: TppSystemVariable
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
      object ppLabel13: TppLabel
        UserName = 'Label30'
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
      object ppSystemVariable2: TppSystemVariable
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
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel14: TppLabel
        UserName = 'Label5'
        Caption = 'Registro(s):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 794
        mmTop = 1588
        mmWidth = 19897
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc1'
        DataPipeline = ppDBPipTabProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPipTabProdutos'
        mmHeight = 4064
        mmLeft = 21431
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
      end
      object ppLine8: TppLine
        UserName = 'Line3'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 197380
        BandType = 7
      end
    end
  end
  object ppDBPipTabProdutos: TppDBPipeline
    DataSource = dsTabProdutos
    UserName = 'DBPipTabProdutos'
    Left = 264
    object ppDBPipTabProdutosppField1: TppField
      FieldAlias = 'PRO_CODIGO'
      FieldName = 'PRO_CODIGO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipTabProdutosppField2: TppField
      FieldAlias = 'PRO_BARRAS'
      FieldName = 'PRO_BARRAS'
      FieldLength = 13
      DisplayWidth = 13
      Position = 1
    end
    object ppDBPipTabProdutosppField3: TppField
      FieldAlias = 'PRO_DESCRICAO'
      FieldName = 'PRO_DESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppDBPipTabProdutosppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRO_VLCOMPRA'
      FieldName = 'PRO_VLCOMPRA'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 3
    end
    object ppDBPipTabProdutosppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRO_VLCUSTO'
      FieldName = 'PRO_VLCUSTO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 4
    end
    object ppDBPipTabProdutosppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRO_VLVENDA'
      FieldName = 'PRO_VLVENDA'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 5
    end
    object ppDBPipTabProdutosppField7: TppField
      FieldAlias = 'FABRICANTE'
      FieldName = 'FABRICANTE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppDBPipTabProdutosppField8: TppField
      FieldAlias = 'SECAO'
      FieldName = 'SECAO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 7
    end
  end
end
