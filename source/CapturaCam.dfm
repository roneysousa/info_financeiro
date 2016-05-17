object fCaptura: TfCaptura
  Left = 248
  Top = 241
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Captura Cam'
  ClientHeight = 347
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object camCamera: TCamera
    Left = 8
    Top = 8
    Width = 321
    Height = 281
    FichierVideo = 'Video.avi'
    FichierImage = 'Imagem.bmp'
  end
  object btnConfirma: TButton
    Left = 16
    Top = 295
    Width = 137
    Height = 46
    Caption = '&Confirmar'
    ModalResult = 1
    TabOrder = 1
  end
  object btnCancelar: TButton
    Left = 167
    Top = 295
    Width = 146
    Height = 46
    Caption = 'Canc&elar'
    ModalResult = 2
    TabOrder = 2
  end
end
