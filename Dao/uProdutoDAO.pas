unit uProdutoDAO;

interface

uses
  System.Generics.Collections, System.Classes, System.StrUtils,
  FireDAC.Comp.Client, SysUtils, uPersistencia, uProduto, uConexao;

type
  TProdutoDAO = class(TPersistencia<TProduto>)
  public
    function BuscaPorCodigo(codigo: Integer): TProduto; override;
    function BuscarDados(nRegistros: Integer;
      filtro, ordem: TStringList): TList<TProduto>; overload; override;
    function BuscarDados(nRegistros: Integer):
      TList<TProduto>; overload;
  end;

implementation

{ TProdutoDAO }

function TProdutoDAO.BuscaPorCodigo(codigo: Integer): TProduto;
var
  sql: TStringList;
  qryBusca: TFDQuery;
  lProduto: TProduto;
begin
  if codigo > 0 then
  begin
    sql := TStringList.Create;

    sql.Add('SELECT *');
    sql.Add('FROM PRODUTOS');
    sql.Add('WHERE CODIGO_PRODUTO = ' + IntToStr(codigo));
    sql.Add('LIMIT = 1');

    qryBusca := FConexao.ExecuteQuery(sql);
    try
      if qryBusca.RecNo > 0 then
        lProduto := TProduto.Create;
        lProduto.Map(qryBusca);

        Result := lProduto;
    finally
      qryBusca.Free;
    end;
  end;
end;

function TProdutoDAO.BuscarDados(nRegistros: Integer; filtro,
  ordem: TStringList): TList<TProduto>;
var
  qryBusca: TFDQuery;
  sql: TStringList;
  I: Integer;
  listProdutos: TList<TProduto>;
  lProduto: TProduto;
begin
  sql := TStringList.Create;

  sql.Add('SELECT *');
  sql.Add('FROM PRODUTOS');

  if (filtro <> nil) and (filtro.Count > 0) then
  begin
    sql.Add('WHERE');

    for I := 0 to filtro.Count - 1 do
      sql.add(filtro[i]);
  end;

  if (ordem <> nil) and (ordem.Count > 0) then
  begin
    sql.Add('ORDER BY');

    for I := 0 to ordem.Count - 1 do
      sql.add(ordem[i]);
  end;

  if nRegistros > 0 then
    sql.Add('LIMIT ' + IntToStr(nRegistros));

  qryBusca := FConexao.ExecuteQuery(sql);
  try
    if qryBusca.RecNo > 0 then
      listProdutos := TList<TProduto>.Create;

      while not qryBusca.Eof do
      begin
        lProduto := TProduto.Create;
        lProduto.Map(qryBusca);
        listProdutos.Add(lProduto);

        qryBusca.Next;
      end;

      Result := listProdutos;
  finally
    qryBusca.Free;
  end;
end;

function TProdutoDAO.BuscarDados(nRegistros: Integer): TList<TProduto>;
begin
  Result := BuscarDados(nRegistros, nil, nil);
end;

end.
