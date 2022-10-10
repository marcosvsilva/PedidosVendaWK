unit uConexao;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQL,
  System.SysUtils, FireDAC.DApt, FireDAC.VCLUI.Wait, System.IOUtils,
  System.Generics.Collections, System.Classes, Vcl.Dialogs;

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
    function InsertData(sql: TStringList): Integer;
  end;

const
  DB_SERVER = '';
  DB_USER = '';
  DB_PASS = '';
  DB_NAME = '';
  {$IFDEF WIN64}
    PATH_DRIVER_MYSQL = '\Driver\libmysql64.dll';
  {$ELSE}
    PATH_DRIVER_MYSQL = '\Driver\libmysql86.dll';
  {$ENDIF}

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

    FMySQLDriverLink.VendorLib :=
      ExtractFileDir(ExtractFileDir(ExtractFileDir(ParamStr(0)))) +
      PATH_DRIVER_MYSQL;
  end;
end;

constructor TConexao.Create;
begin
  if FConexao = nil then
    FConexao := TFDConnection.Create(nil);

  if FMySQLDriverLink = nil then
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

  if FMySQLDriverLink <> nil then
    FMySQLDriverLink.Free;

  inherited;
end;

function TConexao.InsertData(sql: TStringList): Integer;
var
  qryInsert: TFDQuery;
  I: Integer;
begin
  Result := 0;

  if FConexao <> nil then
  begin
    try
      FConexao.StartTransaction;

      qryInsert := TFDQuery.Create(nil);
      qryInsert.Connection := Self.FConexao;

      try
        sql.Add('; SELECT LAST_INSERT_ID() as id;');

        qryInsert.SQL := sql;
        qryInsert.Open();

        if qryInsert.RecNo > 0 then
          Result := qryInsert.FieldByName('id').AsInteger;

        if Result > 0 then
        begin
          FConexao.Commit;        
        end;
      finally
        qryInsert.Free;
      end;    
    except
      on E: Exception do
      begin
        FConexao.Rollback;
        Exception.Create(E.Message)
      end;
    end;
  end;
end;

function TConexao.ExecuteQuery(sql: TStringList): TFDQuery;
var
  qryBusca: TFDQuery;
begin
  Result := qryBusca;
  if FConexao <> nil then
  begin
    try
      qryBusca := TFDQuery.Create(nil);
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
