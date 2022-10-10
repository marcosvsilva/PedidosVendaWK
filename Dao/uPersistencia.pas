unit uPersistencia;

interface

uses
  System.Generics.Collections, System.Classes, System.SysUtils, Vcl.Dialogs,
  uConexao;

type
  IPersistencia<T> = interface
    function BuscaPorCodigo(codigo: Integer): T;
    function BuscarDados(nRegistros: Integer;
      filtro, ordem: TStringList): TList<T>;
    function UdateDados(codigo: integer; dados: TStringList): TList<T>;
    procedure InsertDados(dados: TList<T>);
    procedure DeleteDados(codigos: TStringList);
  end;

  TPersistencia<T> = class(TInterfacedObject, IPersistencia<T>)
  protected
    FConexao: TConexao;
  public
    constructor Create;
    destructor Destroy; override;

    function BuscaPorCodigo(codigo: Integer): T; virtual; abstract;
    function BuscarDados(nRegistros: Integer;
      filtro, ordem: TStringList): TList<T>; virtual; abstract;
    function UdateDados(codigo: integer; dados: TStringList):
      TList<T>; virtual; abstract;
    procedure InsertDados(dados: TList<T>); virtual; abstract;
    procedure DeleteDados(codigos: TStringList); virtual; abstract;
  end;

implementation

{ TPersistencia<T> }

constructor TPersistencia<T>.Create;
begin
  try
    FConexao := TConexao.Create;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      Exception.Create('Falha ao criar conexao na camada de persistencia');
    end;
  end;
end;

destructor TPersistencia<T>.Destroy;
begin
  if FConexao <> nil then
    FConexao.Free;

  inherited;
end;

end.
