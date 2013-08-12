unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, FMTBcd, StdCtrls, DB, SqlExpr, MemDS, DBAccess, Ora,
  OdacVcl, ExtCtrls, DAScript, OraScript, inifiles, EncdDecd, FileCtrl,
  OraSmart, ComCtrls, StrUtils;

type
  TForm1 = class(TForm)
    Button2: TButton;
    Button1: TButton;
    OraSession1: TOraSession;
    ConnectDialog1: TConnectDialog;
    Button3: TButton;
    Button4: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    OraScript1: TOraScript;
    OraScript2: TOraScript;
    Label9: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edt_usr: TEdit;
    edt_psw: TEdit;
    Label10: TLabel;
    Label2: TLabel;
    Label11: TLabel;
    Label7: TLabel;
    OraTable1: TOraTable;
    Button5: TButton;
    RichEdit1: TRichEdit;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure OraSession1AfterConnect(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OraScript1AfterExecute(Sender: TObject; SQL: string);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  APP_DATE1: string; //����1�������������ڣ�������2���̶����ڣ�
const APP_DATE2 = '405250356750561'; //20130831
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ConnectDialog1.Execute;
  edt_usr.Text := OraSession1.Username;
  edt_psw.Text := OraSession1.Password;
  RichEdit1.Text := OraSession1.Server + '���Կ⣡��';
  //rzrichedit1.Lines.Clear;
 // OraTable1.Open;
  //rzrichedit1.Lines.Assign(TBlobField(OraTable1.Fields[5]));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  BUTTON2.Enabled := FALSE;
  OraScript1.Execute;
end;

procedure TForm1.OraSession1AfterConnect(Sender: TObject);
begin
  if OraSession1.Connected = TRUE then begin
    Button1.Enabled := false;
    Button2.Enabled := true;
    Label8.Caption := '�����ӵ� ' + orasession1.Server;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  s: TStringList;
begin
  if FileExists('Fininsh') then DeleteFile('Fininsh');
  Button3.Enabled := false;
  s := TStringList.Create;
// IMPDP system/DHHZDHHZ@ORCL  directory=backdir dumpfile=HS_NN_BAK1.DMP schemas=(BFAPP8,BFPUB8,BFBHDD8,POS_USER8,BFCRM8,BFRS8,BFCW8,BFCWZT8) version=10.2.0.1.0
//pause
  s.add('IMPDP ' + edt_usr.Text + '/' + edt_psw.Text + '@ORCL directory=BACKUPDIR dumpfile=BAK.DMP schemas=(BFAPP8,BFPUB8,BFBHDD8,POS_USER8,BFCRM8,BFRS8,BFCW8,BFCWZT8) version=10.2.0.1.0');
  s.add('pause');
  s.add('dir >Fininsh');
  s.Add('del %0');
  s.SaveToFile(extractfilepath(application.exename) + 'imp.bat');
  WinExec(pchar(extractFilePath(application.exeName) + 'imp.bat'), SW_SHOW); //SW_HIDE
  freeandnil(s);
  while True do
  begin
    if FileExists('Fininsh') then begin
      Button4.Enabled := true;
      Button3.Caption := '����2_���';
      Break;
    end;
  end;



end;

procedure TForm1.Button4Click(Sender: TObject);
var
  s: TStringList;
begin
  if FileExists('Fininsh') then DeleteFile('Fininsh');
  BUTTON4.Enabled := FALSE;
 // OraScript2.Execute;

  Memo1.Lines.SaveToFile('cmpproc.sql');
   //����Ҫ�ر���Ĵ洢���̵�BAT��SQL�ļ�
  s := TStringList.Create;
  s.add('sqlplus ' + edt_usr.Text + '/' + edt_psw.Text + '@' + StringReplace(orasession1.Server, '1521:', '1521/', [rfReplaceAll]) + ' @cmpproc.sql');
  s.Add('dir >Fininsh');
  s.SaveToFile(extractfilepath(application.exename) + 'exec.bat');
  WinExec(pchar(extractFilePath(application.exeName) + 'exec.bat'), SW_SHOW); //SW_HIDE
  freeandnil(s);
  //����ִ���ر���Ĵ洢���̵�BAT��SQL�ļ�
  while True do begin
    if FileExists('Fininsh') then begin
      DeleteFile('Fininsh');
      s := TStringList.Create;
      s.add('sqlplus ' + edt_usr.Text + '/' + edt_psw.Text + '@' + StringReplace(orasession1.Server, '1521:', '1521/', [rfReplaceAll]) + ' @compproc1.sql');
      s.add('dir >Fininsh1');
      s.SaveToFile(extractfilepath(application.exename) + 'run.bat');
      WinExec(pchar(extractFilePath(application.exeName) + 'run.bat'), SW_SHOW); //SW_HIDE
      freeandnil(s);
     Break;
    end;
  end;
      while True do begin
    if FileExists('Fininsh1') then begin
      button1.Enabled := false;
      button2.Enabled := false;
      button3.Enabled := false;
      Button4.Caption := 'ȫ�����';
      Button5.Enabled := TRUE;
      DeleteFile('cmpproc.sql');
      DeleteFile('compproc1.sql');
      DeleteFile('exec.bat');
      DeleteFile('run.bat');
      DeleteFile('Fininsh');
      DeleteFile('Fininsh1');
      Break;
    end;
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
var inifile: tinifile;
  i: Integer;
  app_date3: string;
begin
  APP_DATE1 := FloatToStr(StrToFloat(FormatDateTime('yyyymmdd', now)) * StrToFloat(FormatDateTime('yyyymmdd', now)));
  if (SysUtils.Win32Platform = VER_PLATFORM_WIN32_NT)
    and (SysUtils.Win32MajorVersion = 5)
    and (SysUtils.Win32MinorVersion = 1) then begin //�жϲ���ϵͳ�Ƿ�XP
    if DirectoryExists('d:\ORACLE\oradata\orcl') then begin

      if not FileExists('c:\windows\set.ini') then
      begin
        try
          i := filecreate('c:\windows\set.ini');
          Application.MessageBox('�������л���...', '��ʼ��', MB_OK +
            MB_ICONINFORMATION + MB_TOPMOST);
          FileClose(i);
          Inifile := TInifile.Create('c:\windows\set.ini');
          inifile.WriteString('param', 'param1', EncodeString(APP_DATE1));
          inifile.WriteString('param', 'param2', EncodeString(app_date2));
          inifile.Free;
          Application.MessageBox('���óɹ������������г���', '��ʼ��', MB_OK +
            MB_ICONINFORMATION + MB_TOPMOST);
        finally
          Application.Terminate;
        end;
      end
      else
      begin
        inifile := TIniFile.Create('c:\windows\set.ini');
        app_date3 := inifile.ReadString('param', 'param1', 'param1');
        app_date3 := DecodeString(app_date3);
     // ShowMessage(app_date3);
        if StrToFloat(app_date2) - strtofloat(app_date3) <= 0 then
        begin
          Application.Terminate;
        end;
      end;
    end
    else
    begin //�����༶�ļ���  uses FileCtrl; ForceDirectories('C:/abc/1/2/3');
      ForceDirectories('d:\ORACLE\oradata\orcl');
    end;
  end
  else
  begin
    if Application.MessageBox('��֧�ֵ�ǰ����ϵͳ���Ƿ����ִ�У�' + #13#10
      + #13#10 + 'ǿ��ִ�п��ܻ��������Ԥ֪�Ĵ���', '����', MB_YESNO +
      MB_ICONWARNING + MB_DEFBUTTON2) = IDYES then
    begin
     // ShowMessage('Go...Go...Go...') //
    end
    else
    begin
      Application.Terminate;
    end;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var inifile: TIniFile;
begin
  try
    Inifile := TInifile.Create('c:\windows\set.ini');
    inifile.WriteString('param', 'param1', EncodeString(APP_DATE1));
    inifile.Free;
  except
  end;
end;

procedure TForm1.OraScript1AfterExecute(Sender: TObject; SQL: string);
begin
  Button2.Caption := '����1_���';
  Button3.Enabled := TRUE;
end;

procedure TForm1.Button5Click(Sender: TObject);
var Stream: Tmemorystream;
begin
 //����Richedit����
  RichEdit1.SelStart := sendmessage(RichEdit1.Handle, em_lineindex, 0, 0);
  RichEdit1.SelLength := length(RichEdit1.Lines[0]); //��һ��
  RichEdit1.SelAttributes.Color := clred; //��ɫ
  RichEdit1.SelAttributes.Size := 25; //�ֺ�

  RichEdit1.Text := LeftStr(OraSession1.Server, 9) + '  ���Կ⣡��';
  Stream := TMemoryStream.Create;
  RichEdit1.Lines.SaveToStream(Stream);
  with OraTable1 do
  begin
    Open;
    edit;
    oratable1.Fields[1].Value := '��ӭʹ�ò��Կ�';
    TBlobField(OraTable1.Fields[5]).LoadFromStream(Stream);
    post;
  end;
  ShowMessage('���óɹ���');
  button5.Enabled := false;
end;

end.

