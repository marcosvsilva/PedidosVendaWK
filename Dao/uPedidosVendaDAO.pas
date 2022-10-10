unit uPedidosVendaDAO;

interface

uses
  System.Generics.Collections, System.Classes, System.StrUtils,
  FireDAC.Comp.Client, SysUtils, uPersistencia, uConexao,
  uPedidosVenda, uPessoa, uPessoaDAO;

type
  TPedidosVendaDAO = class(TPersistencia<TPedidosVenda>)
  private
    function BuscaCliente(codigo: Integer): TCliente;
    function BuscaVendedor(codigo: Integer): TVendedor;
  public
    function BuscaPorCodigo(codigo: Integer): TPedidosVenda; override;
    function BuscarDados(nRegistros: Integer;
      filtro, ordem: TStringList): TList<TPedidosVenda>; overload; override;
    function BuscarDados(nRegistros: Integer):
      TList<TPedidosVenda>; overload;
    function InsertDados(dados: TList<TPedidosVenda>):
      TList<Integer>; override;
  end;

implementation

{ TPedidosVendaDAO }

function TPedidosVendaDAO.BuscaCliente(codigo: Integer): TCliente;
var
  lClienteDAO: TClienteDAO;
begin
  if codigo > 0 then
  begin
    lClienteDAO := TClienteDAO.Create;
    try
      Result := lClienteDAO.BuscaPorCodigo(codigo);
    finally
      lClienteDAO.Free;
    end;
  end;
end;

function TPedidosVendaDAO.BuscaVendedor(codigo: Integer): TVendedor;
var
  lVendedorDAO: TVendedorDAO;
begin
  if codigo > 0 then
  begin
    lVendedorDAO := TVendedorDAO.Create;
    try
      Result := lVendedorDAO.BuscaPorCodigo(codigo);
    finally
      lVendedorDAO.Free;
    end;
  end;
end;

function TPedidosVendaDAO.InsertDados(dados: TList<TPedidosVenda>):
  TList<Integer>;
var
  I: Integer;
  sqlInsert: TStringList;
  listResult: TList<Integer>;
begin
  if dados.Count > 0 then
  begin
    sqlInsert := TStringList.Create;
    listResult := TList<Integer>.Create;
    try
      for I := 0 to dados.Count -1 do
      begin
        sqlInsert.Clear;
        sqlInsert.Add('INSERT INTO PEDIDOS');
        sqlInsert.Add('(CODIGO_CLIENTE, CODIGO_VENDEDOR, DATA_EMISSAO,');
        sqlInsert.Add('STATUS, VALOR_DESCONTO, VALOR_TOTAL)');
        sqlInsert.Add('VALUES');
        sqlInsert.Add('(');
        sqlInsert.Add(IntToStr(dados[i].Cliente.CodigoCliente) + ',');
        sqlInsert.Add(IntToStr(dados[i].Vendedor.CodigoVendedor) + ',');

        sqlInsert.Add('STR_TO_DATE(' +
          QuotedStr(DateTimeToStr(dados[i].DataEmissao)) + ', ' +
          QuotedStr('%d/%m/%Y %H:%i:%s') + '),');

        if dados[i].Status = tspAberto then
          sqlInsert.Add(QuotedStr('A') + ',')
        else if dados[i].Status = tspFaturado then
          sqlInsert.Add(QuotedStr('F') + ',')
        else if dados[i].Status = tspCancelado then
          sqlInsert.Add(QuotedStr('C') + ',');
        sqlInsert.Add(FloatToStr(dados[i].ValorDesconto) + ',');
        sqlInsert.Add(FloatToStr(dados[i].ValorTotal));
        sqlInsert.Add(')');

        listResult.Add(FConexao.InsertData(sqlInsert));
      end;

      Result := listResult;
    finally
      sqlInsert.Free;
    end;
  end;
end;

function TPedidosVendaDAO.BuscaPorCodigo(codigo: Integer): TPedidosVenda;
var
  sql: TStringList;
  qryBusca: TFDQuery;
  lPedidosVenda: TPedidosVenda;
begin
  if codigo > 0 then
  begin
    sql := TStringList.Create;

    sql.Add('SELECT *');
    sql.Add('FROM PEDIDOS');
    sql.Add('WHERE NUMERO_PEDIDO = ' + IntToStr(codigo));
    sql.Add('LIMIT 1');

    qryBusca := FConexao.ExecuteQuery(sql);
    try
      if qryBusca.RecNo > 0 then
        lPedidosVenda := TPedidosVenda.Create;
        lPedidosVenda.Map(qryBusca);

        lPedidosVenda.Cliente := BuscaCliente(
          qryBusca.FieldByName('codigo_cliente').AsInteger);

        lPedidosVenda.Vendedor := BuscaVendedor(
          qryBusca.FieldByName('codigo_vendedor').AsInteger);

        Result := lPedidosVenda;
    finally
      qryBusca.Free;
    end;
  end;
end;

function TPedidosVendaDAO.BuscarDados(nRegistros: Integer; filtro,
  ordem: TStringList): TList<TPedidosVenda>;
var
  qryBusca: TFDQuery;
  sql: TStringList;
  I: Integer;
  listPedidosVenda: TList<TPedidosVenda>;
  lPedidoVendas: TPedidosVenda;
begin
  sql := TStringList.Create;

  sql.Add('SELECT *');
  sql.Add('FROM PEDIDOS');

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
      listPedidosVenda := TList<TPedidosVenda>.Create;

      while not qryBusca.Eof do
      begin
        lPedidoVendas := TPedidosVenda.Create;
        lPedidoVendas.Map(qryBusca);

        lPedidoVendas.Cliente := BuscaCliente(
          qryBusca.FieldByName('codigo_cliente').AsInteger);

        lPedidoVendas.Vendedor := BuscaVendedor(
          qryBusca.FieldByName('codigo_vendedor').AsInteger);

        listPedidosVenda.Add(lPedidoVendas);

        qryBusca.Next;
      end;

      Result := listPedidosVenda;
  finally
    qryBusca.Free;
  end;
end;

function TPedidosVendaDAO.BuscarDados(
  nRegistros: Integer): TList<TPedidosVenda>;
begin
  Result := BuscarDados(nRegistros, nil, nil);
end;

end.
