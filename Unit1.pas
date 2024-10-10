unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses fpdf, Unit2;

procedure TForm1.Button1Click(Sender: TObject);
var
  pdf: TFPDF;
begin
  pdf := TFPDF.Create();
  try
    pdf.SetCompression(False);
    pdf.AddPage();
    pdf.SetFont('Arial','B',16);
    pdf.Cell(40,10,'Hello World!');
    pdf.SaveToFile(ExtractFilePath(ParamStr(0))+PathDelim+'tuto1-pas.pdf');
  finally
    pdf.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  dmodDataConn.RunRepBase;
end;

end.
