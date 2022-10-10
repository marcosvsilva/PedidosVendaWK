unit uCidadeEstadoDAO;

interface

uses
  System.Generics.Collections, System.Classes, System.StrUtils,
  FireDAC.Comp.Client, SysUtils, uPersistencia, uCidadeEstado, uConexao;

type
  TEstadoDAO = class(TPersistencia<TEstado>)
  public
    function BuscaPorCodigo(codigo: Integer): TEstado; override;
  end;

  TCidadeDAO = class(TPersistencia<TCidade>)
  public
    function BuscaPorCodigo(codigo: Integer): TCidade; override;
  end;

implementation

{ TEstadoDAO }

function TEstadoDAO.BuscaPorCodigo(codigo: Integer): TEstado;
var
  sql: TStringList;
  qryBusca: TFDQuery;
  lEstado: TEstado;
begin
  if codigo > 0 then
  begin
    sql := TStringList.Create;

    sql.Add('SELECT *');
    sql.Add('FROM ESTADOS');
    sql.Add('WHERE CODIGO_ESTADO = ' + IntToStr(codigo));
    sql.Add('LIMIT = 1');

    qryBusca := FConexao.ExecuteQuery(sql);
    try
      if qryBusca.RecNo > 0 then
        lEstado := TEstado.Create;
        lEstado.Map(qryBusca);

        Result := lEstado;
    finally
      qryBusca.Free;
    end;
  end;
end;

{ TCidadeDAO }

function TCidadeDAO.BuscaPorCodigo(codigo: Integer): TCidade;
var
  sql: TStringList;
  qryBusca: TFDQuery;
  lCidade: TCidade;
begin
  if codigo > 0 then
  begin
    sql := TStringList.Create;

    sql.Add('SELECT *');
    sql.Add('FROM ESTADOS');
    sql.Add('WHERE CODIGO_ESTADO = ' + IntToStr(codigo));
    sql.Add('LIMIT = 1');

    qryBusca := FConexao.ExecuteQuery(sql);
    try
      if qryBusca.RecNo > 0 then
        lCidade := TCidade.Create;
        lCidade.Map(qryBusca);

        Result := lCidade;
    finally
      qryBusca.Free;
    end;
  end;
end;

end.
