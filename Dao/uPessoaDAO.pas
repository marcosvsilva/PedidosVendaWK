unit uPessoaDAO;

interface

uses
  System.Generics.Collections, System.Classes, System.StrUtils,
  FireDAC.Comp.Client, SysUtils, uPersistencia, uPessoa, uConexao;

type
  TPessoaDAO = class(TPersistencia<TPessoa>)
  public 
    function BuscaPorCodigo(codigo: Integer): TPessoa; override;
    function BuscarDados(nRegistros: Integer;
      filtro, ordem: TStringList): TList<TPessoa>; overload; override;
    function BuscarDados(nRegistros: Integer):
      TList<TPessoa>; overload;
  end;

  TClienteDAO = class(TPersistencia<TCliente>)
  public 
    function BuscaPorCodigo(codigo: Integer): TCliente; override;
    function BuscarDados(nRegistros: Integer;
      filtro, ordem: TStringList): TList<TCliente>; overload; override;
    function BuscarDados(nRegistros: Integer):
      TList<TCliente>; overload;
  end;

  TVendedorDAO = class(TPersistencia<TVendedor>)
  public 
    function BuscaPorCodigo(codigo: Integer): TVendedor; override;
    function BuscarDados(nRegistros: Integer;
      filtro, ordem: TStringList): TList<TVendedor>; overload; override;
    function BuscarDados(nRegistros: Integer):
      TList<TVendedor>; overload;
  end;

implementation

{ TPessoaDAO }

function TPessoaDAO.BuscaPorCodigo(codigo: Integer): TPessoa;
var
  sql: TStringList;
  qryBusca: TFDQuery;
  lPessoa: TPessoa;
begin
  if codigo > 0 then
  begin
    sql := TStringList.Create;

    sql.Add('SELECT *');
    sql.Add('FROM PESSOAS PES');
    sql.Add('LEFT JOIN CIDADES CID');
    sql.Add('ON PES.CODIGO_CIDADE = CID.CODIGO_CIDADE');
    sql.Add('LEFT JOIN ESTADOS EST');
    sql.Add('ON EST.CODIGO_ESTADO = CID.CODIGO_ESTADO');
    sql.Add('WHERE PES.CODIGO_PESSOA = ' + IntToStr(codigo));
    sql.Add('LIMIT = 1');

    qryBusca := FConexao.ExecuteQuery(sql);
    try
      if qryBusca.RecNo > 0 then
        lPessoa := TPessoa.Create;
        lPessoa.Map(qryBusca);
      
        Result := lPessoa;
    finally
      qryBusca.Free;
    end;
  end;
end; 

function TPessoaDAO.BuscarDados(nRegistros: Integer; filtro,
  ordem: TStringList): TList<TPessoa>;
var
  qryBusca: TFDQuery;
  sql: TStringList;
  I: Integer;
  listPessoas: TList<TPessoa>;
  lPessoa: TPessoa;
begin
  sql := TStringList.Create;
  
  sql.Add('SELECT *');
  sql.Add('FROM PESSOAS PES');
  sql.Add('LEFT JOIN CIDADES CID');
  sql.Add('ON PES.CODIGO_CIDADE = CID.CODIGO_CIDADE');
  sql.Add('LEFT JOIN ESTADOS EST');
  sql.Add('ON EST.CODIGO_ESTADO = CID.CODIGO_ESTADO');

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
      listPessoas := TList<TPessoa>.Create;
      
      while not qryBusca.Eof do
      begin
        lPessoa := TPessoa.Create;
        lPessoa.Map(qryBusca);
        listPessoas.Add(lPessoa);

        qryBusca.Next;
      end;
      
      Result := listPessoas;
  finally
    qryBusca.Free;
  end;
end; 

function TPessoaDAO.BuscarDados(nRegistros: Integer): TList<TPessoa>;
begin
  Result := BuscarDados(nRegistros, nil, nil);
end;

{ TClienteDAO }

function TClienteDAO.BuscaPorCodigo(codigo: Integer): TCliente;
var
  sql: TStringList;
  qryBusca: TFDQuery;
  lCliente: TCliente;
begin
  if codigo > 0 then
  begin
    sql := TStringList.Create;

    sql.Add('SELECT *');
    sql.Add('FROM CLIENTES CLI');
    sql.Add('LEFT JOIN PESSOAS PES');
    sql.Add('ON CLI.CODIGO_PESSOA = PES.CODIGO_PESSOA');
    sql.Add('LEFT JOIN CIDADES CID');
    sql.Add('ON PES.CODIGO_CIDADE = CID.CODIGO_CIDADE');
    sql.Add('LEFT JOIN ESTADOS EST');
    sql.Add('ON EST.CODIGO_ESTADO = CID.CODIGO_ESTADO');
    sql.Add('WHERE CLI.CODIGO_PESSOA = ' + IntToStr(codigo));
    sql.Add('LIMIT = 1');

    qryBusca := FConexao.ExecuteQuery(sql);
    try
      if qryBusca.RecNo > 0 then
        lCliente := TCliente.Create;
        lCliente.Map(qryBusca);
      
        Result := lCliente;
    finally
      qryBusca.Free;
    end;
  end;
