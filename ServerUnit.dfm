object FrmServer: TFrmServer
  Left = 271
  Top = 114
  Caption = 'Servidor'
  ClientHeight = 235
  ClientWidth = 399
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
    Left = 24
    Top = 48
    Width = 26
    Height = 13
    Caption = 'Porta'
  end
  object BtnStart: TButton
    Left = 24
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Iniciar'
    TabOrder = 0
    OnClick = BtnStartClick
  end
  object BtnStop: TButton
    Left = 105
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Parar'
    TabOrder = 1
    OnClick = BtnStopClick
  end
  object EditPort: TEdit
    Left = 24
    Top = 67
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '8080'
  end
  object BtnOpenBrowser: TButton
    Left = 24
    Top = 112
    Width = 107
    Height = 25
    Caption = 'Abrir Navegador'
    TabOrder = 3
    OnClick = BtnOpenBrowserClick
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    Left = 288
    Top = 24
  end
end
