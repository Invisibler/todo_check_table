program CheckBoxTable;

uses
  Vcl.Forms,
  Umain in 'Umain.pas' {Fmain},
  Usave in 'Usave.pas' {Fsave},
  Uload in 'Uload.pas' {Fload},
  Udifdial in 'Udifdial.pas' {FDifDial},
  Ulib in 'Ulib.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFmain, Fmain);
  Application.Run;
end.
