unit uPedidosVendaControl;

interface

uses
  System.Generics.Collections, System.SysUtils,
  uPedidosVenda, uProduto, uPessoa, uPedidosVendaDAO, uPessoaDAO, uProdutoDAO;

type
  TPedidosVendaControl = class
  private
    FCodigoCliente: Integer;
    FCodigoVendedor: Integer;
    FListProdutos: TList<TProdutoPedido>;
    
    FPedidosVendaDAO: TPedidosVendaDAO;
    FProdutoDAO: TProdutoDAO;

    procedure SetCodigoCliente(const Value: Integer);
    procedure SetCodigoVendedor(const Value: Integer);
    procedure SetListProdutos(const Value: TList<TProdutoPedido>);
  public
    constructor Create;
    destructor Destroy;

    property CodigoVendedor: Integer
      read FCodigoVendedor write SetCodigoVendedor;
    property CodigoCliente: Integer
      read FCodigoCliente write SetCodigoCliente;
    property ListProdutos: TList<TProdutoPedido>
      read FListProdutos write SetListProdutos;

    function GravarPedido(FPedidosVenda: TPedidosVenda): Boolean;
  end;

implementation

{ TPedidosVendaControl }

constructor TPedidosVendaControl.Create;
begin
  if FPedidosVendaDAO = nil then
    FPedidosVendaDAO := TPedidosVendaDAO.Create;

  if FProdutoDAO = nil then
    FProdutoDAO := TProdutoDAO.Create;
end;

destructor TPedidosVendaControl.Destroy;
begin
  if FPedidosVendaDAO <> nil then
    FPedidosVendaDAO.Free;

  if FProdutoDAO <> nil then
    FProdutoDAO.Free;
end;

function TPedidosVendaControl.
  GravarPedido(FPedidosVenda: TPedidosVenda):Boolean;
var
  lClienteDAO: TClienteDAO;
  lVendedorDAO: TVendedorDAO;
  lListPedidos: TList<TPedidosVenda>;
  lListCodigosPedidos: TList<Integer>;
  lListCodigosProdutos: TList<Integer>;
  lCodigoPedidoNovo: Integer;
  I: Integer;
begin
  if FCodigoCliente <= 0 then
  begin
    Exception.Create('Cliente nao configuado!');
  end;

  if FCodigoVendedor <= 0 then
  begin
    Exception.Create('Vendedor nao configuado!');
  end;

  if FPedidosVenda = nil then
  begin
    Exception.Create('Pedido de venda invalido!');
  end;

  if FListProdutos.Count <= 0 then
  begin
    Exception.Create('Produtos nao selecionados!');
  end;

  lClienteDAO := TClienteDAO.Create;
  lVendedorDAO := TVendedorDAO.Create;
  lListPedidos := TList<TPedidosVenda>.Create;
  try
    FPedidosVenda.Cliente :=  lClienteDAO.BuscaPorCodigo(FCodigoCliente);
    FPedidosVenda.Vendedor := lVendedorDAO.BuscaPorCodigo(FCodigoVendedor);

    lListPedidos.Add(FPedidosVenda);
    lListCodigosPedidos := FPedidosVendaDAO.InsertDados(lListPedidos);

    if (lListCodigosPedidos <> nil) and (lListCodigosPedidos.Count > 0) then
    begin
      for I := 0 to FListProdutos.Count - 1 do
      begin
        FListProdutos[I].NumeroPedido :=
          lListCodigosPedidos[lListCodigosPedidos.Count - 1];
      end;
    end;

    lListCodigosProdutos := FProdutoDAO.InsertDados(FListProdutos);
    Result := lListCodigosProdutos.Count > 0;
  finally
    lClienteDAO.free;
    lVendedorDAO.Free;
    lListPedidos.Free;
    if lListCodigosPedidos <> nil then
      lListCodigosPedidos.Free;
  end;
end;

{$region 'Sets TPedidosVendaControl'}

procedure TPedidosVendaControl.SetCodigoCliente(const Value: Integer);
begin
  FCodigoCliente := Value;
end;

procedure TPedidosVendaControl.SetCodigoVendedor(const Value: Integer);
begin
  FCodigoVendedor := Value;
end;

procedure TPedidosVendaControl.SetListProdutos(
  const Value: TList<TProdutoPedido>);
begin
  FListProdutos := Value;
end;

{$endregion}

end.
