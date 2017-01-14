object Fload: TFload
  Left = 0
  Top = 0
  Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1077' '#1090#1072#1073#1083#1080#1094#1099' '#1095#1077#1082#1073#1086#1082#1089#1086#1074
  ClientHeight = 384
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CheckBox1: TCheckBox
    Left = 520
    Top = 344
    Width = 97
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 0
  end
  object BtnClose: TButton
    Left = 520
    Top = 304
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
    OnClick = BtnCloseClick
  end
  object BtnLoad: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'load'
    TabOrder = 2
    OnClick = BtnLoadClick
  end
  object BtnSave: TButton
    Left = 89
    Top = 8
    Width = 75
    Height = 25
    Caption = 'save'
    TabOrder = 3
    OnClick = BtnSaveClick
  end
  object OpenDialog1: TOpenDialog
    Filter = 'cbt,cba|*.cb?|*.cbt|*.cbt|*.cba|*.cba|all files|*'
    Left = 192
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.cba'
    Filter = '*.cba|*.cba|all files|*'
    Left = 248
    Top = 8
  end
end
