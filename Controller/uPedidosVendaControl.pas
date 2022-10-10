unit uPedidosVendaControl;

interface

uses
  System.Generics.Collections, System.SysUtils,
  uPedidosVenda, uProduto, uPessoaDAO, uPessoa;

type
  TPedidosVendaControl = class
  private
    FCodigoCliente: Integer;
    FCodigoVendedor: Integer;
    FPedidosVenda: TPedidosVenda;
    FListProdutos: TList<TProdutoPedido>;
    FClienteDAO: TClienteDAO;
    FVendedorDAO: TVendedorDAO;

    procedure SetCodigoCliente(const Value: Integer);
    procedure SetCodigoVendedor(const Value: Integer);
    procedure SetListProdutos(const Value: TList<TProdutoPedido>);
    procedure SetPedidosVenda(const Value: TPedidosVenda);
  public
    constructor Create;
    destructor Destroy;

    property CodigoVendedor: Integer
      read FCodigoVendedor write SetCodigoVendedor;
    property CodigoCliente: Integer
      read FCodigoCliente write SetCodigoCliente;
    property PedidosVenda: TPedidosVenda
      read FPedidosVenda write SetPedidosVenda;
    property ListProdutos: TList<TProdutoPedido>
      read FListProdutos write SetListProdutos;

    procedure GravarPedido;
  end;

implementation

{ TPedidosVendaControl }

constructor TPedidosVendaControl.Create;
begin
  if FClienteDAO = nil then
    FClienteDAO := FClienteDAO.Create;

  if FVendedorDAo = nil then
    FVendedorDAO := TVendedorDAO.Create;
end;

destructor TPedidosVendaControl.Destroy;
begin
  if FClienteDAO <> nil then
    FClienteDAO.Free;

  if FVendedorDAo <> nil then
    FVendedorDAO.Free;
end;

procedure TPedidosVendaControl.GravarPedido;
var
  lCliente: TCliente;
  lVendedor: TVendedor;
begin
  if FCodigoCliente <= 0 then
  begin
    Exception.Create('Cliente nao configuado!');
  end;

  if FCodigoVendedor <= 0 then
  begin
    Exception.Create('Vendedor nao configuado!');
  end;

  lCliente := FClienteDAO.BuscaPorCodigo(FCodigoCliente);
  if lCliente = nil then
    Exception.Create('Cliente invalido!');

  lVendedor := FVendedorDAO.BuscaPorCodigo(FCodigoVendedor);
  if lVendedor = nil then
    Exception.Create('Vendedor invalido!');
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

procedure TPedidosVendaControl.SetPedidosVenda(const Value: TPedidosVenda);
begin
  FPedidosVenda := Value;
end;

{$endregion}

end.
