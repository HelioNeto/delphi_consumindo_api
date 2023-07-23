unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  REST.Client, REST.JSON, REST.Types, System.JSON, IpPeerClient, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdCookieManager, IdURI, IdZLibCompressorBase, IdCompressorZLib, System.NetEncoding,
  Vcl.Imaging.jpeg;

type
  TfrmPrincipal = class(TForm)
    edtUrl: TEdit;
    lblUrl: TLabel;
    btnGet: TBitBtn;
    Image1: TImage;
    lblGenero: TLabel;
    lblNome: TLabel;
    mmResultado: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnGetClick(Sender: TObject);
  private
    { Private declarations }
    FHTTP: TIdHTTP;
    FIdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
    FURLConsulta, FUserAgent, FAccept, FAcceptCharSet, FContentType: String;
    FBasicAuthentication: Boolean;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses Api.Classes;

{$R *.dfm}

procedure TfrmPrincipal.btnGetClick(Sender: TObject);
var
  strResult: String;
  MS : TMemoryStream;
  JPEG: TJPEGImage;
  objJson: TJSONObject;
  objRespApi: TRespApi;
begin
  FUserAgent := 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Acoo Browser; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; Maxthon; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618)';
  FAccept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
  FAcceptCharSet := 'UTF-8, *;q=0.8';
  FContentType := 'application/x-www-form-urlencoded';
  FBasicAuthentication := False;

  FHTTP.Request.Clear;
  FHTTP.Request.UserAgent           := FUserAgent;
  FHTTP.Request.AcceptCharSet       := FAcceptCharSet;
  FHTTP.Request.ContentType         := FContentType;
  FHTTP.Request.BasicAuthentication := FBasicAuthentication;
  FHTTP.Request.CustomHeaders.Clear;

  FURLConsulta := edtUrl.Text;

  try
    strResult := FHTTP.Get(FURLConsulta);
    mmResultado.lines.add(strResult);
    objJson := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(strResult), 0) as TJSONObject;
    objRespApi := TRespApi.Create;
    TJson.JsonToObject(objRespApi, objJson);

    lblGenero.Caption := 'Sexo: '+ objRespApi.results[0].gender;
    lblNome.Caption := 'Nome: '+ objRespApi.results[0].name.title + ' ' +
    objRespApi.results[0].name.first + ' ' + objRespApi.results[0].name.last;

    //AQUI BUSCA IMAGEM:
    MS := TMemoryStream.Create;
    JPEG := TJPEGImage.Create;
    try
      FHTTP.get(objRespApi.results[0].picture.medium,MS);
      Ms.Seek(0,soFromBeginning);
      JPEG.LoadFromStream(MS);
      image1.Picture.Assign(JPEG);

    finally
      FreeAndNil(JPEG);
      FreeAndNil(MS);
    end;

  except
    on E: EIdHTTPProtocolException do
    begin
      mmResultado.Lines.add(E.ErrorMessage);
    end;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FHTTP                         := TIdHTTP.Create;
  FIdSSLIOHandlerSocketOpenSSL  := TIdSSLIOHandlerSocketOpenSSL.Create(FHTTP);
  FIdSSLIOHandlerSocketOpenSSL.SSLOptions.SSLVersions := [sslvTLSv1_2];
  FHTTP.IOHandler               := FIdSSLIOHandlerSocketOpenSSL;
  FHTTP.CookieManager           := TIdCookieManager.Create(FHTTP);
  FHTTP.ConnectTimeout          := 30000;
  FHTTP.HandleRedirects         := True;
  FHTTP.AllowCookies            := True;
  FHTTP.RedirectMaximum         := 10;
  FHTTP.HTTPOptions             := [hoForceEncodeParams];
end;

end.
