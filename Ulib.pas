unit Ulib;

interface
Uses ActiveX,Windows,Vcl.Forms;
type
 TKnownFolderID = TGUID;
   rec=record
        b:boolean;
        n,m:integer;
        a1,a2:array of string;
     end;
  rec1=record
         b:boolean;
         n,m:integer;
         a1,a2,a3:array of string;
     end;
function GetKnownFolderPath(const ID: TKnownFolderID): WideString;
Procedure ProgOnTop(form1:Tform);
procedure MXY(x,y: word);
procedure ClickXY(x,y: word);
Procedure CloseProgram;
Function WhereCursor:TPoint;
const
 FOLDERID_Userdocuments: TKnownFolderID = '{FDD39AD0-238F-46AF-ADB4-6C85480369C7}';

implementation

Procedure ProgOnTop(form1:Tform);
begin
with form1 do SetWindowPos(Handle,
HWND_TOPMOST,
Left,
Top,
Width,
Height,
SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
end;

procedure MXY(x,y: word);
var x1,y1:word;
begin
x1 := Round(x * (65535 / Screen.Width));
y1 := Round(y * (65535 / Screen.Height));
Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_MOVE, x1, y1, 0, 0);
end;

procedure ClickXY(x,y: word);
var x1,y1:word;
begin
x1:= Round(x * (65535 / Screen.Width));
y1:= Round(y * (65535 / Screen.Height));
Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_MOVE, x1, y1, 0, 0);
Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTDOWN, x1, y1, 0, 0);
Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTUP, x1, y1, 0, 0);
end;

procedure tsvet(x,y:word;var pix:cardinal);
var  Dc : HDC;
begin
Dc:=GetDC(0);
Pix:=GetPixel(Dc, X, Y);
ReleaseDC(0, Dc);
end;

Function WhereCursor:TPoint;
Begin
GetCursorPos(Result);
End;

Procedure CloseProgram;
begin
Application.MainForm.Close;
end;

function GetKnownFolderPath(const ID: TKnownFolderID): WideString;
type
 TSHGetKnownFolderPath = function(const rfid: TKnownFolderID; dwFlags: DWord;
   hToken: THandle; var ppSzPath: LPWSTR) : HResult; stdCall;
var
 hShell: HModule;
 SHGetKnownFolderPath: TSHGetKnownFolderPath;
 Buffer: LPWSTR;
begin
 Result := '';
 hShell := LoadLibrary('shell32.dll');
 if hShell > 0 then
   try
     @SHGetKnownFolderPath := GetProcAddress(hShell, 'SHGetKnownFolderPath');
     if Assigned(SHGetKnownFolderPath) then
       if Succeeded(SHGetKnownFolderPath(ID, 0, 0, Buffer)) then
         try
           Result := Buffer;
         finally
           CoTaskMemFree(Buffer);
         end;
   finally
     FreeLibrary(hShell);
   end;
end;
end.

