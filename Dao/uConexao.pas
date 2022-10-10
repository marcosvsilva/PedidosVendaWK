unit uConexao;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQL,
  System.SysUtils, FireDAC.DApt, FireDAC.VCLUI.Wait,
  System.Generics.Collections, System.Classes;

type
  TConexao = class
  private
    FConexao: TFDConnection;
    FMySQLDriverLink: TFDPhysMySQLDriverLink;

    procedure SetConexao;
  public
    constructor Create;
    destructor Destroy; override;

    function ExecuteQuery(sql: TStringList): TFDQuery;
    function ExecuteCommand(sql: TStringList): Boolean;
  end;

const
  DB_SERVER = '';
  DB_USER = '';
  DB_PASS = '';
  DB_NAME = '';

implementation

{ TConexao }

procedure TConexao.SetConexao;
begin
  if FConexao <> nil then
  begin
    FConexao.Params.Clear;
    FConexao.Params.Add('DriverID=MySQL');
    FConexao.Params.Add('Server=' + DB_SERVER);
    FConexao.Params.Add('Database=' + DB_NAME);
    FConexao.Params.Add('User_Name=' + DB_USER);
    FConexao.Params.Add('Password=' + DB_PASS);
    FConexao.Params.Add('CharacterSet=utf8');

    FMySQLDriverLink.VendorLib := '';
  end;
end;

constructor TConexao.Create;
begin
  FConexao := TFDConnection.Create(nil);
  FMySQLDriverLink := TFDPhysMySQLDriverLink.Create(nil);

  Self.SetConexao();

  try
    FConexao.Connected := True;
    FConexao.Connected := False;
  except
    on E: Exception do
    begin
      Exception.Create('Falha de conexao com o banco de dados');
    end;
  end;
end;

destructor TConexao.Destroy;
begin
  if FConexao <> nil then
    FConexao.Free;

  inherited;
end;

function TConexao.ExecuteCommand(sql: TStringList): Boolean;
var
  cmmComando: TFDCommand;
begin
  if FConexao <> nil then
  begin
    Result := true;
  end;
end;

function TConexao.ExecuteQuery(sql: TStringList): TFDQuery;
var
  qryBusca: TFDQuery;
begin
  Result := qryBusca;
  if FConexao <> nil then
  begin
    qryBusca := TFDQuery.Create(nil);
    try
      qryBusca.Connection := Self.FConexao;
      qryBusca.SQL := sql;

      qryBusca.Open();
      Result := qryBusca;
    except
      on E: Exception do
      begin
        Exception.Create('Falha ao buscar informacoes no DB');
      end;
    end;
  end;
end;

end.
