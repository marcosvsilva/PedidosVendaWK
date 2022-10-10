unit uPedidosVenda;

interface

uses
  System.StrUtils, FireDAC.Comp.Client, uPessoa;

type
  TStatusPedido = (tspAberto, tspFaturado, tspCancelado);

  TPedidosVenda = Class
  private
    FNumero: Integer;
    FDataEmissao: TDatetime;
    FValorDesconto: Double;
    FStatus: TStatusPedido;
    FDataFaturamento: TDateTime;
    FValorTotal: Double;
    FCliente: TCliente;
    FVendedor: TVendedor;

    procedure SetNumero(const Value: Integer);
    procedure SetDataEmissao(const Value: TDatetime);
    procedure SetStatus(const Value: TStatusPedido);
    procedure SetValorDesconto(const Value: Double);
    procedure SetDataFaturamento(const Value: TDateTime);
    procedure SetValorTotal(const Value: Double);
    procedure SetCliente(const Value: TCliente);
    procedure SetVendedor(const Value: TVendedor);
  public
    property Numero: Integer read FNumero write SetNumero;
    property Cliente: TCliente read FCliente write SetCliente;
    property Vendedor: TVendedor read FVendedor write SetVendedor;
    property DataEmissao: TDatetime read FDataEmissao write SetDataEmissao;
    property Status: TStatusPedido read FStatus write SetStatus;
    property ValorDesconto: Double read FValorDesconto write SetValorDesconto;
    property ValorTotal: Double read FValorTotal write SetValorTotal;
    property DataFaturamento: TDateTime read FDataFaturamento
      write SetDataFaturamento;

    procedure Map(qryDados: TFDQuery); overload;
  End;

implementation


{ TPedidosVenda }

procedure TPedidosVenda.Map(qryDados: TFDQuery);
begin
  if (qryDados <> nil) and not qryDados.Eof then
  begin
    Self.Numero := qryDados.FieldByName('numero_pedido').AsInteger;
    Self.DataEmissao := qryDados.FieldByName('data_emissao').AsDateTime;
    Self.ValorDesconto := qryDados.FieldByName('valor_desconto').AsFloat;
    Self.ValorTotal := qryDados.FieldByName('valor_total').AsFloat;
    Self.DataFaturamento := qryDados.FieldByName('data_faturamento').AsDateTime;

    case IndexStr(qryDados.FieldByName('status').AsString,
      ['A', 'F', 'C']) of
      0: Self.Status := tspAberto;
      1: Self.Status := tspFaturado;
      2: Self.Status := tspCancelado;
    end;
  end;
end;

{$region 'Sets TPedidosVenda'}

procedure TPedidosVenda.SetCliente(const Value: TCliente);
begin
  FCliente := Value;
end;

procedure TPedidosVenda.SetDataEmissao(const Value: TDatetime);
begin
  FDataEmissao := Value;
end;

procedure TPedidosVenda.SetDataFaturamento(const Value: TDateTime);
begin
  FDataFaturamento := Value;
end;

procedure TPedidosVenda.SetNumero(const Value: Integer);
begin
  FNumero := Value;
end;

procedure TPedidosVenda.SetStatus(const Value: TStatusPedido);
begin
  FStatus := Value;
end;

procedure TPedidosVenda.SetValorDesconto(const Value: Double);
begin
  FValorDesconto := Value;
end;

procedure TPedidosVenda.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

procedure TPedidosVenda.SetVendedor(const Value: TVendedor);
begin
  FVendedor := Value;
end;

{$endregion}

end.
