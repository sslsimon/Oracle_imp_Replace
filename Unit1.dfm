object Form1: TForm1
  Left = 455
  Top = 335
  BorderStyle = bsDialog
  Caption = #23548#20837#39044#35774'-'#36866#29992#26356#26032#23548#20837#25968#25454#24211'-By Simon'
  ClientHeight = 325
  ClientWidth = 351
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Consolas'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object Label5: TLabel
    Left = -9
    Top = 120
    Width = 896
    Height = 18
    Caption = 
      '----------------------------------------------------------------' +
      '------------------------------------------------'
  end
  object Label6: TLabel
    Left = 5
    Top = 272
    Width = 896
    Height = 18
    Caption = 
      '----------------------------------------------------------------' +
      '------------------------------------------------'
  end
  object Label8: TLabel
    Left = 98
    Top = 30
    Width = 75
    Height = 18
    Caption = #26410#36830#25509'...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 8
    Top = 136
    Width = 268
    Height = 18
    Caption = #20934#22791#24320#22987#65306'1'#12289#25991#20214#37325#21629#21517#20026'bak.dmp'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 69
    Top = 4
    Width = 213
    Height = 19
    Caption = #26412#36719#20214#20165#25903#25345'Windows Xp '
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = -546
    Top = 55
    Width = 896
    Height = 18
    Caption = 
      '----------------------------------------------------------------' +
      '------------------------------------------------'
  end
  object Label11: TLabel
    Left = 6
    Top = 79
    Width = 340
    Height = 38
    Caption = #30830#35748#36830#25509#30340#25968#25454#24211'IP'#12289#23454#20363' '#26080#35823#21518#25165#21487#25805#20316#20197#19979#27493#39588#65281#13#10'                          '#20197#19979#25805#20316#19981#21487#36870#65281#65281#65281
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -14
    Font.Name = #24494#36719#38597#40657
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 93
    Top = 155
    Width = 161
    Height = 18
    Caption = '2'#12289#25335#20837#19978#27425#23548#20837#30446#24405
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button2: TButton
    Left = 16
    Top = 175
    Width = 105
    Height = 25
    Caption = #27493#39588'1'
    Enabled = False
    TabOrder = 0
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 16
    Top = 26
    Width = 75
    Height = 25
    Caption = 'Connect'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 16
    Top = 207
    Width = 105
    Height = 25
    Caption = #27493#39588'2'
    Enabled = False
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 16
    Top = 240
    Width = 105
    Height = 25
    Caption = #27493#39588'3'
    Enabled = False
    TabOrder = 3
    OnClick = Button4Click
  end
  object GroupBox1: TGroupBox
    Left = 144
    Top = 176
    Width = 185
    Height = 43
    Caption = #23548#20837#24211#30340#29992#25143#21517#12289#23494#30721
    TabOrder = 4
    Visible = False
    object Label3: TLabel
      Left = -2
      Top = 23
      Width = 80
      Height = 18
      Caption = 'User_name:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 95
      Top = 23
      Width = 72
      Height = 18
      Caption = 'Password:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
    end
    object edt_usr: TEdit
      Left = 6
      Top = 39
      Width = 86
      Height = 26
      Enabled = False
      TabOrder = 0
    end
    object edt_psw: TEdit
      Left = 95
      Top = 39
      Width = 121
      Height = 26
      Enabled = False
      PasswordChar = '*'
      TabOrder = 1
    end
  end
  object Button5: TButton
    Left = 16
    Top = 296
    Width = 100
    Height = 25
    Caption = #37325#32622#20844#21578#26495
    Enabled = False
    TabOrder = 5
    OnClick = Button5Click
  end
  object RichEdit1: TRichEdit
    Left = 153
    Top = 288
    Width = 128
    Height = 25
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Consolas'
    Font.Style = []
    Lines.Strings = (
      'RichEdit1')
    ParentFont = False
    TabOrder = 6
    Visible = False
  end
  object Memo1: TMemo
    Left = 152
    Top = 232
    Width = 185
    Height = 33
    Lines.Strings = (
      'set heading off'
      'set feedback off'
      'set pagesize 0'
      'spool compproc1.sql'
      
        'select '#39'alter procedure BFBHDD8.'#39'||object_name||'#39' compile;'#39' from' +
        ' all_objects '
      
        'where status = '#39'INVALID'#39' and object_type = '#39'PROCEDURE'#39' AND owner' +
        '='#39'BFBHDD8'#39
      'union all'
      'select '#39'exit'#39' from dual;'
      'spool off'
      'exit')
    TabOrder = 7
    Visible = False
    WordWrap = False
  end
  object OraSession1: TOraSession
    Options.Direct = True
    Username = 'system'
    Server = '127.0.0.1:1521:ORCL'
    ConnectDialog = ConnectDialog1
    AfterConnect = OraSession1AfterConnect
    Left = 288
    Top = 2
  end
  object ConnectDialog1: TConnectDialog
    StoreLogInfo = False
    Caption = 'Connect'
    UsernameLabel = 'User Name'
    PasswordLabel = 'Password'
    ServerLabel = 'ip:port:'#23454#20363#21517
    ConnectButton = 'Connect'
    CancelButton = 'Cancel'
    LabelSet = lsCustom
    Left = 176
    Top = 7
  end
  object OraScript1: TOraScript
    SQL.Strings = (
      'drop user BFAPP8 CASCADE;'
      'drop user BFBHDD8 CASCADE;'
      'drop user BFPUB8 CASCADE;'
      'drop user POS_USER8 CASCADE;'
      'drop user BFCRM8 CASCADE;'
      'drop user BFRS8 CASCADE;'
      'drop user BFCW8 CASCADE;'
      'drop user BFCWZT8 CASCADE;'
      ''
      '/* Formatted on 2013-08-12 17:03:46 (QP5 v5.185.11230.41888) */'
      'CREATE USER BFAPP8'
      '  IDENTIFIED BY "DHHZDHHZ"'
      '  DEFAULT TABLESPACE BFDATA'
      '  TEMPORARY TABLESPACE BFTEMP'
      '  PROFILE DEFAULT;'
      ''
      'CREATE USER BFBHDD8'
      '  IDENTIFIED BY "DHHZDHHZ"'
      '  DEFAULT TABLESPACE BFDATA'
      '  TEMPORARY TABLESPACE BFTEMP'
      '  PROFILE DEFAULT;'
      ''
      'CREATE USER BFPUB8'
      '  IDENTIFIED BY "DHHZDHHZ"'
      '  DEFAULT TABLESPACE BFDATA'
      '  TEMPORARY TABLESPACE BFTEMP'
      '  PROFILE DEFAULT;'
      ''
      'CREATE USER POS_USER8'
      '  IDENTIFIED BY "DHHZDHHZ"'
      '  DEFAULT TABLESPACE BFDATA'
      '  TEMPORARY TABLESPACE BFTEMP'
      '  PROFILE DEFAULT;'
      ''
      ''
      'CREATE USER BFCRM8'
      '  IDENTIFIED BY "DHHZDHHZ"'
      '  DEFAULT TABLESPACE BFDATA'
      '  TEMPORARY TABLESPACE BFTEMP'
      '  PROFILE DEFAULT;'
      ''
      'CREATE USER BFRS8'
      '  IDENTIFIED BY "DHHZDHHZ"'
      '  DEFAULT TABLESPACE BFDATA'
      '  TEMPORARY TABLESPACE BFTEMP'
      '  PROFILE DEFAULT;'
      ''
      'CREATE USER BFCW8'
      '  IDENTIFIED BY "DHHZDHHZ"'
      '  DEFAULT TABLESPACE BFDATA'
      '  TEMPORARY TABLESPACE BFTEMP'
      '  PROFILE DEFAULT;'
      ''
      'CREATE USER BFCWZT8'
      '  IDENTIFIED BY "DHHZDHHZ"'
      '  DEFAULT TABLESPACE BFDATA'
      '  TEMPORARY TABLESPACE BFTEMP'
      '  PROFILE DEFAULT;'
      ''
      '--GRANT TO USER LIST'
      
        '--BFAPP8,BFBHDD8,BFPUB8,POS_USER8,BFCRM8,BFRS8,BFCW8,BFCWZT8,BFR' +
        'S8'
      ''
      'grant dba to BFAPP8 with admin option;'
      'grant dba to BFBHDD8 with admin option;'
      'grant dba to BFPUB8 with admin option;'
      'grant dba to POS_USER8 with admin option;'
      'grant dba to BFCRM8 with admin option;'
      'grant dba to BFRS8 with admin option;'
      'grant dba to BFCW8 with admin option;'
      'grant dba to BFCWZT8 with admin option;'
      '/')
    AfterExecute = OraScript1AfterExecute
    Session = OraSession1
    Left = 120
    Top = 176
  end
  object OraScript2: TOraScript
    SQL.Strings = (
      'ALTER TABLE BFPUB8.MODULE_DEF modify name VARCHAR2(50);--- '#26356#26032#33756#21333#21517
      'UPDATE BFPUB8.MODULE_DEF SET NAME =  '#39'TEST_JXC'#39'||name;'
      
        'UPDATE BFPUB8.XTCZY SET LOGIN_PASSWORD='#39'57AE4912A6C22C0F251672EA' +
        #39';--'#25152#26377#29992#25143#23494#30721#37325#32622#20026'0'
      'DELETE FROM BFPUB8.DZCLZT;--'#28165#38500#21407#26469#35760#24405#30340#25191#34892#26085#22788#29702#30340#26426#22120#35760#24405';'
      'COMMIT;')
    Session = OraSession1
    Left = 120
    Top = 232
  end
  object OraTable1: TOraTable
    TableName = 'BFPUB8.BF_BBS'
    KeyFields = 'JLBH'
    Session = OraSession1
    Left = 272
    Top = 144
  end
end
