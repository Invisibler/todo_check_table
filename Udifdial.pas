unit Udifdial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,USave;

type
  TFDifDial = class(TForm)
    BtnOk: TButton;
    BtnCancel: TButton;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDifDial: TFDifDial;

implementation

{$R *.dfm}

procedure TFDifDial.BtnCancelClick(Sender: TObject);
begin
FSave.bs:=false;
hide;
end;

procedure TFDifDial.BtnOkClick(Sender: TObject);
begin
FSave.bs:=true;
Case Radiogroup1.ItemIndex of
  0:;
  1:FSave.b1:=false;
  2:FSave.b1:=true;
End;
Case Radiogroup2.ItemIndex of
  0:;
  1:FSave.b2:=false;
  2:FSave.b2:=true;
End;
hide;
end;

procedure TFDifDial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
hide;
end;

end.
