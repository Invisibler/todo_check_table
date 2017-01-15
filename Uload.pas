unit Uload;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Ulib;

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
     Function EditCreate(x,y,i:integer):TEdit;
     Function LabelCreate(x,y,i:integer):Tlabel;
     Function CBCreate(x,y,i:integer):TCheckBox;
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
  albl:array of TLabel;
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

Function TFload.EditCreate(x,y,i:integer):TEdit;
Const Edt_WIDTH=100;
      Edt_HEIGHT=20;
begin
  result:=TEdit.Create(self);
  result.Left:=x;
  result.Top:=y;
  result.Width:=EDT_WIDTH;
  result.Height:=EDT_HEIGHT;
  result.text:=r.a2[i];
  result.Parent:=self;
end;

Function TFload.LabelCreate(x,y,i:integer):Tlabel;
Const LBL_WIDTH=100;
      LBL_HEIGHT=20;
begin
    result:=TLabel.Create(self);
    result.Left:=x;
    result.Top:=y;
    result.Width:=LBL_WIDTH;
    result.Height:=LBL_HEIGHT;
    result.Caption:=r.a2[i];
    result.Parent:=self;
end;

Function TFload.CBCreate(x,y,i:integer):TCheckBox;
Const CB_WIDTH=100;
      CB_HEIGHT=20;
begin
    result:=Tcheckbox.Create(self);
    result.Left:=x;
    result.Top:=y;
    result.Width:=CB_WIDTH;
    result.Height:=CB_HEIGHT;
    result.Caption:=r.a1[i];
    result.Parent:=self;
end;

procedure TFload.BtnLoadClick(Sender: TObject);
var x1,y1,x2,y2,x3,y3,dy,i:integer;
    cb:Tcheckbox;
    oldf:boolean;
    fn1,Scbb:string;
begin
x1:=10;y1:=40;x2:=200;y2:=y1+5;dy:=20;x3:=150;y3:=y1+5;
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
setlength(albl,r.m);
for I := 0 to r.n-1 do
  begin
    acb[i]:=CBCreate(x1,y1,i);
    y1:=y1+dy;
  end;
for I := 0 to r.m-1 do
  begin
    aedt[i]:=EditCreate(x2,y2,i);
    albl[i]:=LabelCreate(x3,y3,i);
    y2:=y2+dy;
    y3:=y2;
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

