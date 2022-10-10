unit uProduto;

interface

uses
  FireDAC.Comp.Client;

type
  TProduto = class
  private
    FValorVenda: Double;
    FDescricao: String;
    FCodigo: Integer;
    FMarca: String;

    procedure SetCodigo(const Value: Integer);
    procedure SetDescricao(const Value: String);
    procedure SetValorVenda(const Value: Double);
    procedure SetMarca(const Value: String);
  public

    property Codigo: Integer read FCodigo write SetCodigo;
    property Descricao: String read FDescricao write SetDescricao;
    property Marca: String read FMarca write SetMarca;
    property ValorVenda: Double read FValorVenda write SetValorVenda;

    procedure Map(qryDados: TFDQuery); overload;
  end;

  TProdutoPedido = class(TProduto)
  private
    FValorTotal: Double;
    FQuantidade: Integer;
    FValorUnitario: Double;
    FNumeroPedido: Integer;
    FCodigoProdutoPedido: Integer;

    procedure SetQuantidade(const Value: Integer);
    procedure SetValorTotal(const Value: Double);
    procedure SetValorUnitario(const Value: Double);
    procedure SetNumeroPedido(const Value: Integer);
    procedure SetCodigoProdutoPedido(const Value: Integer);
  public
    property CodigoProdutoPedido: Integer read FCodigoProdutoPedido write SetCodigoProdutoPedido;
    property NumeroPedido: Integer read FNumeroPedido write SetNumeroPedido;
    property Quantidade: Integer read FQuantidade write SetQuantidade;
    property ValorUnitario: Double read FValorUnitario write SetValorUnitario;
    property ValorTotal: Double read FValorTotal write SetValorTotal;

    procedure Map(qryDados: TFDQuery); overload;
  end;

implementation

{ TProduto }

procedure TProduto.Map(qryDados: TFDQuery);
begin
  if (qryDados <> nil) and not qryDados.Eof then
  begin
    Self.Codigo := qryDados.FieldByName('codigo_produto').AsInteger;
    Self.Descricao := qryDados.FieldByName('descricao').AsString;
    Self.Marca := qryDados.FieldByName('marca').AsString;
    Self.ValorVenda := qryDados.FieldByName('valor_venda').AsFloat;
  end;
end;

{$region 'Sets TProduto'}

procedure TProduto.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TProduto.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TProduto.SetMarca(const Value: String);
begin
  FMarca := Value;
end;

procedure TProduto.SetValorVenda(const Value: Double);
begin
  FValorVenda := Value;
end;

{$endregion}

{ TProdutoPedido }

procedure TProdutoPedido.Map(qryDados: TFDQuery);
begin
  if (qryDados <> nil) and not qryDados.Eof then
  begin
    Self.CodigoProdutoPedido :=
      qryDados.FieldByName('codigo_produtos_pedidos').AsInteger;
    Self.NumeroPedido := qryDados.FieldByName('numero_pedido').AsInteger;
    Self.Quantidade := qryDados.FieldByName('quantidade').AsInteger;
    Self.ValorUnitario := qryDados.FieldByName('valor_unitario').AsFloat;
    Self.ValorTotal := qryDados.FieldByName('valor_total').AsFloat;
  end;
end;

{$region 'Sets TProdutoPedido}

procedure TProdutoPedido.SetCodigoProdutoPedido(const Value: Integer);
begin
  FCodigoProdutoPedido := Value;
end;

procedure TProdutoPedido.SetNumeroPedido(const Value: Integer);
begin
  FNumeroPedido := Value;
end;

procedure TProdutoPedido.SetQuantidade(const Value: Integer);
begin
  FQuantidade := Value;
end;

procedure TProdutoPedido.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

procedure TProdutoPedido.SetValorUnitario(const Value: Double);
begin
  FValorUnitario := Value;
end;

{$endregion}

end.
