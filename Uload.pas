unit Uload;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Ulibrary;

type
  TFload = class(TForm)
    CheckBox1: TCheckBox;
    BtnClose: TButton;
    BtnLoad: TButton;
    BtnSave: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure BtnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnLoadClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);

  private
     function Loadfile(fn:string):rec;
     Procedure savefile(fn1:string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  r:rec;
  Fload: TFload;
  fn:string;
  f,f1:textfile;
  acb:array of Tcheckbox;
  aedt:array of TEdit;
const asub:string='actived/';
implementation

{$R *.dfm}

function TFload.Loadfile(fn:string):rec;
var subp,s:string;
    i:integer;
    b:boolean;
    r:rec;
begin
subp:=getCurrentdir;
assignfile(f,fn);
reset(f);
readln(f,s);r.n:=strtoint(s);
readln(f,s);r.m:=strtoint(s);
readln(f,s);r.b:=StrToBool(s);
setlength(r.a1,r.n);
setlength(r.a2,r.m);
for I := 0 to r.n-1 do
  readln(f,r.a1[i]);
for I := 0 to r.m-1 do
  readln(f,r.a2[i]);
closefile(f);
result:=r;
end;


procedure TFload.BtnCloseClick(Sender: TObject);
begin
CloseProgram;
end;

procedure TFload.BtnLoadClick(Sender: TObject);
var x1,y1,x2,y2,dy,i:integer;
    cb:Tcheckbox;
    oldf:boolean;
    fn1,Scbb:string;
Const CB_WIDTH=100;
      CB_HEIGHT=20;
begin
x1:=10;y1:=40;x2:=200;y2:=100;dy:=20;
oldf:=false;
if OpenDialog1.Execute() then
  begin
    fn:=OpenDialog1.FileName;
    if pos('.cba',OpenDialog1.FileName)=0 then
      r:=loadfile(fn)
    else
      begin
      oldf:=true;
      fn1:=fn;
      assignfile(f1,fn);
      reset(f1);
      readln(f1,fn);
      r:=loadfile(fn);
      end
  end;
setlength(acb,r.n);
setlength(aedt,r.m);
for I := 0 to r.n-1 do
  begin
    acb[i]:=Tcheckbox.Create(self);
    acb[i].Left:=x1;
    acb[i].Top:=y1;
    acb[i].Width:=CB_WIDTH;
    acb[i].Height:=CB_HEIGHT;
    acb[i].Caption:=r.a1[i];
    acb[i].Parent:=self;
    y1:=y1+dy;
  end;
for I := 0 to r.m-1 do
  begin
    aedt[i]:=TEdit.Create(self);
    aedt[i].Left:=x2;
    aedt[i].Top:=y2;
    aedt[i].Width:=CB_WIDTH;
    aedt[i].Height:=CB_HEIGHT;
    aedt[i].text:=r.a2[i];
    aedt[i].Parent:=self;
    y2:=y2+dy;
  end;
if oldf then
  begin
    for I := 0 to r.n-1 do
        begin
          readln(f1,Scbb);
          acb[i].Checked:=strtobool(Scbb);
        end;
    closefile(f1);
  end;
end;

Procedure TFload.savefile(fn1:string);
var i:integer;
begin
assignfile(f1,fn1);
rewrite(f1);
writeln(f1,fn);
for I:=0 to r.n-1 do
writeln(f1,acb[i].Checked);
for I:=0 to r.m-1 do
writeln(f1,aedt[i].Text);
closefile(f1);
end;

procedure TFload.BtnSaveClick(Sender: TObject);
begin
savedialog1.InitialDir:=GetCurrentDir+asub;
if Savedialog1.Execute then
  begin
  savefile(Savedialog1.FileName);
  end;
end;

procedure TFload.FormCreate(Sender: TObject);
var path:WideString;
    sub:PWideChar;
begin
sub:='cbt\';
path:=GetKnownFolderPath(FOLDERID_Userdocuments);
if DirectoryExists(path+'/'+sub) then
  begin
    SetCurrentDir(path+'/'+sub);
    OpenDialog1.InitialDir:=GetCurrentDir;
  end
else
  begin
    SetCurrentDir(path);
    CreateDir(sub);
    SetCurrentDir(path+'/'+sub);
    OpenDialog1.InitialDir:=GetCurrentDir;
  end;
end;

end.
