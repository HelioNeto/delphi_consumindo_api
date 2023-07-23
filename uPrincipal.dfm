object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Consulta API de Usu'#225'rio Aleat'#243'rios'
  ClientHeight = 457
  ClientWidth = 505
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
  object lblUrl: TLabel
    Left = 8
    Top = 5
    Width = 23
    Height = 13
    Caption = 'URL:'
  end
  object Image1: TImage
    Left = 8
    Top = 51
    Width = 105
    Height = 105
  end
  object lblGenero: TLabel
    Left = 128
    Top = 64
    Width = 27
    Height = 19
    Caption = '(...)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblNome: TLabel
    Left = 128
    Top = 96
    Width = 27
    Height = 19
    Caption = '(...)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtUrl: TEdit
    Left = 8
    Top = 24
    Width = 401
    Height = 21
    TabOrder = 0
    Text = 'https://randomuser.me/api/'
  end
  object btnGet: TBitBtn
    Left = 415
    Top = 22
    Width = 75
    Height = 25
    Caption = 'btnGet'
    TabOrder = 1
    OnClick = btnGetClick
  end
  object mmResultado: TMemo
    Left = 8
    Top = 168
    Width = 482
    Height = 273
    TabOrder = 2
  end
end
