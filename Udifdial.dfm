object FDifDial: TFDifDial
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1054#1073#1085#1072#1088#1091#1078#1077#1085#1086' '#1088#1072#1079#1083#1080#1095#1080#1077
  ClientHeight = 137
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object BtnOk: TButton
    Left = 32
    Top = 88
    Width = 75
    Height = 25
    Caption = #1054#1082
    TabOrder = 0
    OnClick = BtnOkClick
  end
  object BtnCancel: TButton
    Left = 208
    Top = 88
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = BtnCancelClick
  end
  object RadioGroup1: TRadioGroup
    Left = 32
    Top = 8
    Width = 129
    Height = 65
    Caption = 'RadioGroup1'
    ItemIndex = 0
    Items.Strings = (
      #1059#1076#1072#1083#1080#1090#1100' '#1087#1091#1089#1090#1099#1077
      #1059#1076#1072#1083#1080#1090#1100' '#1080#1079' '#1084#1077#1084#1086
      #1059#1074#1077#1083#1080#1095#1080#1090#1100' '#1095#1080#1089#1083#1086)
    TabOrder = 2
  end
  object RadioGroup2: TRadioGroup
    Left = 184
    Top = 8
    Width = 129
    Height = 65
    Caption = 'RadioGroup2'
    ItemIndex = 0
    Items.Strings = (
      #1059#1076#1072#1083#1080#1090#1100' '#1087#1091#1089#1090#1099#1077
      #1059#1076#1072#1083#1080#1090#1100' '#1080#1079' '#1084#1077#1084#1086
      #1059#1074#1077#1083#1080#1095#1080#1090#1100' '#1095#1080#1089#1083#1086)
    TabOrder = 3
  end
end
