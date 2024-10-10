unit Unit2;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.IBBase;

type
  TdmodDataConn = class(TDataModule)
    connBase0: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qbLstOS: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RunRepBase();
  end;

var
  dmodDataConn: TdmodDataConn;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses unFPDF_repMEPIBase;

{$R *.dfm}

{ TdmodDataConn }

procedure TdmodDataConn.RunRepBase;
begin
  var pdf: TFPDF_baseMEPI;
  var i: integer := 0;

  pdf := TFPDF_baseMEPI.Create();
  try
    pdf.SetAliasNbPages();
    pdf.AddPage();
    pdf.SetFont('Arial','',12);

    for i := 1 to 40 do
      pdf.Cell(0,10,'Printing line number '+IntToStr(i), '0', 1);

    pdf.SaveToFile(pdf.GetFPDIR()+'tuto2-pas.pdf');
  finally
    pdf.Free;
  end;
end;

end.
