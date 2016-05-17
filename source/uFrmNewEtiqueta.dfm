object frmNewEtiqueta: TfrmNewEtiqueta
  Left = 207
  Top = 120
  Width = 544
  Height = 375
  Caption = 'frmNewEtiqueta'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object qrEtiquetas: TQuickRep
    Left = 0
    Top = 0
    Width = 952
    Height = 671
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = frmQuantEtiquetas.tbEtiquetas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 5
    Page.Orientation = poLandscape
    Page.PaperSize = A5
    Page.Values = (
      160.000000000000000000
      1480.000000000000000000
      180.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      80.000000000000000000
      50.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = First
    PrintIfEmpty = True
    ReportTitle = 'Visualiza'#231#227'o de Etiquetas'
    SnapToGrid = True
    Units = MM
    Zoom = 120
    object DetailBand1: TQRBand
      Left = 45
      Top = 82
      Width = 155
      Height = 95
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        209.500000000000000000
        341.753472222222200000)
      BandType = rbDetail
      object QRDBText3: TQRDBText
        Left = 9
        Top = 3
        Width = 147
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          28.663194444444450000
          19.843750000000000000
          6.614583333333332000
          324.114583333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = frmQuantEtiquetas.tbEtiquetas
        DataField = 'EQT_NMPROD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object QRDBText1: TQRDBText
        Left = 9
        Top = 15
        Width = 147
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          28.663194444444450000
          19.843750000000000000
          33.072916666666670000
          324.114583333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = frmQuantEtiquetas.tbEtiquetas
        DataField = 'EQT_VLVEND'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object QRDBImage1: TQRDBImage
        Left = 0
        Top = 28
        Width = 155
        Height = 65
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          143.315972222222200000
          0.000000000000000000
          61.736111111111120000
          341.753472222222200000)
        DataField = 'EQT_IMGBAR'
        DataSet = frmQuantEtiquetas.tbEtiquetas
        Stretch = True
      end
    end
  end
end
