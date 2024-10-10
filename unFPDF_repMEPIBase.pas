unit unFPDF_repMEPIBase;

interface

uses System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, fpdf, fpdf_ext, System.IOUtils;

type
  TFPDF_baseMEPI = class(TFPDFExt)
protected
    const
      BordaSup = 10;
      BordaEsq = 20;
      AlturaHeader = 30;
      AlturaTitulo = 16;
      AlturaDetalhe = 7;
      ImgLarg = 65;
      ImgAlt = 0;

      Rodape = 25;

    var
      fpdir: String;
      fpfiledir: String;

    procedure InternalCreate; override;
  public
    constructor Create();

    procedure Header; override;
    procedure PrintBackground();
    procedure Footer; override;
    function GetFPDIR():string;
  end;

implementation

{ TFPDF_baseMEPI }

constructor TFPDF_baseMEPI.Create;
begin
  inherited Create(
    TFPDFOrientation.poPortrait,
    TFPDFUnit.puMM,
    TFPDFPageFormat.pfA4);

//  Self.SetUTF8(True);
  Self.SetMargins(BordaEsq, BordaSup, BordaEsq);
  Self.SetCompression(True);
  Self.SetAuthor('GrupoMEPI');
  Self.SetTitle('Relatório 01');
  Self.SetCreator('GMERP');
end;

procedure TFPDF_baseMEPI.Footer;
begin
  Self.SetLineWidth(0.75);
  Self.Line(BordaEsq, GetPageHeight - Rodape, GetPageWidth - BordaEsq, GetPageHeight - Rodape);

  Self.SetY(-Rodape+1);
  Self.SetFont('Arial', 'B', 9);
  Self.Cell(0, 5, 'MEPI INDÚSTRIA E COMÉRCIO DE EQUIPAMENTOS DE PROTEÇÃO INDIVIDUAL LTDA', '0', 1, 'L');
  Self.SetFont('Arial', '', 8);
  Self.Cell(0, 5, 'Rua Belmira Montes Barroso, 375 - Jardim Maracanã - Uberaba/MG - CEP: 38041-096', '0', 1, 'L');
  Self.Cell(0, 5, 'CNPJ: 04.918.841.0001-33     (34) 3313-8569    www.grupomepi.com.br', '0', 1, 'L');
end;

function TFPDF_baseMEPI.GetFPDIR: string;
begin
  Result := Self.fpdir;
end;

procedure TFPDF_baseMEPI.Header;
begin
  Self.PrintBackground;
  Self.SetFont('Arial', 'B', 15);

  Self.SetXY(BordaEsq + ImgLarg, BordaSup);
  Self.Cell(
    Self.GetPageWidth - 2*BordaEsq - ImgLarg,
    AlturaTitulo,
    'Título do relatório',
    '',
    0,
    'C',
    false);
  Self.RoundedRect(BordaEsq + ImgLarg, BordaSup, Self.GetPageWidth - 2*BordaEsq - ImgLarg, AlturaTitulo, 2, '1234', '');
  Self.SetFont('Arial', '', 10);

  Self.SetXY(BordaEsq + ImgLarg, BordaSup + AlturaTitulo + AlturaDetalhe * 0);
  Self.Cell(30, AlturaDetalhe, 'Campo 1', '1', 0, 'L');
  Self.Cell(25, AlturaDetalhe, 'Campo 2', '1', 0, 'L');
  Self.Cell(25, AlturaDetalhe, 'Campo 3', '1', 0, 'L');
  Self.Cell(25, AlturaDetalhe, 'Campo 4', '1', 0, 'L');


  Self.SetXY(BordaEsq + ImgLarg, BordaSup + AlturaTitulo + AlturaDetalhe * 1);
  Self.Cell(30, AlturaDetalhe, 'L2 - C1', '1', 0, 'L');
  Self.Cell(25, AlturaDetalhe, 'L2 - C2', '1', 0, 'L');
  Self.Cell(25, AlturaDetalhe, 'L2 - C3', '1', 0, 'L');
  Self.SetFont('Arial', 'I', 8);
  Self.Cell(25, AlturaDetalhe, 'Pág.: ' + IntToStr(PageNo()) + ' de {nb}', '1', 0, 'R');

  Self.SetXY(BordaEsq, BordaSup + AlturaHeader);
end;

procedure TFPDF_baseMEPI.InternalCreate;
begin
  inherited InternalCreate;
  fpdir := ExtractFilePath(ParamStr(0)) + PathDelim;
  fpfiledir := fpdir + '..' + PathDelim;
end;

procedure TFPDF_baseMEPI.PrintBackground;
begin
  Self.SetXY(0,0);
  Self.Image(
    fpfiledir + '../timbrado.png',
    0,
    0,
    Self.GetPageWidth,
    Self.GetPageHeight);
//  Self.RoundedRect(10, 20, 40, 80, 5, '1234', '');
end;

end.
