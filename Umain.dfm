object Fmain: TFmain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1058#1072#1073#1083#1080#1094#1099' '#1095#1077#1082#1073#1086#1082#1089#1086#1074
  ClientHeight = 43
  ClientWidth = 172
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BtnClose: TButton
    Left = 8
    Top = 8
    Width = 97
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 0
    OnClick = BtnCloseClick
  end
  object MainMenu1: TMainMenu
    Left = 112
    object save1: TMenuItem
      Caption = 'save'
      OnClick = save1Click
    end
    object load1: TMenuItem
      Caption = 'load'
      OnClick = load1Click
    end
  end
end
