program FPDF_TesteFMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {dmodDataConn: TDataModule},
  unFPDF_repMEPIBase in 'unFPDF_repMEPIBase.pas',
  DelphiZXIngQRCode in 'fpdf\DelphiZXIngQRCode.pas',
  fpdf in 'fpdf\fpdf.pas',
  fpdf_ext in 'fpdf\fpdf_ext.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmodDataConn, dmodDataConn);
  Application.Run;
end.
