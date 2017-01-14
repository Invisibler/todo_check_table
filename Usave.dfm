object Fsave: TFsave
  Left = 0
  Top = 0
  Caption = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1090#1072#1073#1083#1080#1094#1099' '#1095#1077#1082#1073#1086#1082#1089#1086#1074
  ClientHeight = 596
  ClientWidth = 896
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
  object Label1: TLabel
    Left = 8
    Top = 25
    Width = 86
    Height = 13
    Caption = #1063#1080#1089#1083#1086' '#1095#1077#1082#1073#1086#1082#1089#1086#1074
  end
  object Label2: TLabel
    Left = 8
    Top = 97
    Width = 96
    Height = 13
    Caption = #1063#1080#1089#1083#1086' '#1055#1077#1088#1077#1084#1077#1085#1085#1099#1093
  end
  object Label3: TLabel
    Left = 184
    Top = 8
    Width = 87
    Height = 13
    Caption = #1048#1084#1077#1085#1072' '#1095#1077#1082#1073#1086#1082#1089#1086#1074
  end
  object Label4: TLabel
    Left = 456
    Top = 8
    Width = 96
    Height = 13
    Caption = #1048#1084#1077#1085#1072' '#1087#1077#1088#1077#1084#1077#1085#1085#1099#1093
  end
  object BtnClose: TButton
    Left = 772
    Top = 555
    Width = 97
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 0
    OnClick = BtnCloseClick
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 71
    Width = 141
    Height = 17
    Caption = #1054#1073#1085#1091#1083#1103#1090#1100' '#1077#1078#1077#1076#1085#1077#1074#1085#1086'?'
    TabOrder = 1
  end
  object EdtCB: TEdit
    Left = 8
    Top = 44
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 184
    Top = 32
    Width = 252
    Height = 369
    TabOrder = 3
  end
  object BtnSave: TButton
    Left = 772
    Top = 53
    Width = 87
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Enabled = False
    TabOrder = 4
    OnClick = BtnSaveClick
  end
  object BtnLoad: TButton
    Left = 772
    Top = 22
    Width = 87
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
    TabOrder = 5
    OnClick = BtnLoadClick
  end
  object BtnSaveAs: TButton
    Left = 772
    Top = 83
    Width = 87
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082
    TabOrder = 6
    OnClick = BtnSaveAsClick
  end
  object Memo2: TMemo
    Left = 456
    Top = 32
    Width = 265
    Height = 371
    TabOrder = 7
  end
  object EdtVar: TEdit
    Left = 8
    Top = 116
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object OpenDialog1: TOpenDialog
    Filter = '*.cbt|*.cbt|all files|*'
    Left = 810
    Top = 126
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'cbt'
    Filter = '*.cbt|*.cbt|all files|*'
    Left = 810
    Top = 182
  end
end
