unit Usave;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls,SHFolder;

type
  TFsave = class(TForm)
    BtnClose: TButton;
    CheckBox1: TCheckBox;
    EdtCB: TEdit;
    Memo1: TMemo;
    BtnSave: TButton;
    BtnLoad: TButton;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    BtnSaveAs: TButton;
    Memo2: TMemo;
    Label2: TLabel;
    EdtVar: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnLoadClick(Sender: TObject);
    procedure BtnSaveAsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
  private
  Procedure s_Savefile(fn:string);
  Procedure s_loadfile(fn:string);
    { Private declarations }
  public
  b1,b2,bs:boolean;
    { Public declarations }
  end;

var
  Fsave: TFsave;
  fn:string;
  f:textfile;
implementation

{$R *.dfm}
uses Udifdial,Ulib;

Procedure TFSave.s_Savefile(fn:string);
var i:integer;
begin
bs:=true;
if strtoint(EdtCB.Text)=Memo1.Lines.Count
then
  b1:=false
else
  b1:=true;
if strtoint(EdtVar.Text)=Memo2.Lines.Count
then
  b2:=false
else
  b2:=true;
if b1 or b2 then
  begin
    Application.CreateForm(TFDifDial, FDifDial);
    FdifDial.ShowModal;
  end;
if bs then
  begin
    assignfile(f,fn);
    rewrite(f);
    writeln(f,EdtCB.Text);
    writeln(f,EdtVar.Text);
    writeln(f,Checkbox1.Checked);

    for i := 0 to Memo1.Lines.Count-1 do
      writeln(f,memo1.Lines[i]);
    for i := 0 to Memo2.Lines.Count-1 do
      writeln(f,memo2.Lines[i]);
    closefile(f);
    BtnSave.Enabled:=true;
  end;
end;

Procedure TFSave.s_Loadfile(fn:string);
Var i,j,k:integer;
    s:string;
begin
  memo1.Lines.Clear;
  memo2.Lines.Clear;
  assignfile(f,fn);
  reset(f);
  readln(f,j);
  EdtCb.Text:=inttostr(j);
  readln(f,k);
  EdtVar.Text:=inttostr(k);
  readln(f,s);
  if strtobool(s) then Checkbox1.Checked:=true
    else  Checkbox1.Checked:=false;
  for I := 1 to J do
    begin
      readln(f,s);
      Memo1.Lines.Add(s);
    end;
  for I := 1 to k do
    begin
      readln(f,s);
      Memo2.Lines.Add(s);
    end;
  closefile(f);
end;

procedure TFsave.BtnCloseClick(Sender: TObject);
begin
CloseProgram;
end;

procedure TFsave.BtnLoadClick(Sender: TObject);
begin
if OpenDialog1.Execute() then
  begin
    fn:=OpenDialog1.FileName;
    BtnSave.Enabled:=true;
    s_loadfile(fn);
  end;
end;

Procedure smsave(fn:string);
begin
Showmessage('file '+fn+' saved');
end;

procedure TFsave.BtnSaveAsClick(Sender: TObject);
begin
if SaveDialog1.Execute() then
  begin
    fn:=SaveDialog1.FileName;
    s_Savefile(fn);
    smsave(fn);
  end;
end;

procedure TFsave.BtnSaveClick(Sender: TObject);
begin
s_savefile(fn);
smsave(fn);
end;

procedure TFsave.FormCreate(Sender: TObject);
var path:WideString;
    sub:PWideChar;
begin
sub:='cbt\';
path:=GetKnownFolderPath(FOLDERID_Userdocuments);
if DirectoryExists(path+'/'+sub) then
  begin
    SetCurrentDir(path+'/'+sub);
    Opendialog1.InitialDir:=GetCurrentDir;
    SaveDialog1.InitialDir:=GetCurrentDir;
  end
else
  begin
    SetCurrentDir(path);
    CreateDir(sub);
    SetCurrentDir(path+'/'+sub);
    Opendialog1.InitialDir:=GetCurrentDir;
    Savedialog1.InitialDir:=GetCurrentDir;
  end;
end;

end.
