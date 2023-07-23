unit Api.Classes;

interface

type

  TName = class
    private
      Ftitle: string;
      Ffirst: string;
      Flast: string;
    public
      constructor create;
      destructor destroy; override;
      property title: string read Ftitle write Ftitle;
      property first: string read Ffirst write Ffirst;
      property last: string read Flast write Flast;
  end;

  TPicture = class
    private
      Fmedium: String;
    public
      constructor create;
      destructor destroy; override;
      property medium: String read Fmedium write Fmedium;
  end;

  TResults = class
    private
      Fgender: string;
      Fname: TName;
      Fpicture: TPicture;
    public
      constructor create;
      destructor destroy; override;
      property gender: string read Fgender write Fgender;
      property name: TName read Fname write Fname;
      property picture: TPicture read Fpicture write Fpicture;
  end;

  TInfo = class
    private
      Fseed: string;
      Fresults: Integer;
      Fpage: Integer;
      Fversion: String;
    public
      constructor create;
      destructor destroy; override;
      property seed: string read Fseed write Fseed;
      property results: Integer read Fresults write Fresults;
      property page: Integer read Fpage write Fpage;
      property version: String read Fversion write Fversion;
  end;

  TArrResults = Array of TResults;

  TRespApi = class
    private
      Fresults: TArrResults;
      Finfo: TInfo;
    public
      constructor create;
      destructor Destroy; override;
      property results: TArrResults read Fresults write Fresults;
      property info: TInfo read Finfo write Finfo;
  end;

implementation

{ TRespApi }

constructor TRespApi.create;
begin

end;

destructor TRespApi.Destroy;
begin

  inherited;
end;

{ TResults }

constructor TResults.create;
begin

end;

destructor TResults.destroy;
begin

  inherited;
end;

{ TInfo }

constructor TInfo.create;
begin

end;

destructor TInfo.destroy;
begin

  inherited;
end;

{ TName }

constructor TName.create;
begin

end;

destructor TName.destroy;
begin

  inherited;
end;

{ TPicture }

constructor TPicture.create;
begin

end;

destructor TPicture.destroy;
begin

  inherited;
end;

end.
