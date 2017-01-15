unit Umain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls,Usave,Uload,Ulib;

type
  TFmain = class(TForm)
    MainMenu1: TMainMenu;
    save1: TMenuItem;
    load1: TMenuItem;
    BtnClose: TButton;
    procedure save1Click(Sender: TObject);
    procedure load1Click(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fmain: TFmain;

implementation

{$R *.dfm}

procedure TFmain.BtnCloseClick(Sender: TObject);
begin
CloseProgram;
end;

procedure TFmain.load1Click(Sender: TObject);
begin
Application.CreateForm(TFload, Fload);
Fload.Show;
end;

procedure TFmain.save1Click(Sender: TObject);
begin
Application.CreateForm(TFsave, Fsave);
Fsave.Show;
end;

end.