end; 

function TClienteDAO.BuscarDados(nRegistros: Integer; filtro,
  ordem: TStringList): TList<TCliente>;
var
  qryBusca: TFDQuery;
  sql: TStringList;
  I: Integer;
  listClientes: TList<TCliente>;
  lCliente: TCliente;
begin
  sql := TStringList.Create;
  
  sql.Add('SELECT *');
  sql.Add('FROM CLIENTES CLI');
  sql.Add('LEFT JOIN PESSOAS PES');
  sql.Add('ON CLI.CODIGO_PESSOA = PES.CODIGO_PESSOA');
  sql.Add('LEFT JOIN CIDADES CID');
  sql.Add('ON PES.CODIGO_CIDADE = CID.CODIGO_CIDADE');
  sql.Add('LEFT JOIN ESTADOS EST');
  sql.Add('ON EST.CODIGO_ESTADO = CID.CODIGO_ESTADO');

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
      listClientes := TList<TCliente>.Create;
      
      while not qryBusca.Eof do
      begin
        lCliente := TCliente.Create;
        lCliente.Map(qryBusca);
        
        listClientes.Add(lCliente);
        qryBusca.Next;
      end;
      
      Result := listClientes;
  finally
    qryBusca.Free;
  end;
end; 

function TClienteDAO.BuscarDados(nRegistros: Integer): TList<TCliente>;
begin
  Result := BuscarDados(nRegistros, nil, nil);
end;

{ TVendedorDAO }

function TVendedorDAO.BuscaPorCodigo(codigo: Integer): TVendedor;
var
  sql: TStringList;
  qryBusca: TFDQuery;
  lVendedor: TVendedor;
begin
  if codigo > 0 then
  begin
    sql := TStringList.Create;

    sql.Add('SELECT *');
    sql.Add('FROM VENDEDORES VEN');
    sql.Add('LEFT JOIN PESSOAS PES');
    sql.Add('ON VEN.CODIGO_PESSOA = PES.CODIGO_PESSOA');
    sql.Add('LEFT JOIN CIDADES CID');
    sql.Add('ON PES.CODIGO_CIDADE = CID.CODIGO_CIDADE');
    sql.Add('LEFT JOIN ESTADOS EST');
    sql.Add('ON EST.CODIGO_ESTADO = CID.CODIGO_ESTADO');
    sql.Add('WHERE VEN.CODIGO_VENDEDOR = ' + IntToStr(codigo));
    sql.Add('LIMIT = 1');

    qryBusca := FConexao.ExecuteQuery(sql);
    try
      if qryBusca.RecNo > 0 then
        lVendedor := TVendedor.Create;
        lVendedor.Map(qryBusca);
      
        Result := lVendedor;
    finally
      qryBusca.Free;
    end;
  end;
end; 

function TVendedorDAO.BuscarDados(nRegistros: Integer; filtro,
  ordem: TStringList): TList<TVendedor>;
var
  qryBusca: TFDQuery;
  sql: TStringList;
  I: Integer;
  listVendedores: TList<TVendedor>;
  lVendedor: TVendedor;
begin
  sql := TStringList.Create;
  
  sql.Add('SELECT *');
  sql.Add('FROM VENDEDORES VEN');
  sql.Add('LEFT JOIN PESSOAS PES');
  sql.Add('ON VEN.CODIGO_PESSOA = PES.CODIGO_PESSOA');
  sql.Add('LEFT JOIN CIDADES CID');
  sql.Add('ON PES.CODIGO_CIDADE = CID.CODIGO_CIDADE');
  sql.Add('LEFT JOIN ESTADOS EST');
  sql.Add('ON EST.CODIGO_ESTADO = CID.CODIGO_ESTADO');

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
      listVendedores := TList<TVendedor>.Create;
      
      while not qryBusca.Eof do
      begin
        lVendedor := TVendedor.Create;
        lVendedor.Map(qryBusca);
        
        listVendedores.Add(lVendedor);
        qryBusca.Next;
      end;
      
      Result := listVendedores;
  finally
    qryBusca.Free;
  end;
end; 

function TVendedorDAO.BuscarDados(nRegistros: Integer): TList<TVendedor>;
begin
    Result := BuscarDados(nRegistros, nil, nil);
end;

end.
